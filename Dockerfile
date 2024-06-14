# Use Ubuntu as a base image
FROM php:7.0-apache

# Update and install nginx
RUN echo "ServerName localhost:80" >> /etc/apache2/apache2.conf 

#RUN apt-get install -y nginx

# Copy the custom index file to the nginx directory
COPY ./index.html /var/www/html/

#RUN touch /var/www/html/index.php
#RUN echo "<?php echo 'Hello-world'; ?>" >> /var/www/html/index.php

#RUN docker-php-ext-install pdo_mysql

EXPOSE 80

#CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
#CMD ["apache2ctl", "-D", "FOREGROUND"]

# Start nginx in the foreground to keep the container running
#CMD ["nginx", "-g", "daemon off;"]

#FROM php:7.0-apache
#RUN echo "ServerName 0.0.0.0" >> /etc/apache2/apache2.conf
#COPY ./index.php /var/www/html/
#EXPOSE 5000
