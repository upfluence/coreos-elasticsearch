### Snapshots

Snapshots are managed by SLM (snapshot lifecycle management). The policy and
the retention schedule live in the cluster state: configure them once through
the API, they are kept across restarts and upgrades.

- Register the S3 repository (credentials come from the EC2 instance profile, `ec2-core`)
```bash
curl -XPUT -H 'Content-Type: application/json' 'http://localhost:9200/_snapshot/s3_backup' -d '{"type": "s3", "settings": { "bucket": "bucket_name"}}'
```

- Create the nightly policy: one snapshot per day at 03:00 UTC, the last 4 are kept
```bash
curl -XPUT -H 'Content-Type: application/json' 'http://localhost:9200/_slm/policy/nightly' -d '{
  "schedule": "0 0 3 * * ?",
  "name": "<nightly-{now/d}>",
  "repository": "s3_backup",
  "config": { "indices": "*", "include_global_state": true, "partial": false },
  "retention": { "max_count": 4 }
}'
```

- Run the retention right after the snapshot (default is 01:30 UTC, before it), so only 4 snapshots are kept most of the time
```bash
curl -XPUT -H 'Content-Type: application/json' 'http://localhost:9200/_cluster/settings' -d '{"persistent": {"slm.retention_schedule": "0 0 5 * * ?"}}'
```

- Run the policy now and check it
```bash
curl -XPOST 'http://localhost:9200/_slm/policy/nightly/_execute'
curl 'http://localhost:9200/_slm/policy/nightly?human'
curl 'http://localhost:9200/_slm/stats'
```

- Pause or resume every SLM policy
```bash
curl -XPOST 'http://localhost:9200/_slm/stop'
curl -XPOST 'http://localhost:9200/_slm/start'
```

Retention only deletes snapshots created by the `nightly` policy: manual
snapshots (e.g. before an upgrade) are kept until deleted by hand.

- Create a manual snapshot
```bash
curl -XPUT 'http://localhost:9200/_snapshot/s3_backup/pre-upgrade?wait_for_completion=true'
```

- Restore the latest nightly snapshot
```bash
curl 'http://localhost:9200/_snapshot/s3_backup/nightly-*?size=1&sort=start_time&order=desc&filter_path=snapshots.snapshot'
curl -XPOST 'http://localhost:9200/_snapshot/s3_backup/<snapshot>/_restore'
```
