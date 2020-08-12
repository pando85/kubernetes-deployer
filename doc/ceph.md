# Rook-ceph <!-- omit in toc -->

## Table of Contents <!-- omit in toc -->

- [Reinstall](#reinstall)
- [Troubleshooting](#troubleshooting)
  - [Luminous can't be used with KRBD with Linux 4.4](#luminous-cant-be-used-with-krbd-with-linux-44)
    - [Workaround:](#workaround)
    - [Bug fix:](#bug-fix)
  - [Random commands to see status inside toolbox](#random-commands-to-see-status-inside-toolbox)

## Reinstall

Delete cluster resource and all resources. Hint: iff cluster is still creating, restart operator.

```bash
# remove ceph info (monitor secrets, etc)
rm -rf /var/lib/rook
# clean disk partition table
wipefs -af /dev/sd[whatever]
```

## Troubleshooting

Main troubleshooting guide is in [rook official documentation][1].

### Luminous can't be used with KRBD with Linux 4.4

Kernel 4.4 cannot mount ceph volumes with RBD Luminous version: [Bug link][2]

#### Workaround:

Run in any monitor node `ceph osd crush tunables legacy`

#### Bug fix:

Update to kernel 4.5 or above

### Random commands to see status inside toolbox

```bash
kubectl -n rook-ceph exec -it $(kubectl -n rook-ceph get pod | grep rook-ceph-tools | cut -d' ' -f1) -- bash
rook status
rados df
ceph status
ceph df
ceph osd tree
ceph health
ceph quorum_status | jq
ceph mon_status | jq
ceph mon dump
ceph fs dump
```

[1]: https://github.com/rook/rook/blob/master/Documentation/ceph-common-issues.md
[2]: https://bugs.launchpad.net/charm-ceph-mon/+bug/1716735
