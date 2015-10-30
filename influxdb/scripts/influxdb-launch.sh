#!/bin/sh

set -m

HOST="localhost"
PORT="8086"
API_URL="http://${HOST}:${PORT}"

/opt/influxdb/influxd -config /etc/opt/influxdb/influxdb.conf &

# Wait for start
RET=1
while [ $RET -ne 0 ]; do
	echo "------------------------------------- Waiting for InfluxDB to start"
	sleep 5
	curl -k ${API_URL}/ping 2> /dev/null
	RET=$?
done

if [ -n "$INFLUXDB_DATABASE_NAME" ]; then
	/opt/influxdb/influx -host=$HOST -port=$PORT -execute="create database \"${INFLUXDB_DATABASE_NAME}\""
fi

fg
