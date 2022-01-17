# TRMM-Docker-Backup-Script

## Description

A fork of https://github.com/piscue/docker-backup-scripts

This Repository helps you to create backups for Tactical RMM Docker

## Setup and Usage

Check inside **backup-all.sh** to set the **backup_path** variable point at
your current backup folder

Uncomment **days**, if you like to delete backups after a certain amount of days.

Give permissions to all sh files in the folder
```bash
cd docker-backup-scripts
chmod +x *.sh
```

Run the backup
```bash
./backup-all.sh
```

## Extra

Create a cron if you want to run it often.
