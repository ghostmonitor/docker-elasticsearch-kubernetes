FROM docker.elastic.co/elasticsearch/elasticsearch:5.5.1

MAINTAINER david@ghostmonitor.com <David Papp>

# Override config, otherwise plug-in install will fail
ADD config config/

# Set environment
ENV DISCOVERY_SERVICE elasticsearch-discovery
ENV ES_JAVA_OPTS "-Xms512m -Xmx512m"
ENV CLUSTER_NAME elasticsearch-default
ENV NODE_MASTER true
ENV NODE_DATA true
ENV NODE_INGEST true
ENV HTTP_ENABLE true
ENV NETWORK_HOST _site_
ENV HTTP_CORS_ENABLE true
ENV HTTP_CORS_ALLOW_ORIGIN *
ENV NUMBER_OF_MASTERS 1
ENV MAX_LOCAL_STORAGE_NODES 1
ENV SHARD_ALLOCATION_AWARENESS ""
ENV SHARD_ALLOCATION_AWARENESS_ATTR ""
ENV XPACK_ML_ENABLED true
ENV XPACK_MONITORING_ENABLED true
ENV XPACK_SECURITY_ENABLED true
ENV XPACK_WATCH_ENABLED true
ENV NODE_NAME _test_

RUN bin/elasticsearch-plugin install repository-s3
