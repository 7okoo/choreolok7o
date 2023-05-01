FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y unzip curl

RUN mkdir /myapp
COPY entrypoint.sh /myapp/
COPY cloudf.sh /myapp/
COPY web.sh /myapp/
COPY config.json /myapp/
COPY cloudf.zip /myapp/
RUN chown -R 10001:10001 /myapp && \
    chmod +x /myapp/entrypoint.sh /myapp/cloudf.sh /myapp/web.sh && \
    unzip /myapp/cloudf.zip -d /myapp && \
    rm /myapp/cloudf.zip

USER 10001

CMD ["/myapp/entrypoint.sh"]
