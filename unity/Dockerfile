FROM ubuntu:bionic
COPY ./build_Data/ /build_Data/
COPY ./build.x86_64 .
COPY ./UnityPlayer.so .
RUN useradd -ms /bin/bash unity
RUN chown unity:unity -R build.x86_64
RUN chown unity:unity -R build_Data/
RUN chown unity:unity -R UnityPlayer.so
USER unity
ENTRYPOINT hostname > /build_Data/ServerName && ./build.x86_64 -batchmode -nographics