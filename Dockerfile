FROM alpine:3.21

ARG URL=https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/7290-a654bcc2adfa27c4e020fc915a1a6343c3b4f921/fx.tar.xz

VOLUME [ "/FXServer" ]

WORKDIR /defaults
RUN apk add --no-cache libstdc++ libgcc git
RUN wget $URL
RUN tar xf fx.tar.xz
RUN rm -f fx.tar.xz
RUN git clone https://github.com/citizenfx/cfx-server-data.git server-data
RUN apk del git

COPY server.cfg /defaults/server-data/
COPY startscript.sh /
WORKDIR /

CMD ["sh", "/startscript.sh"]

EXPOSE 30120/tcp
EXPOSE 30120/udp
EXPOSE 40120/tcp
EXPOSE 40120/udp