- [Install](#install)
  - [Flash SDs](#flash-sds)
  - [Network](#network)
  - [Setup Rock64](#setup-rock64)
  - [Cluster](#cluster)

# Install

## Flash SDs

- Rock64: format all SDs with [last bionic-containers-rock64 image](https://github.com/ayufan-rock64/linux-build/releases)
- Replace `/etc/hostname` and `/etc/hosts` using new hostname

## Network

Pfsense configuration:

- Connect to DMZ `192.168.1.0/24`
- Add DHCP server: range(30-99), but fix agent IPs before add to the cluster.
- Create lb for apiserver (used HaProxy: increase client and server timeouts to 600000) and DNS entry

## Setup Rock64

Use playbook `playbooks/install/prepare.yml` to setup rock64.

## Cluster

`playbooks/install/cluster.yml` to setup Kubernetes
