FROM nginx

RUN rm -rf /usr/share/nginx/html/* \
    /etc/nginx/nginx.conf \
    /etc/nginx/conf.d/default.conf

COPY expense.conf /etc/nginx/nginx.conf

COPY code /usr/share/nginx/html/