FROM debian:buster

RUN apt-get update && apt-get install -y redis-server
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/redis/redis.conf
RUN sed -i 's/protected-mode yes/protected-mode no/g' /etc/redis/redis.conf

CMD [ "redis-server", "--protected-mode no"]