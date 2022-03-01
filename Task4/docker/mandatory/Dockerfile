FROM nginx:latest

ADD ./web-app/nginx/default.conf /etc/nginx/conf.d/default.conf

RUN rm -rf /usr/share/nginx/html/*

ADD ./web-app /usr/share/nginx/html

RUN echo "start nginx"