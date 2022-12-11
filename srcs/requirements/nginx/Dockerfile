FROM debian:buster

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN apt-get update && apt-get install -y openssl nginx && \
#creates the dir to put the ssl cert
    mkdir /etc/sslcert/ && \
#creates ssl cert in a way that doesn't prompt user action
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/sslcert/selfsigned.key \
    -out /etc/sslcert/selfsigned.crt -subj '/CN=aalannys.42.fr'

EXPOSE 443

#arguments make the nginx run in the foreground instead of background
CMD ["nginx", "-g", "daemon off;"]