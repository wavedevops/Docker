FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/* \
    /etc/nginx/nginx.conf \
    /etc/nginx/conf.d/default.conf

COPY expense.conf /etc/nginx/nginx.conf
COPY code /usr/share/nginx/html/

# How to Run nginx in docker as non-root user in rhel

RUN mkdir -p /var/cache/nginx/client_temp && \
        mkdir -p /var/cache/nginx/proxy_temp && \
        mkdir -p /var/cache/nginx/fastcgi_temp && \
        mkdir -p /var/cache/nginx/uwsgi_temp && \
        mkdir -p /var/cache/nginx/scgi_temp && \
        chown -R nginx:nginx /var/cache/nginx && \
        chown -R nginx:nginx /etc/nginx/ && \
        chmod -R 755 /etc/nginx/ && \
        chown -R nginx:nginx /var/log/nginx

EXPOSE 80

USER nginx