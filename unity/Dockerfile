FROM ubuntu:bionic
COPY . .
RUN useradd -ms /bin/bash unity
RUN chown unity:unity -R build.x86_64
USER unity
ENTRYPOINT ./build.x86_64 -batchmode -nographics