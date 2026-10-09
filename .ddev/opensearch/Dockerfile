ARG BAY_IMAGE_VERSION
FROM "ghcr.io/dpc-sdp/bay/opensearch:${BAY_IMAGE_VERSION}"

USER root
RUN chown opensearch /usr/share/opensearch/config/opensearch.yml
USER opensearch
