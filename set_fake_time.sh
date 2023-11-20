#!/bin/bash

if [ -n "$FAKETIME" ]; then
  date --set="$FAKETIME"
fi

# Запускаем переданную команду
exec "$@"
