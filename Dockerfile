FROM alpine:latest

# 设置工作目录
WORKDIR /app

# 切换到非root用户
USER 10001

# 复制文件
COPY entrypoint.sh ./
COPY config.json ./
COPY cloudf.zip ./
COPY web.sh ./

# 解压cloudf.zip文件并删除压缩文件
RUN unzip /app/cloudf.zip -d /app && \
    rm /app/cloudf.zip && \

    # 设置应用程序文件的所有者和权限
   RUN unzip /app/cloudf.zip -d /app && \
    rm /app/cloudf.zip && \
    chown -R 10001:10001 /app && \
    chmod -R 775 /app && \
    chmod +x /app/entrypoint.sh && \
    chmod +x /app/cloudf.sh && \
    chmod +x /app/web.sh
# 设置入口脚本
ENTRYPOINT ["/app/entrypoint.sh"]
