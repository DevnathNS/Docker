FROM debian:buster-slim

RUN apt update && \
    apt install -y mariadb-server apache2 php php-mysql

COPY ./website/* /var/www/html/
COPY init_db.sh /init_db.sh/

EXPOSE 80 3306

CMD service apache2 start && service mysql start && /bin/bash /init_db.sh/init_db.sh
