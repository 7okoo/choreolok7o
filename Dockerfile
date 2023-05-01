FROM alpine:latest

# 切换到root用户
USER root

# 安装应用程序依赖项
RUN apk --no-cache add python3 \
    unzip

# 添加应用程序文件和解压文件
ADD web.sh /web.sh
ADD cloudf.zip /cloudf.zip
ADD entrypoint.sh /entrypoint.sh
ADD config.json /config.json

# 解压cloudf.zip文件并删除压缩文件
RUN unzip /cloudf.zip && \
    rm /cloudf.zip

# 设置入口脚本
ENTRYPOINT ["/entrypoint.sh"]

# 设置默认命令
CMD ["/web.sh"]
