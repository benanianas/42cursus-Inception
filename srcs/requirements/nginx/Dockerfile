FROM debian:buster

RUN export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true
RUN apt-get update && apt-get install -y nginx \
    openssl
RUN openssl req -x509 -days 365 -newkey rsa:4096 -nodes -keyout "/etc/ssl/private/abenani.key" -out "/etc/ssl/certs/abenani.crt" -subj "/C=MA/" 2>/dev/null
CMD [ "nginx", "-g", "daemon off;" ]