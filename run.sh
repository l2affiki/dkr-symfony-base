#!/bin/bash
if [ $# -eq 0 ]
then
    echo "Usage: $0 <fpm|ngn>"
    exit
fi
case $1 in
    ngn)
	docker run -d --name sym.ngn -v $(pwd)/www:/usr/share/nginx/html:ro -p 80:80 --network web ngn:latest
	;;
    fpm)
	docker run -d --name sym.php -v $(pwd)/www/:/var/www/html --network web fpm:latest
	;;
    *)
	echo >&2 Invalid Name
	exit 1
	;;
esac

if [ $? = 0 ]
then
    echo Ready to Rip
else
    echo >&2 Failed to Start 
    exit 1
fi
