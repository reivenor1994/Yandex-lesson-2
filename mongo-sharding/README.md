# pymongo-api

## Как запустить

1. Запускаем mongodb и приложение

```shell
docker compose up -d
```

2. Инициализируем сервер конфигурации
```shell
./scripts/init-mongo-config.sh
```

3. Инициализируем шарды
```shell
./scripts/init-mongo-shards.sh
```

4. Инициализируем роутер и наполняем данными
```shell
./scripts/init-mongo-router.sh
```

## Как проверить

### В браузере
Откройте http://localhost:8080

### В командной строке
Для проверки можно выполнить скрипт, чтобы получить общее кол-во записей и кол-во записей на каждом из шардов

```shell
./scripts/check.sh
```
