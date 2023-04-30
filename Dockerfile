FROM alpine:latest

# 创建一个非root用户
RUN addgroup -S myapp && adduser -S myapp -G myapp \
    && chmod +x entrypoint.sh

# 设置工作目录
WORKDIR /app

# 拷贝应用程序代码和配置文件
COPY . .

# 更改文件权限并下载文件
RUN chown -R myapp:myapp /app && \
    wget -O cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && \
    wget -O xray.tar.gz https://github.com/felix-fly/xray-openwrt/releases/download/v1.7.5/xray-linux-amd64.tar.gz && \
    tar -zxvf xray.tar.gz && \
    rm xray.tar.gz

# 切换到非root用户
USER 10001

# 设置入口脚本
ENTRYPOINT ["./entrypoint.sh"]
