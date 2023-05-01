FROM nginx:latest

EXPOSE 80

WORKDIR /app

USER root

COPY entrypoint.sh ./
COPY config.json ./
COPY cloudf.zip ./
COPY web.sh ./

RUN apt update -y && \
    apt install -y wget unzip && \
    unzip cloudf.zip -d /app && \
    chmod +x entrypoint.sh cloudf.sh web.sh && \
    chown 10086:10086 entrypoint.sh config.json cloudf.sh web.sh && \
    rm /app/cloudf.zip

USER 10086

ENTRYPOINT [ "./entrypoint.sh" ]
