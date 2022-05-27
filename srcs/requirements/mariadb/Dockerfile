FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server
COPY ./conf/db.sh /tmp/db.sh
RUN chmod +x /tmp/db.sh
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
ENTRYPOINT [ "/tmp/db.sh" ]