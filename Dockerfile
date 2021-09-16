#Pulls the base Ubuntu Image from Docker Hub
From ubuntu

#Lets install NGINX
RUN apt-get -y update && apt -y install nginx

#Install PHP 7.4
RUN apt-get -y install php php-cli php-fpm

COPY index.html /usr/share/nginx/html/index.html
COPY info.php /usr/share/nginx/html/info.php

COPY default.site /etc/nginx/sites-available/default

#lets expose port 80
EXPOSE 80/tcp

CMD service php7.4-fpm start && service nginx start && tail -f /dev/null

