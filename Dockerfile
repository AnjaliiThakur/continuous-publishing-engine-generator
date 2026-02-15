# Step 1: Use Ubuntu latest
FROM ubuntu:latest

# Step 2: Install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git

# Step 3: Install Python packages
RUN pip3 install PyYAML

# Step 4: Copy files into Docker image
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Step 5: Make entrypoint executable and define entrypoint
#RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
