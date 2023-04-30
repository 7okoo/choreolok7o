FROM node:latest

# 创建一个非root用户
RUN groupadd -r myapp && useradd -r -g myapp myapp

# 设置工作目录
WORKDIR /app

# 将脚本添加到镜像中
COPY start.sh .

# 授予脚本执行权限
RUN chmod +x start.sh

# 拷贝应用程序代码
COPY . .

# 更改文件权限
RUN chown -R myapp:myapp /app

# 切换到非root用户
USER myapp

# 设置入口脚本
ENTRYPOINT ["./start.sh"]
