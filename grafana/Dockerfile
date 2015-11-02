FROM grafana/grafana
RUN apt-get update
RUN apt-get install -y curl
COPY scripts/grafana-launch.sh /opt/bin/grafana-launch.sh
RUN mkdir /var/opt/grafana
RUN chmod 777 /var/opt/grafana
VOLUME /var/opt/grafana
RUN chmod 755 /opt/bin/*
RUN cp -r /etc/grafana /etc/grafana-openshift
RUN chmod a+r /etc/grafana-openshift/*
ENTRYPOINT /opt/bin/grafana-launch.sh
