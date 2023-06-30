# What is this?


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
