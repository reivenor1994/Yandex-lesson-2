#!/bin/bash

echo "Подсчет общего количества записей в коллекции helloDoc через mongos router:"
docker compose exec -T mongos_router mongosh --port 27024 --quiet <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF

echo "Проверка количества записей в коллекции helloDoc на всех узлах репликационной группы rs1:"
echo "shard1 (primary):"
docker compose exec -T shard1 mongosh --port 27018 --quiet <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF

echo "shard1-1 (secondary):"
docker compose exec -T shard1-1 mongosh --port 27019 --quiet <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF

echo "shard1-2 (secondary):"
docker compose exec -T shard1-2 mongosh --port 27020 --quiet <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF

echo "Проверка количества записей в коллекции helloDoc на всех узлах репликационной группы rs2:"
echo "shard2 (primary):"
docker compose exec -T shard2 mongosh --port 27021 --quiet <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF

echo "shard2-1 (secondary):"
docker compose exec -T shard2-1 mongosh --port 27022 --quiet <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF

echo "shard2-2 (secondary):"
docker compose exec -T shard2-2 mongosh --port 27023 --quiet <<EOF
use somedb;
db.helloDoc.countDocuments();
exit();
EOF