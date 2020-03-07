# Backup

## Etcd

Total backup: `snapshots`
Partial backups: velero

## Certs

Directory on masters: `/etc/kubernetes/pki`

## Ceph

`/var/lib/rook` must be backed up for disaster recovery. With one healthy `mon-{id}` directory is enough.

For one node failure, rook-operator can rebuild data.


## Implementation

### ZFS volume backup

#### Server

Based on [nfs docs](./nfs.md):
- Create volume: `zfs create datasets/kubernetes-backup`
- Export to `192.168.1.0/24` network `zfs set sharenfs="rw=@192.168.1.0/24" datasets/kubernetes-backup`

Add to `/etc/pyznap/pyznap.conf`:

```conf
[datasets/kubernetes-backup]
daily = 7
weekly = 4
monthly = 6
yearly = 1
snap = yes
clean = yes
dest = ssh:22:backup@10.0.1.2:datasets/kubernetes-backup
dest_key = /root/.ssh/id_rsa
```

#### Client

Apply manifest on [`../apps/backup-system`](../apps/backup-system)

### Cronjobs

Etcd, certs and ceph cronjobs in `../apps/backup-system` do the job.
