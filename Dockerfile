FROM tanshilindocker/mydumper
WORKDIR /data
RUN set -ex \
    && apt install -y cron
CMD ["sh","-c","/etc/init.d/cron restart"]