From ubuntu:latest

RUN apt-get update && apt-get install -y bash coreutils

COPY scripts/backup.sh /usr/local/bin/backup.sh

RUN chmod +x /usr/local/bin/backup.sh

CMD ["/usr/local/bin/backup.sh"]
