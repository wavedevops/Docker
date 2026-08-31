FROM mysql
ENV adduser expense
ENV MYSQL_ROOT_PASSWORD=ExpenseApp@1 \
    MYSQL_USER=expense \
    MYSQL_PASSWORD=ExpenseApp@1 \
    MYSQL_DATABASE=transactions

COPY schema/schema.sql /docker-entrypoint-initdb.d/