FROM alpine:latest

# 创建一个非root用户
RUN addgroup -S myapp && adduser -S myapp -G myapp

# 设置工作目录
WORKDIR /app

# 拷贝应用程序代码和配置文件
COPY . .

# 更改文件权限
RUN chown -R myapp:myapp /app
    wget -O cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb &&\

# 切换到非root用户
USER myapp

# 设置入口脚本
ENTRYPOINT ["./entrypoint.sh"]
