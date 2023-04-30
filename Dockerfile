FROM alpine:latest

# 安装应用程序依赖项
RUN apk --no-cache add python3 \
    unzip

# 添加应用程序文件和解压文件
ADD app.py /app/
ADD web.sh /app/
ADD cloudf.zip /app/

# 设置应用程序文件的所有者和权限
RUN chown -R 10001:10001 /app && \
    chmod -R 755 /app

# 解压cloudf.zip文件
RUN unzip /app/cloudf.zip -d /app && \
    rm /app/cloudf.zip

# 切换到非root用户
USER 10001

# 设置工作目录
WORKDIR /app

# 设置入口脚本
CMD ["sh", "web.sh"]
