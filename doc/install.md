# Install <!-- omit in toc -->

- [Flash SDs](#flash-sds)
  - [Naming convention](#naming-convention)
- [Network](#network)
- [Setup Rock64](#setup-rock64)
- [Cluster](#cluster)

## Flash SDs

- rock64: [image](https://www.armbian.com/rock64/)
- odroid-c4: [image](https://www.armbian.com/odroid-c4/)

Use script from `scripts/prepare_sdcard.sh` to prepare instances.

### Naming convention

All nodes must be named with prefix `k8s-{hardware_tag}-{numerical_id}`.

For example:

- k8s-rock64-3
- k8s-odroid-1
- k8s-atom-1

## Network

Pfsense configuration:

- Connect to DMZ `192.168.1.0/24`
- Add DHCP server: range(60-99), but fix agent IPs before add to the cluster.
- Create lb for apiserver (used HaProxy: increase client and server timeouts to 600000) and DNS entry

## Setup Rock64

Use playbook `playbooks/install/prepare.yml` to setup servers.

## Cluster

`playbooks/install/cluster.yml` to setup Kubernetes.

```bash
ansible-playbook playbooks/install/cluster.yml --become
```
