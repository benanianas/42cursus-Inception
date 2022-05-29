FROM debian:buster

RUN apt-get update && apt install -y nodejs npm
COPY ["./tools/inception", "/inception"]
WORKDIR /inception
RUN npm install
RUN npm run generate
CMD [ "node", "/inception/index.js" ]
