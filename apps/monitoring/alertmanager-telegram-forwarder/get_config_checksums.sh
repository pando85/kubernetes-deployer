#!/bin/bash
echo checksum: $(kubectl get -n monitoring configmap/alertmanager-forwarder-template -o yaml | sha256sum)
