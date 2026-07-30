#!/bin/bash
# Цикл for - перебираем файлы

echo "Все файлы в папке projects:"
for file in ~/devops-practice/projects/*; do
    echo " -$file"
done
