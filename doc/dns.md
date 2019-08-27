
# dns

## CoreDNS

CoreDNS is default DNS and it is running with two instances and a VirtualIP `10.233.0.3`.


## cache setup

- nodelocaldns image >= 1.15.5
- nodelocaldns is running in `169.254.25.10`
- systemd-resolved configuration `/etc/systemd/resolved.conf`:
  ```conf
  [Resolve]
  DNS=169.254.25.10
  Domains=default.svc.kubernetes.grigri svc.kubernetes.grigri kubernetes.grigri grigri
  ```
