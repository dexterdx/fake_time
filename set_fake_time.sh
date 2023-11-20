#!/bin/bash

if [ -n "$FAKETIME" ]; then
  date -s "$FAKETIME"
fi

# Запускаем переданную команду
exec "$@"
