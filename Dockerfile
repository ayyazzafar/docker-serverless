FROM node:8.12.0-alpine

LABEL MAINTAINER="Ayyaz Zafar <contact@ayyaz.io>"

#Linux setup
RUN apk update \
  && apk add --update alpine-sdk \
  && apk add --no-cache curl \
  && apk del alpine-sdk \
  && rm -rf /tmp/* /var/cache/apk/* *.tar.gz ~/.npm \
  && npm cache verify \
  && sed -i -e "s/bin\/ash/bin\/sh/" /etc/passwd
RUN npm install -g serverless

#Angular CLI
RUN npm install -g @angular/cli

