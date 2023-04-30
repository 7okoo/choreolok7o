FROM alpine:latest

# 添加依赖文件到容器中
ADD web.sh /app/
ADD cloudf.zip /app/

# 切换到非root用户
USER 10001

# 创建一个非root用户
RUN addgroup -S myapp && adduser -S myapp -G myapp
RUN mkdir -p /app && chown -R myapp:myapp /app

# 设置工作目录
WORKDIR /app

# 更改文件权限
RUN chown -R myapp:myapp /app && \
    chmod +x /app/*

# 设置入口脚本
ENTRYPOINT ["/app/web.sh"]
