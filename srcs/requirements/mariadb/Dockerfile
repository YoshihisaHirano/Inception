FROM debian:buster

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY ./tools/* /tmp

RUN apt update && apt install -y mariadb-server
RUN sh tmp/create-db.sh
# RUN mysql << "DROP USER IF EXISTS $USER'@'%";

EXPOSE 3306

CMD ["mysqld"]