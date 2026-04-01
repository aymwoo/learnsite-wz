#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Starting development environment setup for Arch Linux..."

# 1. Install Docker if not installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Installing Docker..."
    sudo pacman -Sy --noconfirm docker docker-compose
else
    echo "Docker is already installed."
fi

# 2. Ensure Docker service is enabled and started
echo "Starting Docker service..."
sudo systemctl enable --now docker

# 3. Configure Chinese mirror for Docker
DOCKER_DAEMON_JSON="/etc/docker/daemon.json"
echo "Configuring Docker to use Chinese registry mirrors..."

# Create /etc/docker directory if it doesn't exist
sudo mkdir -p /etc/docker

# Write the mirror configuration
sudo tee $DOCKER_DAEMON_JSON > /dev/null <<EOF
{
  "registry-mirrors": [
    "https://docker.m.daocloud.io",
    "https://dockerproxy.com",
    "https://docker.nju.edu.cn",
    "https://mirror.baidubce.com"
  ]
}
EOF

# Restart Docker to apply the new configuration
echo "Restarting Docker service to apply configuration..."
sudo systemctl restart docker

# 4. Pull and run MSSQL using a Chinese mirror
# We use a custom MSSQL image suitable for Learnsite based on the repository documentation.
MSSQL_IMAGE="docker.m.daocloud.io/orzg/mssql-learnsite"

echo "Pulling MSSQL image ($MSSQL_IMAGE)..."
sudo docker pull $MSSQL_IMAGE

echo "Starting MSSQL container..."
# Run the MSSQL container in detached mode with environment variables for sa password and accepting EULA.
# Map port 1433 on the host to 1433 in the container.
sudo docker run -d \
  --name learnsite-mssql \
  -e 'ACCEPT_EULA=Y' \
  -e 'SA_PASSWORD=YourStrong!Passw0rd' \
  -p 1433:1433 \
  --restart unless-stopped \
  $MSSQL_IMAGE

echo "=================================================="
echo "Development environment setup complete!"
echo "MSSQL Server is running on localhost:1433."
echo "Username: sa"
echo "Password: YourStrong!Passw0rd"
echo "=================================================="

# Provide instructions on how to stop the container
echo "To stop the MSSQL container, run: sudo docker stop learnsite-mssql"
echo "To start it again, run: sudo docker start learnsite-mssql"
echo "To remove the container completely, run: sudo docker rm -f learnsite-mssql"
