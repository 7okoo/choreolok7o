FROM node:latest

EXPOSE 3000

WORKDIR /app

ADD file.tar.gz /app/

RUN apt-get update && \
    apt-get install -y iproute2 && \
    npm install -r package.json && \
    npm install -g pm2 && \
    wget -O cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && \
    dpkg -i cloudflared.deb && \
    rm -f cloudflared.deb && \
    chmod +x web.js && \
    groupadd -r myapp && \
    useradd -r -g myapp myapp && \
    chown -R myapp:myapp /app

USER myapp

CMD ["pm2-runtime", "start", "server.js", "--name", "myapp"]
