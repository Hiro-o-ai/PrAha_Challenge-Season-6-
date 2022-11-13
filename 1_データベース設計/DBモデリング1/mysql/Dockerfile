from mysql:5.7

COPY init/* /docker-entrypoint-initdb.d/

ADD ./my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]