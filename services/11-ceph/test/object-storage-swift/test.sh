#!/bin/bash
set -e

export BUCKET_NAME=test-swift
export AWS_ACCESS_KEY_ID=$(kubectl -n default get secret ceph-bucket-swift-test -o yaml | grep AWS_ACCESS_KEY_ID | awk '{print $2}' | base64 --decode)
export AWS_SECRET_ACCESS_KEY=$(kubectl -n default get secret ceph-bucket-swift-test -o yaml | grep AWS_SECRET_ACCESS_KEY | awk '{print $2}' | base64 --decode)
export AWS_HOST=swift.k8s.grigri

echo "Hello Rook" > /tmp/rookObj
s3cmd put /tmp/rookObj --host=${AWS_HOST} --host-bucket= s3://${BUCKET_NAME}
s3cmd del --host=${AWS_HOST} --host-bucket= s3://${BUCKET_NAME}/rookObj

kubectl delete -f object-bucket-claim.yml


