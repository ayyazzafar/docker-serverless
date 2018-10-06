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

RUN apk add python python-dev && curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py --user \
   && echo 'export PATH=~/.local/bin:$PATH' >>~/.bash_profile && source ~/.bash_profile \
   && pip install awscli --upgrade --user && pip install awscli --upgrade --user \
   && echo 'export PATH=~/.local/bin:$PATH' >>~/.bash_profile && source ~/.bash_profile \
   && echo 'alias aws=~/.local/bin/aws' >> ~/.bash_profile && source ~/.bash_profile

#RUN  

#Angular CLI
RUN npm install -g @angular/cli

