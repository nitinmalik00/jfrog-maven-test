#!/bin/bash
set -exv

BACKUP_PATH="/opt/data-backup"
BACKUP_DIR="es_backup"
BACKUP_FILE="es_backup.tar.bz2"

cd "$BACKUP_PATH"

if [ -d "$BACKUP_DIR" ]
then
 rm -rf "$BACKUP_DIR"
fi

if [ -f "$BACKUP_FILE" ]
then
 rm -rf "$BACKUP_FILE"
fi

if [ ! -d "$BACKUP_DIR" ]
then
 mkdir -p "$BACKUP_DIR"
fi


multielasticdump --direction=dump --input=http://10.51.115.3:9200 --output=es_backup --limit 10000

status=$(echo $?)
if [ "$status" == 0 ]
then
 tar -cvjf "$BACKUP_FILE" "$BACKUP_DIR"
 ## copying this backup  to s3 bucket
 S3_DIR_NAME=es-data-backup-hyd
 S3_BUCKET=s3://flow-elasticsearch-backup
 /usr/bin/s3cmd -c /opt/scripts/D42_config/jenkins-s3-cfg put "$BACKUP_FILE" $S3_BUCKET/"$S3_DIR_NAME"/"$BACKUP_DIR"-`date +%F-%H`.tar.bz2
 echo "Backup dump is completed successfully"
else
 echo "Backup dump failed"
fi
