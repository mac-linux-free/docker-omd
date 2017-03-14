docker-omd
==========

[Dockerfile](https://www.docker.com) for [Open Monitoring Distribution (OMD)](http://omdistro.org).

OMD will become available on [http://172.X.X.X/default](http://172.X.X.X/default).
The default login is `omdadmin` with password `omd`.
To find out the IP address, run `ip addr` in the container shell.

Build from Source
-----------------

The Docker image can be built as follows:

    git clone https://github.com/fstab/docker-omd
    cd docker-omd
    docker build -t="omd" .
    docker run -d --restart=always --name=omd -p=80:80 -p=443:443 omd
