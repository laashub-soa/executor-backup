FROM tanshilindocker/mydumper
WORKDIR /data
RUN set -ex \
    && apt install -y rsyslog \
    && apt install -y cron \
    && echo "EXTRA_OPTS='-L 8'" >> /etc/default/cron \
    && echo "ok"
CMD ["sh","-c","chmod 0600 /var/spool/cron/crontabs/root && service rsyslog start && sleep 5 && service cron start && service cron status && service rsyslog status && crontab -l && tail -f /var/mail/mail"]