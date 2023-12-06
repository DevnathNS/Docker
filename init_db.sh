#!/bin/bash

# Create a new user and grant privileges
mysql -uroot -proot -e "CREATE USER 'user'@'localhost' IDENTIFIED BY 'user';"
mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost' WITH GRANT OPTION; FLUSH PRIVILEGES;"

# Create database and user table using the new user
mysql -uuser -puser -e "CREATE DATABASE IF NOT EXISTS website;"
mysql -uuser -puser -e "USE website; \
    CREATE TABLE IF NOT EXISTS users ( \
        id INT AUTO_INCREMENT PRIMARY KEY, \
        username VARCHAR(255) NOT NULL, \
        email VARCHAR(255) NOT NULL, \
        password VARCHAR(255) NOT NULL, \
        role varchar(20) NOT NULL \
    ); \
    INSERT INTO users VALUES (1, 'admin', 'nsdevnath172@gmail.com', '5af554431d976fdc57ea02908a8e0ce6', 'admin');"

# Keep the script running
tail -f /dev/null
