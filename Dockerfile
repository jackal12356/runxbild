FROM node:alpine3.22

WORKDIR /app

ENV PORT=3000

COPY index.js index.html package.json ./

EXPOSE 3000/tcp

RUN apk update && apk upgrade &&\
    apk add --no-cache openssl curl gcompat iproute2 coreutils &&\
    apk add --no-cache bash &&\
    chmod +x index.js &&\
    npm install &&\
    mkdir -p .tmp && chmod -R 777 /app

CMD ["node", "index.js"]
