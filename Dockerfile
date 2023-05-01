FROM nginx:latest
EXPOSE 80
WORKDIR /app
USER root

COPY entrypoint.sh ./
COPY config.json ./
COPY cloudf.zip ./
COPY web.sh ./

RUN apt update -y && apt install -y wget unzip && \
    unzip cloudf.zip cloudf.sh
    
RUN chmod +x entrypoint.sh && \
    chmod +x cloudf.sh && \
    chmod +x web.sh && \
    chown 10001:10001 entrypoint.sh && \
    chown 10001:10001 config.json && \
    chown 10001:10001 cloudf.sh && \
    chown 10001:10001 web.sh

USER 10001

ENTRYPOINT [ "./entrypoint.sh" ]
