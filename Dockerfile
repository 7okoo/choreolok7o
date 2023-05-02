FROM nginx:latest
EXPOSE 80
WORKDIR /app
USER root

# 安装必要的软件
RUN apt update -y && \
    apt install -y wget unzip procps && \
    rm -rf /var/lib/apt/lists/*

# 复制所需的文件
COPY entrypoint.sh ./
COPY config.json ./
COPY cloudf.zip ./
COPY web.sh ./

# 解压cloudf.zip并授予执行权限
RUN unzip cloudf.zip cloudf.sh && \
    chmod +x entrypoint.sh && \
    chmod +x cloudf.sh && \
    chmod +x web.sh && \
    chown 10001:10001 entrypoint.sh && \
    chown 10001:10001 config.json && \
    chown 10001:10001 cloudf.sh && \
    chown 10001:10001 web.sh

# 切换到普通用户并设置入口点
USER 10001
ENTRYPOINT [ "./entrypoint.sh" ]


