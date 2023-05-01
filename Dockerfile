FROM alpine:latest

# 安装应用程序依赖项
RUN apk --no-cache add python3 \
    unzip

# 添加应用程序文件和解压文件
ADD app.py /app/app.py
ADD scripts/web.sh /web.sh
ADD scripts/cloudf.sh /cloudf.sh
ADD cloudf.zip /app/cloudf.zip
ADD entrypoint.sh /app/entrypoint.sh
ADD config.json /app/config.json

# 解压cloudf.zip文件并删除压缩文件
RUN unzip /app/cloudf.zip -d /app && \
    rm /app/cloudf.zip

# 设置应用程序文件的所有者和权限
RUN chown -R 10001:10001 /app && \
    chmod -R 775 /app && \
    chown -R 10001:10001 /web.sh && \
    chmod -R 775 /web.sh && \
    chown -R 10001:10001 /cloudf.sh && \
    chmod -R 775 /cloudf.sh

# 暴露端口
EXPOSE 8080

# 设置工作目录
WORKDIR /app

# 切换到非root用户
USER 10001

# 设置入口脚本
ENTRYPOINT ["/app/entrypoint.sh"]

# 设置默认命令
CMD ["/app/web.sh"]
