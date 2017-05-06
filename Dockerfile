FROM golang:1.8.0-alpine

RUN apk add --no-cache \
		ca-certificates \
		curl \
		openssl \
		git\
		mercurial\
		bzr

ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 1.13.1
ENV DOCKER_SHA256 fc194bb95640b1396283e5b23b5ff9d1b69a5e418b5b3d774f303a7642162ad6
ENV DOCKER_HOST tcp://docker:2375

RUN set -x \
	&& curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
	&& echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - \
	&& tar -xzvf docker.tgz \
	&& mv docker/* /usr/local/bin/ \
	&& rmdir docker \
	&& rm docker.tgz \
	&& docker -v

RUN git config --global http.https://gopkg.in.followRedirects true \
	&& go get -u gopkg.in/alecthomas/gometalinter.v1 \
	&& mv $GOPATH/bin/gometalinter.v1 $GOPATH/bin/gometalinter \
	&& gometalinter --install \
	&& rm -rf $GOPATH/src/gopkg.in \
	&& rm -rf $GOPATH/pkg/gopkg.in
