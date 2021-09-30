#!/bin/bash
set -exv

D42_BUCKET_PATH="$1"

#D42 config location path
D42_CONFIG_PATH=/opt/scripts/D42_config/jenkins-s3-cfg

#BACKUP_ZONE ch or hyd
BACKUP_ZONE="hyd"

script_execute()
{

    BUCKET_PATH="$1"
    if [ "$BUCKET_PATH" != "" ]
    then
        cnt=12
        /usr/bin/s3cmd -c "$D42_CONFIG_PATH" ls -l s3://flow-elasticsearch-backup/"$BUCKET_PATH"/ |awk '{print $6}'|head -n -"$cnt"|while read -r lines
        do
         /usr/bin/s3cmd -c $D42_CONFIG_PATH del "$lines"
	       echo "Deleting "$lines""
        done

    fi

}

script_execute "$D42_BUCKET_PATH"
