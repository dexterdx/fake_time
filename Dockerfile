FROM ubuntu

# Копируем скрипт для установки фиктивного времени
COPY set_fake_time.sh /usr/local/bin/set_fake_time.sh

# Даем права на выполнение скрипта
RUN chmod +x /usr/local/bin/set_fake_time.sh

# Установка временной зоны
RUN ln -snf /usr/share/zoneinfo/Europe/Moscow /etc/localtime && echo "Europe/Moscow" > /etc/timezone

# Устанавливаем необходимые пакеты (пример)
RUN apt-get update && \
    apt-get install -y \
    your_dependency_package1 \
    your_dependency_package2 \
    && rm -rf /var/lib/apt/lists/*
    
CMD ["/usr/local/bin/set_fake_time.sh", "tail", "-f", "/dev/null"]
