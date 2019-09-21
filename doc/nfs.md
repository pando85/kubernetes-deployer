# nfs storage

## Server

- Create volume: `zfs create datasets/kubernetes`
- Install `nfs-utils`
- Enable and start `nfs-server`
- Export to `192.168.1.0/24` network `zfs set sharenfs="rw=@192.168.1.0/24" datasets/kubernetes`

## Client

Install nfs-common in all machines: `ansible -i inventory/rock64-cluster/inventory.ini -m shell -a 'apt install -y nfs-common' -b all`

## Kubernetes

Using [kubernetes doc](https://github.com/kubernetes-incubator/external-storage/tree/master/nfs-client)

Create `../apps/3-nfs` files and apply.

### Change default storage class

Using [kubernetes doc](https://kubernetes.io/docs/tasks/administer-cluster/change-default-storage-class)

Set to false previous default storage class and then set to true your desired class:

```bash
kubectl patch storageclass <your-class-name> -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
```
