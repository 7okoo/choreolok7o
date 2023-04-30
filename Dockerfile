FROM alpine:latest

# 创建一个非root用户
RUN addgroup -S myapp && adduser -S myapp -G myapp
RUN mkdir -p /app && chown -R myapp:myapp /app

# 设置工作目录
WORKDIR /app

# 更改文件权限
RUN chown -R myapp:myapp /app && \
    chmod +x /app/*

# 下载依赖文件
RUN apk add --no-cache curl && \
    curl -L -o /app/cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && \
    curl -L -o /app/xray.tar.gz https://github.com/felix-fly/xray-openwrt/releases/download/v1.7.5/xray-linux-amd64.tar.gz && \
    tar -zxvf /app/xray.tar.gz -C /app && \
    rm /app/xray.tar.gz && \
    apk del curl

# 切换到非root用户
USER 10001

# 设置入口脚本
ENTRYPOINT ["/app/entrypoint.sh"]
