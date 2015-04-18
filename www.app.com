 <VirtualHost *:80>
      ServerName www.store.com
      # !!! Be sure to point DocumentRoot to 'public'!
	PassengerRuby /home/administrateur/.rvm/gems/ruby-2.1.2/wrappers/ruby
      DocumentRoot /var/www/store/public
	ErrorLog /var/www/store/log/production.log
  	CustomLog /var/www/store/log/production.log combined
  	RailsEnv production
      <Directory /var/www/store/public/>
         # This relaxes Apache security settings.
         AllowOverride all
         # MultiViews must be turned off.
         Options -MultiViews
         # Uncomment this if you're on Apache >= 2.4:
         #Require all granted
      </Directory>
   </VirtualHost>
