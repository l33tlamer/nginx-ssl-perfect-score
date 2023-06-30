#!/bin/bash

# run this only once to issue the cert the first time, after that run renew.sh instead

# replace this with whatever token your supported provider requires
# see https://go-acme.github.io/lego/dns/
export DESEC_TOKEN=ABCDE

# issue cert and store everything in ./output folder. important to use the rsa4096 to get 100 key exchange score
./lego -a --pem --path ./output --key-type rsa4096 --dns desec --email mail@example.com --dns.resolvers 8.8.8.8 --domains example.com run
