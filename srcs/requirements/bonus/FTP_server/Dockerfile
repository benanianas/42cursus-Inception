FROM debian:buster

RUN apt-get update && apt-get install -y vsftpd
COPY ./conf/vsftpd.conf /tmp/vsftpd.conf
COPY ./tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "/tmp/entrypoint.sh" ]
EXPOSE 21