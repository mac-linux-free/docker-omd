# Open Monitoring Distribution
#
# Forked from https://github.com/jwarlander/docker-omd
#
## Version: 0.1
FROM debian:stretch
# FROM ubuntu:14.04
MAINTAINER mac.linux.free@googlemail.com

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates ssh ssmtp lsb-release wget nano nagios-plugins-basic && \
    wget --no-check-certificate https://mathias-kettner.de/support/1.5.0/check-mk-raw-1.5.0_0.stretch_amd64.deb && \
    (dpkg -i check-mk-raw-1.5.0_0.stretch_amd64.deb || true) && \
    apt-get install -y -f --no-install-recommends  && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -rf check-mk-raw-1.5.0_0.stretch_amd64.deb

RUN omd create monitoring
RUN omd config monitoring set TMPFS off
RUN omd config monitoring set CRONTAB off
#RUN omd config monitoring set APACHE_TCP_ADDR 0.0.0.0

#RUN omd create testing
#RUN omd config testing set TMPFS off
#RUN omd config testing set CRONTAB off
#RUN omd config testing set APACHE_TCP_ADDR 0.0.0.0

# # Add watchdog script
ADD entrypoint.sh /entrypoint.sh

## Add term env var
ENV TERM xterm

# # Set up runtime options
EXPOSE 80 5000 5001
ENTRYPOINT ["/entrypoint.sh"]
