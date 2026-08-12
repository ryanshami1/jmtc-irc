FROM alpine:3.18

# Install InspIRCd, Node.js, Supervisor, and The Lounge WebIRC
RUN apk add --no-cache \
    inspircd \
    nodejs \
    npm \
    supervisor \
    && npm install -g thelounge

# Create configuration directories
RUN mkdir -p /config /var/log/supervisor /etc/inspircd

# Copy supervisor process manager configuration
COPY supervisord.conf /etc/supervisord.conf

# Configure Environment
ENV THELOUNGE_HOME=/config
ENV PORT=10000
ENV THELOUNGE_SERVER_NAME="JMTC IRC Network"

EXPOSE 10000

# Launch Supervisor process manager
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
