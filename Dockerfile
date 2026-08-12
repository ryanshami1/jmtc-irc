FROM alpine:latest

# Install InspIRCd from the community repository along with Node.js and Supervisor
RUN apk add --no-cache \
    --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community \
    inspircd \
    nodejs \
    npm \
    supervisor \
    && npm install -g thelounge

# Create configuration directories
RUN mkdir -p /config /var/log/supervisor /etc/inspircd

# Copy supervisor process manager configuration
COPY supervisord.conf /etc/supervisord.conf

# Environment variables
ENV THELOUNGE_HOME=/config
ENV PORT=10000
ENV THELOUNGE_SERVER_NAME="JMTC IRC Network"

EXPOSE 10000

# Launch Supervisor process manager
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
