# 基于 n8n 官方最新镜像
FROM docker.n8n.io/n8nio/n8n:latest

# 切换到 root 用户
USER root

# 使用 apt-get 安装 ffmpeg，并清理缓存以减小镜像体积
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 安装完成后，切换回原本的 node 用户
USER node
