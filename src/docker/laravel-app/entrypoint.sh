#!/bin/sh
set -e

if [ ! -d "/var/www/$LARAVELAPP/app" ] 
then
	cd  /tmp
	laravel new $LARAVELAPP
	cp -rf $LARAVELAPP /var/www/.
	chown -R $LARAVELUSER: /var/www/$LARAVELAPP
fi

apache2-foreground
#touch /tmp/log.txt
#tail -f /tmp/log.txt