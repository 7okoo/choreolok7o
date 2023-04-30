
FROM alpine:latest

WORKDIR /app

# 将脚本添加到镜像中
COPY start.sh .

# 授予脚本执行权限
RUN chmod +x start.sh

# 设置入口脚本
ENTRYPOINT ["./start.sh"]
```
