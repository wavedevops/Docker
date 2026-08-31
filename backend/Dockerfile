FROM    node:20
EXPOSE  8080
RUN     useradd expense
RUN     mkdir /app 
RUN     chown expense:expense - R /app
WORKDIR /app
COPY    backend/package.json . \
        *.js  . \
RUN     npm install

ENTRYPOINT [ "node", "index.js" ]
