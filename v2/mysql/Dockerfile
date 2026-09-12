FROM mysql:8.0

ENV MYSQL_DATABASE=transactions

COPY schema/*.sql /docker-entrypoint-initdb.d/

# FROM mysql:8.0

# RUN adduser -r expense
# ENV MYSQL_ROOT_PASSWORD=ExpenseApp@1 \
#     MYSQL_USER=expense \
#     MYSQL_PASSWORD=ExpenseApp@1 \
#     MYSQL_DATABASE=transactions
# RUN chown -R expense:expense /var/lib/mysql /var/run/mysqld
# COPY schema/*.sql /docker-entrypoint-initdb.d/