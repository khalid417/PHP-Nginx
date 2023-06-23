FROM ubuntu:latest
COPY cron/crontab /etc/cron.d/cleanup
COPY cron/cleanuptable.sh /opt/cleanuptable.sh
RUN chmod 0644 /etc/cron.d/cleanup
RUN chmod 0755 /opt/cleanuptable.sh
RUN touch /var/log/cron.log
RUN apt-get update
RUN apt-get -y install cron curl
ENV DOCKERVERSION=24.0.2
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
  && tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 -C /usr/local/bin docker/docker \
  && rm docker-${DOCKERVERSION}.tgz
CMD cron && tail -f /var/log/cron.log