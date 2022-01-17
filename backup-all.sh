#!/bin/bash

# by piscue
# forked by larseberhardt

# Setting variables
backup_path="/mnt/backup/trmm"
#backup_path="/mnt/backupServer/trmm"

# Delete backups which are older then xx days
# days=14

## Nothing to edit after this anymore

tar_opts="--exclude='/var/run/*'"
cd "${BASH_SOURCE%/*}" || exit
# Set Date for files
date=$(date +%Y-%m-%d-%H-%M)
# If there no directory, the following command will create one
mkdir -p $backup_path

echo starting TRMM Docker Backup

echo ""

echo - backing up TRMM images

echo ""

source backup-images.sh

echo ""

echo - backing up TRMM volumes

echo ""

source backup-volumes.sh

echo ""

echo - Backup completed