#!/bin/bash

echo "v0.0.1 - Initializing from: ${S3CONFIGFILE}"
echo SETUP.sh time now: `date +"%T" `

rm -rf /etc/nginx/conf.d
mkdir -p /etc/nginx/conf.d

restoreZip=/etc/nginx/confFile.zip

echo executing aws s3 cp "s3://${S3CONFIGFILE}" $restoreZip

aws s3 cp "s3://${S3CONFIGFILE}" $restoreZip
if [ $? -ne 0 ]; then
	echo "Failed to download from s3"
	exit -1
fi

unzip $restoreZip -d /etc/nginx/conf.d
if [ $? -ne 0 ]; then
	echo "Failed to extract files"
	exit -1
fi

rm $restoreZip

echo starting nginx
nginx -g "daemon off;"

exit $?
 


