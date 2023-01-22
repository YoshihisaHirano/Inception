FROM debian:buster

#makes the image expect the arguments
ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

COPY ./tools/ .

RUN apt-get update && apt-get install -y mariadb-server 
RUN chmod +x create-db.sh && ./create-db.sh

EXPOSE 3306

CMD ["mysqld"]
