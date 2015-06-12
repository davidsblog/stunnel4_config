#!/bin/sh
# Generate a self-signed certificate

set -e
set -x

# You may edit these values if you need to
BITS=2048
DAYS=3650

if test -z "$1" ; then
  echo "Usage: ./$0 <domain_name>"
  exit 1
fi

MY_DOMAIN_NAME="$1"

CA_SUBJECT="/CN=$MY_DOMAIN_NAME/O=$MY_DOMAIN_NAME/C=US/L=Springfield"
CERT_SUBJECT=${SUBJ:="/CN=$MY_DOMAIN_NAME/O=$MY_DOMAIN_NAME/C=US/L=Springfield"}
SERIAL=$(date +%s)

echo $SERIAL > ca.srl
openssl genrsa -out ca.key $BITS
openssl req -new -x509 -key ca.key -out ca.crt -nodes -days $DAYS -subj "$CA_SUBJECT"
cat ca.key ca.crt > ca.pem

openssl genrsa -out stunnel.key $BITS
openssl req -key stunnel.key -new -out stunnel.req -days $DAYS -subj "$CERT_SUBJECT"
openssl x509 -sha256 -req -in stunnel.req -CA ca.pem -CAkey ca.pem -out stunnel.crt -days $DAYS
cat stunnel.key stunnel.crt > stunnel.pem
