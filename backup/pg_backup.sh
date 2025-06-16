TIMESTAMP=$(date +%F_%T)
mkdir -p backup/postgres
docker exec postgres pg_dump -U $POSTGRES_USER $POSTGRES_DB > ./backup/postgres/pg_backup_$TIMESTAMP.sql