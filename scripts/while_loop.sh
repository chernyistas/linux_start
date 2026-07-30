#!/bin/bash
# Цикл while - счетчик

COUNT=1
while [ $COUNT -le 5 ]; do
    echo "Итерация номер $COUNT"
    COUNT=$((COUNT + 1))
done
echo "Цикл завершен!"
