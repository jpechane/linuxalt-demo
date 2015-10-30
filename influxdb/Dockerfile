FROM fedora:22
RUN curl -O http://influxdb.s3.amazonaws.com/influxdb-0.9.4.2-1.x86_64.rpm
RUN dnf -yv install influxdb-0.9.4.2-1.x86_64.rpm
VOLUME /var/opt/influxdb
COPY scripts/influxdb-launch.sh /opt/bin/influxdb-launch.sh
RUN chmod 755 /opt/bin/*
CMD /opt/bin/influxdb-launch.sh
