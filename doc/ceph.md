# Rook-ceph

## Troubleshooting

[ceph with luminous can't be used with KRBD with Xenial 4.4 kernel][1]

Kernel 4.4 cannout mount ceph volumes with RBD Luminous version.

Workaround:

Run in any monitor node `ceph osd crush tunables legacy`

Bug fix:

Update to kernel 4.5 or above

[1]: https://bugs.launchpad.net/charm-ceph-mon/+bug/1716735
