FROM alpine:latest

# Set the working directory
WORKDIR /app

# Switch to a non-root user
USER 10001

# Copy files
COPY entrypoint.sh config.json cloudf.zip web.sh ./

# Unzip cloudf.zip and delete the compressed file
RUN unzip /app/cloudf.zip -d /app && \
    rm /app/cloudf.zip && \
    chmod -R 775 /app && \
    chmod +x /app/entrypoint.sh /app/cloudf.sh /app/web.sh

# Set the entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]

