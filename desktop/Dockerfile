FROM ubuntu:xenial 

ENV USER ${USER:-webtorrent}
ENV DIR ${DIR:-/home/${USER}}

WORKDIR ${DIR}

RUN	apt-get update && \
	apt-get install -y wget gconf2 libgtk2.0-0 libnss3 libxss1 libxtst6 libasound2 libx11-xcb-dev && \
	rm -rf /var/lib/apt/lists/* && \
	wget https://github.com/feross/webtorrent-desktop/releases/download/v0.20.0/webtorrent-desktop_0.20.0-1_amd64.deb && \	
	dpkg -i webtorrent-desktop*.deb && \
	mkdir ${DIR}/downloads 

VOLUME ${DIR}/downloads 

ENTRYPOINT [ "webtorrent-desktop" ] 
