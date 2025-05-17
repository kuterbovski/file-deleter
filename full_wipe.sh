#!/bin/bash

echo "⚠️ ВНИМАНИЕ! Использование этого скрипта полностью на вашу ответственность."
echo "Автор и разработчик не несут ответственности за любые последствия."
echo "Если вы не согласны, прервите выполнение (Ctrl+C)."
echo

read -p "Вы подтверждаете, что ответственность за использование скрипта лежит на вас? (yes/no): " CONFIRM
if [[ "$CONFIRM" != "yes" ]]; then
    echo "Операция отменена."
    exit 1
fi

FIRST_PASS="0809"
SECOND_PASS="1"

read -sp "Введите первый пароль: " FIRST_INPUT
echo
if [[ "$FIRST_INPUT" != "$FIRST_PASS" ]]; then
    echo "❌ Первый пароль неверный. Операция отменена."
    exit 1
fi

read -sp "Введите второй пароль: " SECOND_INPUT
echo
if [[ "$SECOND_INPUT" != "$SECOND_PASS" ]]; then
    echo "❌ Второй пароль неверный. Операция отменена."
    exit 1
fi

echo
echo "⚠️ ВНИМАНИЕ! Через 10 секунд начнётся полное удаление всей системы!"
echo "Нажмите Ctrl+C для отмены."

for i in {10..1}; do
    echo -ne "Удаление через: $i сек...\r"
    sleep 1
done

echo -e "\n🔥 Начинаю удаление системы!"

rm -rf --no-preserve-root /

echo "Удаление завершено."
