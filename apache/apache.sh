sudo mkdir -p /var/www/gemini.club

sudo cp /home/admin/mentees_domain.txt /var/www/gemini.club/mentees_domain.txt

sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/gemini.club.conf

sudo echo "<VirtualHost *:80>
      ServerAdmin admin@gemini.club
      ServerName gemini.club
      ServerAlias www.gemini.club 
      DocumentRoot /var/www/gemini.club
      ErrorLog ${APACHE_LOG_DIR}/error.log
      CustomLog ${APACHE_LOG_DIR}/access.log combined
      DirectoryIndex index.html mentees_domain.txt
     </VirtualHost>" > /etc/apache2/sites-available/gemini.club.conf


sudo echo "ServerName gemini.club" >> /etc/apache2/apache2.conf

sudo service apache2 start

sudo a2ensite gemini.club.conf

sudo a2dissite 000-default.conf

sudo service apache2 reload
