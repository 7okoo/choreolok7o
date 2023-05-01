# 使用最新版本的 Alpine 作为基础镜像
FROM alpine:latest

# 安装应用程序所需的软件包
RUN apk --no-cache add python3 \
    unzip

# 将应用程序文件和脚本复制到容器中
ADD web.sh ./web.sh
ADD cloudf.zip ./cloudf.zip
ADD entrypoint.sh ./entrypoint.sh
ADD config.json ./config.json

# 解压缩 cloudf.zip 文件并删除原始文件
RUN unzip ./cloudf.zip && \
    rm ./cloudf.zip

# 更改应用程序文件和脚本的权限
RUN chmod 775 ./web.sh ./config.json

# 切换到非 root 用户
USER 10001

# 设置入口脚本
ENTRYPOINT ["./entrypoint.sh"]

# 设置默认命令
CMD ["./web.sh"]
