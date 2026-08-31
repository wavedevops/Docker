FROM node:20

EXPOSE 8080

RUN useradd expense

RUN mkdir /app

RUN chown -R expense:expense /app

WORKDIR /app

COPY backend/package.json .

COPY *.js .

RUN npm install

USER expense

ENTRYPOINT ["node", "index.js"]
