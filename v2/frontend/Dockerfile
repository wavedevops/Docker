FROM nginx:alpine

# Remove default nginx configuration and default web content
RUN rm -rf /usr/share/nginx/html/* \
           /etc/nginx/nginx.conf \
           /etc/nginx/conf.d/default.conf

# Create nginx runtime directories and set permissions
RUN mkdir -p \
        /var/cache/nginx/client_temp \
        /var/cache/nginx/proxy_temp \
        /var/cache/nginx/fastcgi_temp \
        /var/cache/nginx/uwsgi_temp \
        /var/cache/nginx/scgi_temp \
    && chown -R nginx:nginx /var/cache/nginx \
    && chown -R nginx:nginx /var/log/nginx \
    && touch /var/run/nginx.pid \
    && chown nginx:nginx /var/run/nginx.pid

# Copy nginx configuration and application files
COPY expense.conf /etc/nginx/nginx.conf
COPY code/ /usr/share/nginx/html/

EXPOSE 80

# Run nginx as non-root user
USER nginx