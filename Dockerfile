FROM alpine:latest

# 安装应用程序依赖项
RUN apk --no-cache add python3 \
    unzip

# 添加应用程序文件和解压文件
ADD app.py /app/app.py
ADD web.sh /app/web.sh
ADD cloudf.zip /app/cloudf.zip
ADD entrypoint.sh /app/entrypoint.sh
ADD config.json /app/config.json

# 设置应用程序文件的所有者和权限
RUN chown -R 10001:10001 /app && \
    chmod -R 755 /app && \
    chown 10001:10001 /app/config.json

# 解压cloudf.zip文件
RUN unzip /app/cloudf.zip -d /app && \
    rm /app/cloudf.zip

# 切换到非root用户
USER 10001

# 设置工作目录
WORKDIR /app

# 设置入口脚本
ENTRYPOINT ["/app/entrypoint.sh"]

# 设置默认命令
CMD ["/app/web.sh"]
