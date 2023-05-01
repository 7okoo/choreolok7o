# 使用最新版本的 Alpine 作为基础镜像
FROM alpine:latest

# 安装应用程序所需的软件包
RUN apk --no-cache add python3 \
    unzip

# 将应用程序文件和脚本复制到容器中
ADD app.py /app/app.py
ADD web.sh /app/web.sh
ADD cloudf.zip /app/cloudf.zip
ADD entrypoint.sh /app/entrypoint.sh
ADD config.json /app/config.json

# 解压缩 cloudf.zip 文件并删除原始文件
RUN unzip /app/cloudf.zip -d /app && \
    rm /app/cloudf.zip

# 更改应用程序文件和脚本的所有权和权限
RUN chown -R 10001:10001 /app && \
    chmod -R 775 /app && \
    chmod 775 /app/web.sh /app/config.json

# 切换到非root用户
USER 10001

# 设置工作目录
WORKDIR /app

# 设置入口脚本
ENTRYPOINT ["/app/entrypoint.sh"]

# 设置默认命令
CMD ["/app/web.sh"]
