FROM nginx:latest

ADD start.sh /
ADD default.conf /etc/nginx/conf.d/default.conf

ENV CLARIFY_API_KEY docs-api-key

CMD ["/start.sh"]

