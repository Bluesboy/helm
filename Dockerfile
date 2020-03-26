FROM alpine:latest
WORKDIR /download
ENV HELM_VERSION=3.1.2
RUN apk add --no-cache curl tar gzip && \
    curl -LO https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz && \
    tar -zxvf helm-v${HELM_VERSION}-linux-amd64.tar.gz
FROM alpine:latest
COPY --from=0 /download/linux-amd64/helm /usr/bin
RUN apk add --no-cache git bash curl && \
    helm plugin install https://github.com/hayorov/helm-gcs
