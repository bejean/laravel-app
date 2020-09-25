#!/bin/sh
set -e

if [ ! -d "/var/www/$LARAVELAPP/app" ] 
then
	cd  /tmp
	laravel new $LARAVELAPP
	cp -rf $LARAVELAPP /var/www/.

	chmod +x /tmp/init-scripts/*.sh
	cd /var/www/$LARAVELAPP

    if ls /tmp/init-scripts/*.sh 1> /dev/null 2>&1; then
    	for f in /tmp/init-scripts/*.sh; do
	    	echo "execute $f" >> /tmp/scripts.txt
  		    bash "$f" -H || break  # execute successfully or break
  		    # Or more explicitly: if this execution fails, then stop the `for`:
  		    # if ! bash "$f" -H; then break; fi
	    done
	fi

	chown -R $LARAVELUSER: /var/www/$LARAVELAPP	
fi

apache2-foreground
#touch /tmp/log.txt
#tail -f /tmp/log.txt