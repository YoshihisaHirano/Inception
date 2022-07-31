FROM debian:buster

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY ./tools/* /tmp

RUN apt-get update && apt-get install -y mariadb-server
RUN service mysqld start && sh tmp/create-db.sh

EXPOSE 3306

CMD ["mysqld"]