# Install <!-- omit in toc -->

- [Network](#network)
  - [Pfsense](#pfsense)
- [Servers](#servers)
  - [Flash SDs](#flash-sds)
    - [Naming convention](#naming-convention)
  - [Troubleshooting same mac problem](#troubleshooting-same-mac-problem)
  - [Setup](#setup)
  - [Stability problems](#stability-problems)
- [Cluster](#cluster)
- [Ansible installed services](#ansible-installed-services)

## Network

### Pfsense

- Connect to DMZ `192.168.1.0/24`
- Add DHCP server: range(60-99), but fix agent IPs before add to the cluster.
- Create lb for apiserver (used HaProxy: increase client, server and tunnel* timeouts to 86400000)
- Add DNS entry

**tunnel\***: must be added in `backend->advanced settings->backend pass thru` as
`timeout tunnel 86400s`


## Servers

### Flash SDs

- rock64: [image](https://www.armbian.com/rock64/)
- odroid-c4: [image](https://www.armbian.com/odroid-c4/)
- amd64: [usb-stick](https://releases.ubuntu.com/20.04/)
Use script from `scripts/prepare_sdcard.sh` to prepare instances and amd64 install manually.

#### Naming convention

All nodes must be named with prefix `k8s-{hardware_tag}-{numerical_id}`.
For example:

- k8s-rock64-3
- k8s-odroid-c4-1
- k8s-amd64-1

Also, consider their use case and performance profile. For example, for Ceph nodes:

- k8s-sas-ssd-1
- k8s-hot-storage-2


### Troubleshooting same mac problem

Editing `/boot/ArmbianEnv.txt` didn't work.

`/etc/network/interfaces`:
```
...
auto eth0
iface eth0 inet dhcp
  hwaddress ether b6:09:a4:06:00:8b
```

### Setup

Use playbook `playbooks/install/so.yml` to setup servers.

```bash
ansible-galaxy install -r requirements.yml
ansible-galaxy collection install -r requirements.yml
ansible-playbook playbooks/install/so.yml -e 'serial=100%' --ask-pass -e ansible_user=root --limit 'all:!k8s-amd64-1'
ansible-playbook playbooks/install/so.yml -e 'serial=100%' --limit 'k8s-amd64-1' -b
```

### Stability problems

```
# binaries: https://github.com/rockchip-linux/rkbin/tree/b1bb741794d6af002182d365879c645a239f5118/bin/rk33

curl -L https://github.com/rockchip-linux/rkbin/raw/master/bin/rk33/rk3328_ddr_333MHz_v1.16.bin -o rk3328_ddr_333MHz_v1.16.bin
mkimage -n rk3328 -T rksd -d rk3328_ddr_333MHz_v1.16.bin idbloader16.img

cat rk3328_miniloader_v2.46.bin >>idbloader16.img

dd if=idbloader16.img of=/dev/mmcblk0 seek=64 conv=notrunc

sync

```

Ref:
 - [Stability problems](https://forum.armbian.com/topic/15082-rock64-focal-fossa-memory-frequency/?tab=comments#comment-108127)

## Cluster

`playbooks/install/cluster.yml` to setup Kubernetes.

```bash
ansible-playbook playbooks/install/k8s.yml --become
```

## Ansible installed services

1. ceph
2. metallb
