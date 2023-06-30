# What is this?

This is a simple "proof of concept" setup for the Qualys SSL Labs test
to achieve a flawless A+ rating with 100 points in all 4 categories.

https://www.ssllabs.com/ssltest

It also scores perfectly in the Website Test of internet.nl

https://en.internet.nl/test-site/

# nginx

Folder nginx contains a complete but very basic setup of a nginx webserver.
Follow the comments in the docker-compose.yml file.


# Lets Encrypt

Folder lego contains scripts to issue and renew a Lets Encrypt certificate using the lego tool:
https://github.com/go-acme/lego

I would suggest you symlink the certificate files from the lego output folder to the nginx ssl folder.


# security.txt

nginx/html/.well-known/security.txt is a file that is tested for by the internet.nl test
It is based on the example they provide and signed. It contains no useful info, do not use this for production.
You can create your own file and then sign it with "gpg -s --clear-sign security.txt"

# DNS setup

For some things specific DNS records are required. As a example i use the excellent and free service by
the non-profit located in Germany: https://desec.io/

You can use https://www.huque.com/bin/gen_tlsa to generate DANE TLSA records to use, a example output would be:
    `_443._tcp.example.com. IN TLSA 3 1 1 7843hngfdf832ffh8934rnsa821bnasdg73he983`

Add this as a TLSA record to your domain. The 3-1-1 usage fields are important when generating.
Paste your public SSL cert as PEM into the textfield, either just the cert or fullchain pem.

After adding the record, propagation can take some time. You can test for the proper record with this:
https://www.huque.com/bin/danecheck
