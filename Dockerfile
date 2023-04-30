FROM alpine:latest

# 添加应用程序文件
ADD app.py /app/

# 设置应用程序文件的所有者和权限
RUN chown -R 10001:10001 /app && \
    chmod -R 755 /app

# 切换到非root用户
USER 10001

# 设置工作目录
WORKDIR /app

# 设置入口脚本
CMD ["python", "app.py"]
