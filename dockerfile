FROM ubuntu:latest

# Update the package list and install required packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    && apt-get clean

# Install Python dependencies
RUN pip3 install PyYAML

# Copy Python script and entrypoint script into the container
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure entrypoint.sh is executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]




