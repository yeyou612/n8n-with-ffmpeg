# 第一阶段：借用静态 FFmpeg
FROM mwader/static-ffmpeg:latest AS ffmpeg-source

# 第二阶段：n8n 官方镜像
FROM docker.n8n.io/n8nio/n8n:latest

USER root

# 空投 FFmpeg
COPY --chmod=755 --from=ffmpeg-source /ffmpeg /usr/local/bin/
COPY --chmod=755 --from=ffmpeg-source /ffprobe /usr/local/bin/

# 在系统根目录建一个专属文件夹，并赋予 777 最高读写权限
RUN mkdir -p /n8n-tmp && chmod 777 /n8n-tmp

USER node
