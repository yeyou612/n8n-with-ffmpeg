# 基于 n8n 官方最新镜像
FROM docker.n8n.io/n8nio/n8n:latest

# 切换到 root 用户
USER root

# 使用 Alpine 的包管理器安装 ffmpeg
RUN apk update && apk add --no-cache ffmpeg

# 安装完成后，必须切换回原本的 node 用户
USER node
