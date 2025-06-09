FROM n8nio/n8n:latest

USER root

# Install dependencies and PowerShell (manually for Alpine)
RUN apk add --no-cache \
      ca-certificates \
      less \
      ncurses-terminfo-base \
      krb5-libs \
      libgcc \
      libintl \
      libssl3 \
      libstdc++ \
      tzdata \
      userspace-rcu \
      zlib \
      icu-libs \
      curl

# Install PowerShell
RUN curl -L https://github.com/PowerShell/PowerShell/releases/download/v7.2.14/powershell-7.2.14-linux-alpine-x64.tar.gz -o /tmp/powershell.tar.gz && \
    mkdir -p /opt/microsoft/powershell/7 && \
    tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7 && \
    ln -s /opt/microsoft/powershell/7/pwsh /usr/bin/pwsh && \
    rm /tmp/powershell.tar.gz

# Optional: set pwsh as the default shell
SHELL ["/bin/sh", "-c"]

USER node
