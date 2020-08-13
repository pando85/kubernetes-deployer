#!/bin/bash

SECRET=$(pass kubernetes.grigri/registry_ha_shared_secret )
kubectl create secret generic -n registry release-name-docker-registry-secret --from-literal=haSharedSecret=${SECRET}
