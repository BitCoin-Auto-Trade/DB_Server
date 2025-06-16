TIMESTAMP=$(date +%F_%T)
mkdir -p backup/redis
docker exec redis redis-cli SAVE
docker cp redis:/data/dump.rdb ./backup/redis/redis_backup_$TIMESTAMP.rdb