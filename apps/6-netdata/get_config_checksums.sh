#!/bin/bash
echo slave checksum: $(kubectl get -n netdata configmap/netdata-conf-slave -o yaml | sha256sum)
echo master checksum: $(kubectl get -n netdata configmap/netdata-conf-master -o yaml | sha256sum)
