# Use a specific version of Ubuntu for stability
FROM ubuntu:22.04

# Install necessary packages and clean up to reduce image size
RUN apt-get update && \
    apt-get install -y \
    shellinabox \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set root password
RUN echo 'root:root' | chpasswd

# Expose the web-based terminal port
EXPOSE 4200

# Switch to a non-root user for security
RUN useradd -ms /bin/bash shelluser

# Switch to the non-root user
USER shelluser

# Start shellinabox with proper settings
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]

