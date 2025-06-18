TIMESTAMP=$(date +%F_%T)
mkdir -p backup/postgres

echo "[INFO] Waiting for Postgres to be ready..."
until docker exec postgres pg_isready -U $POSTGRES_USER > /dev/null 2>&1; do
  sleep 1
done

echo "[INFO] Backing up Postgres..."
docker exec postgres pg_dump -U $POSTGRES_USER $POSTGRES_DB > ./backup/postgres/pg_backup_$TIMESTAMP.sql

echo "[INFO] Postgres backup done!"
