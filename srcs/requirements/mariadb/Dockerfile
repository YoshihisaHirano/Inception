FROM debian:buster

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY ./tools/ .

RUN chmod +x create-db.sh && ./create-db.sh

EXPOSE 3306

CMD ["mysqld"]