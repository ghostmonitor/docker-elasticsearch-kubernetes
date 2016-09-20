FROM quay.io/pires/docker-elasticsearch:2.3.5_1

MAINTAINER David Papp <david@ghostmonitor.com>

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD do_not_use.yml /elasticsearch/config/elasticsearch.yml

# Install Elasticsearch plug-ins
RUN /elasticsearch/bin/plugin install io.fabric8/elasticsearch-cloud-kubernetes/2.3.5 --verbose
RUN /elasticsearch/bin/plugin install license
RUN /elasticsearch/bin/plugin install marvel-agent
RUN /elasticsearch/bin/plugin install cloud-aws

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Copy run script
COPY run.sh /
