# stunnel4_config

A basic config for testing [stunnel](https://www.stunnel.org/index.html) on Linux.

#Currently a placeholder, watch this space.

#Prerequisite - installing stunnel

Install stunnel like this:

`sudo apt-get install stunnel4`

#Testing stunnel with this repository

To test your installation, we assume that you have a working webserver on port 80, but nothing doing https on port 443.  Then you can test https support.

    git clone https://github.com/davidsblog/stunnel4_config
    cd stunnel4_config
    ./make_cert.sh localhost
    sudo stunnel4 stunnel.config

This will start stunnel using a self-signed certificate and forward https traffic to port 80.
