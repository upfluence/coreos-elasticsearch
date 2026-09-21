### Snapshot script

- Registry a snapshot repository
```bash
curl -XPUT -H 'Content-Type: application/json' 'http://localhost:9200/_snapshot/s3_backup' -d '{"type": "s3", "settings": { "bucket": "bucket_name"}}'
```

- Create a snapshot
```bash
curl -XPUT http://localhost:9200/_snapshot/s3_backup/daily_$((`date + '%j'` % 4))?wait_for_completion=true
```

- Restore a snapshot
```bash
curl -XPOST http://localhost:9200/_snapshot/s3_backup/daily_$(((`date + '%j'` - 1) % 4))/_restore
```
