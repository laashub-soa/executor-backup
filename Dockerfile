FROM tanshilindocker/mydumper
WORKDIR /data
RUN set -ex \
    && apt install -y cron \
    && echo "EXTRA_OPTS='-L 8'" >> /etc/default/cron
CMD ["sh","-c","/etc/init.d/cron restart"]