FROM alpine:latest

# 安装 sudo 命令
RUN apk add --no-cache sudo

# 添加依赖文件到容器中
ADD web.sh /app/
ADD cloudf.zip /app/

# 更改文件权限
RUN chmod +x /app/*

# 添加 myapp 用户和组，并更改文件所有者
RUN addgroup -S myapp && adduser -S myapp -G myapp && \
    chown -R myapp:myapp /app

# 设置工作目录
WORKDIR /app

# 设置入口脚本
ENTRYPOINT ["sudo", "-u", "myapp", "/app/web.sh"]
