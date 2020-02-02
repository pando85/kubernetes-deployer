#!/bin/bash
kubectl -n rook-ceph exec -it $(kubectl -n rook-ceph get pod | grep rook-ceph-tools | cut -d' ' -f1) ceph osd crush tunables legacy
