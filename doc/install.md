# Install <!-- omit in toc -->

- [Flash SDs](#flash-sds)
  - [Naming convention](#naming-convention)
- [Network](#network)
- [Setup Rock64](#setup-rock64)
- [Cluster](#cluster)
- [Infra services](#infra-services)

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

Also, consider their use case and performance profile. For example, for Ceph nodes:

- k8s-sas-ssd-1
- k8s-hot-storage-2

## Network

Pfsense configuration:

- Connect to DMZ `192.168.1.0/24`
- Add DHCP server: range(60-99), but fix agent IPs before add to the cluster.
- Create lb for apiserver (used HaProxy: increase client, server and tunnel* timeouts to 86400000)
- Add DNS entry

**tunnel\***: must be added in `backend->advanced settings->backend pass thru` as
`timeout tunnel 86400s`


## Setup Rock64

Use playbook `playbooks/install/prepare.yml` to setup servers.
```bash
ansible-galaxy role install -r requirements.yml
ssh root@{node} # Armbian default password 1234 and setup a new  password
ansible-playbook playbooks/install/prepare.yml --ask-pass -e ansible_user=root
```

## Cluster

`playbooks/install/cluster.yml` to setup Kubernetes.

```bash
ansible-playbook playbooks/install/cluster.yml --become
```

## Infra services

1. metallb
1. nginx-ingress
1. cert-manager (problem with ServiceManager, not yet ready monitoring dependency)
1. monitoring
