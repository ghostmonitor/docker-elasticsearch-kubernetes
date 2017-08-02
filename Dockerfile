FROM quay.io/ghostmonitor/docker-elasticsearch:5.5.1

MAINTAINER pjpires@gmail.com

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV DISCOVERY_SERVICE elasticsearch-discovery
