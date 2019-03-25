FROM jess/firefox 

ENV USER ${USER:-firefox}
ENV DIR ${DIR:-/home/${USER}}
RUN  adduser -h /home/firefox -s /sbin/nologin -u 1000 -D firefox
COPY browser/base.html ${DIR}/base.html

WORKDIR ${DIR}
VOLUME  ${DIR}/downloads

ENTRYPOINT ["/usr/bin/firefox"]
CMD [ "/home/firefox/base.html" ]
