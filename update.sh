#!/bin/bash

cd "$(dirname "$(readlink -f "$0")")" || exit

echo "📂 当前工作目录: $(pwd)"

docker compose pull

docker compose run -it --rm web php artisan xboard:update

docker compose up -d

echo "✅ Xboard 已成功更新并重启！"