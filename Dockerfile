FROM alpine:latest

# Set the working directory
WORKDIR /app

# Set non-root user
USER 10001

# Copy files
COPY entrypoint.sh config.json cloudf.zip web.sh ./

# Set file permissions
RUN chown -R 10001:10001 /app && \
    chmod +x /app/entrypoint.sh /app/cloudf.sh /app/web.sh && \
    unzip /app/cloudf.zip -d /app && \
    rm /app/cloudf.zip

# Set entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]
