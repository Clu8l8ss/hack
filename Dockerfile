# Use a specific version of Ubuntu as the base image
FROM ubuntu:20.04

# Set environment variable for root password
ENV ROOT_PASSWORD=root

# Install necessary packages and clean up in a single step
RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set root password
RUN echo "root:${ROOT_PASSWORD}" | chpasswd

# Expose the web-based terminal port
EXPOSE 4200

# Start shellinabox with root privileges
CMD ["sh", "-c", "/usr/bin/shellinaboxd -t -s /:LOGIN"]
