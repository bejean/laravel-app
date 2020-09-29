#!/bin/sh
set -e

if [ ! -d "/var/www/$LARAVELAPP/app" ] 
then
	cd  /tmp
	laravel new $LARAVELAPP
	cp -rf $LARAVELAPP /var/www/.

	cd /var/www/$LARAVELAPP
	sed  -i "/DB_HOST/c\DB_HOST=${LARAVELAPP}_laravel_db" .env
	sed  -i "/DB_DATABASE/c\DB_DATABASE=$LARAVELAPP" .env
	sed  -i "/DB_USERNAME/c\DB_USERNAME=$LARAVELAPP" .env
	sed  -i "/DB_PASSWORD/c\DB_PASSWORD=$LARAVELAPP" .env

	count=`ls -1 /tmp/init-scripts/*.sh 2>/dev/null | wc -l`
	if [ $count != 0 ]    
	then
		chmod +x /tmp/init-scripts/*.sh
    	for f in /tmp/init-scripts/*.sh; do
	    	echo "execute $f" >> /tmp/scripts.txt
  		    bash "$f" -H || break  # execute successfully or break
	    done
	fi

	chown -R $LARAVELUSER: /var/www/$LARAVELAPP	
fi

apache2-foreground
#touch /tmp/log.txt
#tail -f /tmp/log.txt