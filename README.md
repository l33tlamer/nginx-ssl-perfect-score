# What is this?

This is a simple "proof of concept" setup for the Qualys SSL Labs test
to achieve a flawless A+ rating with 100 points in all 4 categories.

https://www.ssllabs.com/ssltest

It also scores perfectly in the Website Test of internet.nl

https://en.internet.nl/test-site/

![Screenshot](/001.png)  

![Screenshot](/002.png)  


# nginx

Folder nginx contains a complete but very basic setup of a nginx webserver.
Follow the comments in the docker-compose.yml file.


# Lets Encrypt

Folder lego contains scripts to issue and renew a Lets Encrypt certificate using the lego tool:
https://github.com/go-acme/lego

I would suggest you symlink the certificate files from the lego output folder to the nginx ssl folder. Beware of permissions.


# security.txt

nginx/html/.well-known/security.txt is a file that is tested for by the internet.nl test
It is based on the example they provide and signed. It contains no useful info, do not use this for production.
You can create your own file and then sign it with "gpg -s --clear-sign security.txt"

# DNS setup

For some things specific DNS records are required. As a example i use the excellent and free service of https://desec.io/


# DNSSEC

Your domain provider and your DNS provider both need to support DNSSEC.

In this example DeSec are managing the DNS so they provide the required records in their interface.
Submit those to your domain provider to get them added. How exactly will vary a lot between providers.

With the example of DeSec for DNS and a free "eu.org" domain, you need to copy the DS records lines in
the following format into the interface at https://nic.eu.org (submit each line seperately):

`example.eu.org.  86400  IN DS  38257 13 2 35dca...`

Propagation can take some time. You can test your setup with https://dnssec-analyzer.verisignlabs.com/

https://dnsviz.net/ could also be helpful.

# DANE TLSA

You first must have a working DNSSEC setup, then you can proceed to add this.

You can use https://www.huque.com/bin/gen_tlsa to generate DANE TLSA records to use, a example output would be:

`_443._tcp.example.com. IN TLSA 3 1 1 7843hngfdf832ffh8934rnsa821bnasdg73he983`

Add this as a TLSA record to your domain. The 3-1-1 usage fields are important when generating and recommended by Lets Encrypt.
Paste your public SSL cert as PEM into the textfield, either just the cert or fullchain pem.

After adding the record, propagation can take some time. You can test for the proper record with this:

https://www.huque.com/bin/danecheck

# CAA

To generate CAA records you can use https://sslmate.com/caa/ and then add them to your domain.
A example would be:

```
Name 	         Type     Flags     Tags     Value
example.com.	 CAA	  0         issue    "letsencrypt.org"
example.com.     CAA      0         iodef    "mailto:mail@example.com"
```
