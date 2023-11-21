#!/bin/bash

if [ -n "$FAKETIME" ]; then
  fake-hwclock save
  date -s "$FAKETIME"
  fake-hwclock load
fi

# Запускаем переданную команду
exec "$@"
