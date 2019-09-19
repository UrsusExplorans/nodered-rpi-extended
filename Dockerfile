FROM resin/armv7hf-debian

RUN [ "cross-build-start" ]

RUN apt update -q && \
    apt upgrade -y -q && \
    apt install -y curl
    
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

RUN npm install -g --unsafe-perm node-red
RUN npm install node-red-contrib-image-output 
 
RUN [ "cross-build-end" ]

COPY run-fauxmo.sh run-fauxmo.sh
VOLUME /config

CMD ["node-red"]
