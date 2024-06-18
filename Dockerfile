############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Ubuntu
############################################################


# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
#

# Install Nginx

# Add application repository URL to the default sources
# RUN echo "deb http://archive.ubuntu.com/ubuntu/ raring main universe" >> /etc/apt/sources.list

# Update the repository
RUN apt-get update

# Install necessary tools
RUN apt-get install -y vim wget dialog net-tools

RUN apt-get install -y nginx

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf

# Copy a configuration file from the current directory
ADD nginx.conf /etc/nginx/

RUN mkdir /etc/nginx/logs

# Add a sample index file
ADD index.html /www/data/

# Append "daemon off;" to the beginning of the configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Create a runner script for the entrypoint
#COPY runner.sh /runner.sh
#RUN chmod +x /runner.sh

# Expose ports
EXPOSE 80

#ENTRYPOINT ["/runner.sh"]

# Set the default command to execute
# when creating a new container
CMD ["nginx"]

# Use Ubuntu as a base image
#FROM php:7.0-apache

# Update and install nginx
#RUN echo "ServerName localhost:80" >> /etc/apache2/apache2.conf 

#RUN apt-get install -y nginx

# Copy the custom index file to the nginx directory
#COPY ./index.html /var/www/html/

#RUN touch /var/www/html/index.php
#RUN echo "<?php echo 'Hello-world'; ?>" >> /var/www/html/index.php

#RUN docker-php-ext-install pdo_mysql

#EXPOSE 80

#CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
#CMD ["apache2ctl", "-D", "FOREGROUND"]

# Start nginx in the foreground to keep the container running
#CMD ["nginx", "-g", "daemon off;"]

#FROM php:7.0-apache
#RUN echo "ServerName 0.0.0.0" >> /etc/apache2/apache2.conf
#COPY ./index.php /var/www/html/
#EXPOSE 5000
