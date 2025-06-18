TIMESTAMP=$(date +%F_%T)
mkdir -p backup/redis

echo "[INFO] Forcing Redis SAVE..."
docker exec redis redis-cli -a $REDIS_PASSWORD SAVE

# 디스크 쓰기 반영 기다림
sleep 2

echo "[INFO] Copying Redis dump..."
docker cp redis:/data/dump.rdb ./backup/redis/redis_backup_$TIMESTAMP.rdb

echo "[INFO] Redis backup done!"