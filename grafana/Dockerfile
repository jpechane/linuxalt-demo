FROM grafana/grafana
RUN apt-get update
RUN apt-get install -y curl
COPY scripts/grafana-launch.sh /opt/bin/grafana-launch.sh
VOLUME /var/opt/grafana
RUN chmod 755 /opt/bin/*
ENTRYPOINT /opt/bin/grafana-launch.sh
