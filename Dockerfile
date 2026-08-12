FROM alpine:3.19

# Enable community repository, update index, and install dependencies
RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.19/community" >> /etc/apk/repositories \
    && apk update \
    && apk add --no-cache \
        git \
        inspircd \
        nodejs \
        npm \
        supervisor \
    && npm install -g thelounge

# Create configuration directories
RUN mkdir -p /config /var/log/supervisor /etc/inspircd

# Copy supervisor process manager configuration
COPY supervisord.conf /etc/supervisord.conf

# Configure environment variables
ENV THELOUNGE_HOME=/config
ENV PORT=10000
ENV THELOUNGE_SERVER_NAME="JMTC IRC Network"

EXPOSE 10000

# Launch Supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
