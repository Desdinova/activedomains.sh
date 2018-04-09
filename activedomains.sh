#!/bin/bash

# grep for ServerName, ServerAlias, and clean output
SERVERS=$(grep -hER "ServerName|ServerAlias" /etc/apache2/sites-enabled/ | sed "s/ServerName//" | sed "s/ServerAlias//" | tr -d "[:blank:]")

# check DNS A-Record for each domain
for DOMAIN in $SERVERS
do
  dig +noall +answer $DOMAIN
done
