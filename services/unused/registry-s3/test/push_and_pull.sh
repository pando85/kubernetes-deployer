#!/bin/bash
set -e
IMAGE=alpine:3.8
docker pull ${IMAGE}
docker tag ${IMAGE} registry-s3.k8s.grigri/${IMAGE}
docker push registry-s3.k8s.grigri/${IMAGE}
docker rmi registry-s3.k8s.grigri/${IMAGE}
docker rmi ${IMAGE}
docker pull registry-s3.k8s.grigri/${IMAGE}

