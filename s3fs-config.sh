#!/bin/bash

export AWSACCESSKEYID=$AWS_ACCESS_KEY
export AWSSECRETACCESSKEY=$AWS_SECRET_KEY

echo $AWSSECRETACCESSKEY
echo $AWSACCESSKEYID
/usr/bin/s3fs -o allow_other -o use_cache=/tmp $BUCKET /s3fsfolder
tail -f /tmp/keepup
