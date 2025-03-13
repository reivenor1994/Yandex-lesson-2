#!/bin/bash

echo "Подсчет общего количества записей в коллекции helloDoc через mongos router:"
docker compose exec -T mongos_router mongosh --port 27020 --quiet <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF

echo "Подсчет количества записей в коллекции helloDoc на шарде 1:"
docker compose exec -T shard1 mongosh --port 27018 --quiet <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF

echo "Подсчет количества записей в коллекции helloDoc на шарде 2:"
docker compose exec -T shard2 mongosh --port 27019 --quiet <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF