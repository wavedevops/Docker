FROM node:20

EXPOSE 8080

RUN useradd expense

RUN mkdir /app
RUN chown -R expense:expense /app

WORKDIR /app

COPY package.json .

RUN npm install

COPY *.js .

USER expense

ENTRYPOINT ["node", "index.js"]