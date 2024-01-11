FROM node

RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common

RUN DOCKER_VERSION="20.10.0" && \
    curl -fsSL https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz -o /tmp/docker.tgz && \
    tar --extract --file /tmp/docker.tgz --strip-components 1 --directory /usr/local/bin && \
    rm /tmp/docker.tgz

WORKDIR /app
ADD . /app
RUN npm install
EXPOSE 3000
CMD npm start
