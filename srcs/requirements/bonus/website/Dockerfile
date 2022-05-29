FROM debian:buster

RUN apt-get update && apt-get install -y curl npm
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get -y install nodejs
RUN npm install npm -g
COPY ["./tools/inception", "/inception"]
WORKDIR /inception
RUN npm install
RUN npm run generate
CMD [ "node", "/inception/index.js" ]
