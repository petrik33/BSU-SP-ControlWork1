#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Ошибка: передайте полный путь к каталогу в качестве аргумента."
  exit 1
fi

dir=$1

echo "Путь к каталогу: $dir"
echo "Количество файлов в каталоге: $(find "$dir" -type f | wc -l)"
echo "Количество вложенных каталогов: $(find "$dir" -mindepth 1 -type d -not -path "$dir" | wc -l)"
echo "Самый большой файл в каталоге: $(find "$dir" -type f -printf "%s %p\n" | sort -nr | head -1 | awk '{print $2}')"
echo "Полный путь к файлу в верхнем регистре: $(find "$dir" -type f -printf "%p\n" | grep -E "/[A-Z]" | head -1)"

exit 0
