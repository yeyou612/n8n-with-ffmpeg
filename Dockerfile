# 第一阶段：借用一个自带纯静态 FFmpeg 程序的镜像包
FROM mwader/static-ffmpeg:latest AS ffmpeg-source

# 第二阶段：拉取 n8n 官方最新镜像
FROM docker.n8n.io/n8nio/n8n:latest

USER root

#  --chmod=755 赋予执行权限，完全避开 shell 命令
COPY --chmod=755 --from=ffmpeg-source /ffmpeg /usr/local/bin/
COPY --chmod=755 --from=ffmpeg-source /ffprobe /usr/local/bin/

# 切换回 node 用户，
USER node
