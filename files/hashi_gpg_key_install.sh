#!/bin/bash

GPGKEY=91A6E7F85D05C65630BEF18951852D87348FFC4C
found=0;
for server in \
  hkp://p80.pool.sks-keyservers.net:80 \
  hkp://keyserver.ubuntu.com:80 \
  hkp://pgp.mit.edu:80
do
  echo "Fetching GPG key $GPGKEY from $server"
  gpg --batch --keyserver "$server" --recv-keys "$GPGKEY" && \
  found=1 && \
  break;
done;
if [ "$found" == "0" ]
then
  echo >&2 "error: failed to fetch GPG key $GPGKEY"
  exit 1
else
  exit 0
fi
