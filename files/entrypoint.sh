#!/bin/bash

test -e /etc/ganglia/gmond.conf  && cp /gmond.conf.default  /etc/ganglia/gmond.conf
test -e /etc/ganglia/gmetad.conf && cp /gmetad.conf.default /etc/ganglia/gmetad.conf

mkdir -p /var/lib/ganglia/rrds
chown nobody /var/lib/ganglia/rrds
exec supervisord -c /etc/supervisor/conf.d/supervisord.conf
