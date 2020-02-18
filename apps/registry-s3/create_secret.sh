#!/bin/bash

SECRET=$(pass kubernetes.grigri/registry_ha_shared_secret )
kubectl create secret generic -n registry-s3 docker-registry-s3 --from-literal=haSharedSecret=${SECRET}
