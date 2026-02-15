# Use Ubuntu 22.04 LTS
FROM ubuntu:22.04

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    build-essential \
    git \
    curl \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN python3 -m pip install --upgrade pip

# Install Python packages
RUN pip3 install PyYAML

# Copy your Python script and entrypoint
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Give execution permissions to entrypoint
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]