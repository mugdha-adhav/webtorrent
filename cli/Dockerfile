FROM node:alpine

RUN npm install -g webtorrent-cli \
  && rm -r /root/.npm

WORKDIR /downloads
VOLUME /downloads

CMD taif -f "/dev/null"
