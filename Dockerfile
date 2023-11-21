FROM ubuntu

# Устанавливаем необходимые пакеты
RUN apt-get update && \
    apt-get install -y \
    fake-hwclock \
    && rm -rf /var/lib/apt/lists/*

# Копируем скрипт для установки фиктивного времени
COPY set_fake_time.sh /usr/local/bin/set_fake_time.sh

# Даем права на выполнение скрипта
RUN chmod +x /usr/local/bin/set_fake_time.sh

# Установка временной зоны
RUN ln -snf /usr/share/zoneinfo/Europe/Moscow /etc/localtime && echo "Europe/Moscow" > /etc/timezone

# CMD остается таким, как в предыдущих примерах
CMD ["/usr/local/bin/set_fake_time.sh", "tail", "-f", "/dev/null"]

