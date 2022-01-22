FROM nginx

RUN mkdir -p /var/www/html/repo
ADD  certificates /etc/nginx/certs


