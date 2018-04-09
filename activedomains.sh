#!/bin/bash

SERVERS=$(grep -hEr "ServerName|ServerAlias" /etc/apache2/sites-enabled/ | sed "s/ServerName//" | sed "s/ServerAlias//" | tr -d "[:blank:]")

for DOMAIN in $SERVERS
do
  dig +noall +answer $DOMAIN
done
