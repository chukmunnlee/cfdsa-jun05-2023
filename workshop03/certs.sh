#!/bin/bash

# generate the private key
openssl genrsa -out code.key 4096

# create a CSR
#openssl req -new -key code.key -out code.csr \
#	-subj '/CN=code-159.89.211.156.nip.io' \
#	-addext 'subjectAltName = DNS:myserver.com, IP:159.89.211.155' \
#	-addext 'keyUsage = keyEncipherment, digitalSignature' \
#	-addext 'extendedKeyUsage = serverAuth'
	
# self signed certificate
openssl req -x509 -key code.key -out code.cert \
	-subj '/CN=code-159.89.211.156.nip.io' \
	-days 365 \
	-addext 'keyUsage = keyEncipherment, digitalSignature' \
	-addext 'extendedKeyUsage = serverAuth'

# generate a TLS secret
kubectl create secret tls code-tls -ncode-ns \
	--cert=./code.cert \
	--key=./code.key \
	-oyaml --dry-run=client > code-tls.yaml
