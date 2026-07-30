#!/bin/bash
# Умный бэкап с датой и временем

BACKUP_DIR=~/devops-practice/backups
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
SOURCE_DIR=~/devops-practice/projects
# Создает папку если её нет
mkdir -p $BACKUP_DIR
cp -r $SOURCE_DIR "$BACKUP_DIR/backup_$TIMESTAMP"

echo "✅ Бекап создан: $BACKUP_DIR/backup_$TIMESTAMP"

