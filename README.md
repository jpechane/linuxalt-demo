# linuxalt-demo
Demo for LinuxAlt OpenShift part
This repository contains files to support demo for [LinuxAlt 2015](https://www.openalt.cz/2015/cs/visitor_events.html#event_275).

It defines two Docker images
 - https://hub.docker.com/r/jpechane/linuxalt-influxdb/
 - https://hub.docker.com/r/jpechane/linuxalt-grafana/
 
and an OpenShift template that
 - create two pods, one with [InfluxDB](https://influxdb.com/) and one with [Grafana](http://grafana.org/)
 - configures a database in InfluxDB
 - configures a datasourc in Grafana that uses aforementioned InfluxDB
 - provides three routes
  - InfluxDB GUI
  - InfluxDB REST API
  - Grafana GUI
