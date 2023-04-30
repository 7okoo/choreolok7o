FROM alpine:latest

# Add a non-root user
RUN adduser -D -u 10014 myuser

# Set the user as the container's default user
USER myuser

# Add your application files
COPY app.py /app/app.py

# Set the working directory for the container
WORKDIR /app

# Expose the port that your application listens on
EXPOSE 8000

# Set the entrypoint for the container
CMD ["python", "app.py"]
