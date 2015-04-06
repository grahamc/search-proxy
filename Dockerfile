FROM nginx:latest

ADD start.sh /
ADD default.conf /etc/nginx/conf.d/default.conf

CMD ["/start.sh"]

