#!/bin/bash
pass kubernetes.grigri/ca/key | base64 -d > /tmp/tls.key
pass kubernetes.grigri/ca/crt | base64 -d > /tmp/tls.crt

kubectl create secret tls kubernetes-internal-ca-key-pair \
   --cert=/tmp/tls.crt \
   --key=/tmp/tls.key \
   --namespace=cert-manager
