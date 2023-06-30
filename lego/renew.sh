#!/bin/bash

# run this only to renew existing cert, to issue it the first time run issue.sh instead

# add this to a cronjob for example to have automatic renewal

# replace this with whatever token your supported provider requires
# see https://go-acme.github.io/lego/dns/
export DESEC_TOKEN=ABCDE

# renew cert and use ./output folder. important to use the rsa4096 to get 100 key exchange score
./lego -a --pem --path ./output --key-type rsa4096 --dns desec --email mail@example.com --dns.resolvers 8.8.8.8 --domains example.com renew --days 60 --reuse-key
