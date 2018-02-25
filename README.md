docker-omd
==========

[Dockerfile](https://www.docker.com) for [Open Monitoring Distribution (OMD)](http://omdistro.org).

OMD will become available on [http://172.X.X.X/default](http://172.X.X.X/default).
The default login is `cmkadmin` with password ``.
To find out the IP address, run `ip addr` in the container shell.

Build from Source
-----------------

The Docker image can be built as follows:

    git clone https://github.com/mac-linux-free/docker-omd.git
    cd docker-omd
    docker build -t="omd" .
    docker run -d --restart=always --name=omd -p=80:80 -p=443:443 omd
    
    docker exec -it omd bash
    omd create site
    omd config site #disable cron and tmpfs
    omd start site
    htpasswd /opt/omd/sites/site/etc/htpasswd cmkadmin
