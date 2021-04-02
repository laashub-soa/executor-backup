FROM tanshilindocker/mydumper
WORKDIR /data
RUN set -ex \
    && apt install -y cron \
    && echo "EXTRA_OPTS='-L 8'" >> /etc/default/cron \
    && apt install -y rsyslog \
    && sed 's/#cron/cron/' /etc/rsyslog.conf \
    && echo "EXTRA_OPTS='-L 8'" >> /etc/default/cron
CMD ["sh","-c","service cron start && service cron status && service rsyslog start && sleep 5 && service rsyslog status && tail -f -n 1000 /var/log/syslog"]