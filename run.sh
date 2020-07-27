#!/bin/bash
if [ $# -eq 0 ]
then
    echo "Usage: $0 <fpm|ngn>"
    exit
fi
case $1 in
    ngn)
	podman run -d --name sym.ngn -v $(pwd)/www:/usr/share/nginx/html:z -p 8080:80 ngn:latest
	;;
    fpm)
	podman run -d --name sym.php -v $(pwd)/www/:/var/www/html:z -p 9000:9000 fpm:latest
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
