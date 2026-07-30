#!/bin/bash
# Скрипт проверяет, существует ли папка projects

 if [ -d ~/devops-practice/projects ]; then
    echo "Папка projects существует!"
else
    echo "Папка projects НЕ найдена!"
fi
