
FROM nginx:stable

ADD ./placeholder.conf /etc/nginx/conf.d/placeholder.conf

ADD ./entrypoint.sh ./entrypoint.sh

ADD ./503.html.tmpl ./503.html.tmpl

EXPOSE 80 8080

CMD [ "./entrypoint.sh" ]
