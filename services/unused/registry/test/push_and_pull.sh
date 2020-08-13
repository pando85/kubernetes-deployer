#!/bin/bash
IMAGE=alpine:latest
docker pull ${IMAGE}
docker tag ${IMAGE} registry.k8s.grigri/${IMAGE}
docker push registry.k8s.grigri/${IMAGE}
docker rmi registry.k8s.grigri/${IMAGE}
docker rmi ${IMAGE}
docker pull registry.k8s.grigri/${IMAGE}

