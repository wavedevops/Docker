#!/bin/bash

set -e

echo "========== Git Pull =========="
git pull

echo "========== Pull Docker Images =========="
docker compose pull

echo "========== Start Services =========="
docker compose up -d

echo "========== Status =========="
docker compose ps