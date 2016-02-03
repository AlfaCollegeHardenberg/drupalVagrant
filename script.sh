#!/bin/bash

# Setup of the files
PASSWORD='password'

# Do update of all packages
sudo apt-get -y update

# Install apache
sudo apt-get -y install apache2

# Set mysql password and install mysql server
sudo debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password_again password $PASSWORD"
sudo apt-get -y install mysql-server libapache2-mod-auth-mysql php5-mysql

# Install php server
sudo apt-get -y install php5 libapache2-mod-php5 php5-mcrypt

# Install phpmyadmin and setup passwords
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"
sudo apt-get -q -y install phpmyadmin

# Enable mod_rewrite & restart apache2
sudo a2enmod rewrite && sudo service apache2 restart

# Make database for drupal
mysqladmin -u root --password=$PASSWORD create drupal

# Delete standard index.html file
rm -f /var/www/index.html

# Download and extract Drupal
wget https://ftp.drupal.org/files/projects/drupal-7.41.tar.gz 
tar -xzvf drupal-7.41.tar.gz -C /tmp

# Copy contents to the apache root map
cp -R /tmp/drupal-7.41/* /var/www/

# Make a settings file for installation
sudo cp /var/www/drupal/sites/default/default.settings.php /var/www/drupal/sites/default/settings.php

# Install git
sudo apt-get -y install git

# Install drush
sudo apt-get -y install drush

