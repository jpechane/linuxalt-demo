#!/bin/sh

set -m

HOST="localhost"
PORT="3000"
API_URL="http://${HOST}:${PORT}/api"

/usr/sbin/grafana-server --homepath=/usr/share/grafana --config=/etc/grafana/grafana.ini cfg:default.paths.data=/var/opt/grafana/data cfg:default.paths.logs=/var/opt/grafana/log &

# Wait for start
RET=1
while [ $RET -ne 0 ]; do
	echo "------------------------------------- Waiting for Grafana to start"
	sleep 2
	curl -i -u admin:admin -k ${API_URL}/org >/dev/null 2>&1
	RET=$?
done

if [ -n "$GRAFANA_DATASOURCE_NAME" ]; then
	curl -i -XPOST -u admin:admin "$API_URL/datasources" -H 'Content-Type: application/json;charset=UTF-8' --data-binary "{\"name\":\"$GRAFANA_DATASOURCE_NAME\",\"type\":\"influxdb\",\"url\":\"http://$INFLUXDB_HOST:$INFLUXDB_PORT\",\"access\":\"direct\",\"isDefault\":true,\"database\":\"$INFLUXDB_DATABASE\",\"user\":\"admin\",\"password\":\"admin\"}"
fi

fg
