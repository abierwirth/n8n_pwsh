FROM n8nio/n8n:latest

# Install PowerShell Core
RUN apt-get update && \
    apt-get install -y wget apt-transport-https software-properties-common && \
    wget -q https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y powershell && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* packages-microsoft-prod.deb

# Set default shell to bash (optional)
SHELL ["/bin/bash", "-c"]
