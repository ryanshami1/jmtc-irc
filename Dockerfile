FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install InspIRCd, Node.js, Supervisor, Git, and build tools
RUN apt-get update && apt-get install -y \
    inspircd \
    nodejs \
    npm \
    supervisor \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install The Lounge WebIRC globally
RUN npm install -g thelounge

# Create configuration directories
RUN mkdir -p /config /var/log/supervisor /etc/inspircd

# Copy supervisor process manager configuration
COPY supervisord.conf /etc/supervisord.conf

# Environment variables
ENV THELOUNGE_HOME=/config
ENV PORT=10000
ENV THELOUNGE_SERVER_NAME="JMTC IRC Network"

EXPOSE 10000

# Launch Supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
