#!/bin/bash

# 1. 拉取最新的镜像 (ghcr.io/xxntmctx/xboard:new)
docker compose pull

# 2. 运行 Xboard 的数据库迁移和更新逻辑
# 这里使用 --rm 运行一个临时容器执行命令，完成后自动销毁
docker compose run -it --rm web php artisan xboard:update

# 3. 重新启动所有服务（web, horizon, redis）以应用新镜像
docker compose up -d

echo "✅ Xboard 已成功更新并重启！"
