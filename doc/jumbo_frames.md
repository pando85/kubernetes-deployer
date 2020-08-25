# jumbo frames

Increase MTU to maximize network performance.

**Note**: We advice to not modify MTU cause network performance is not highly increased and
network configuration becomes more difficult and can cause intermittent problems
if it's misconfigured in some interfaces.


## Get max MTU

```
ansible -m shell -a 'ip -d link list {{ ansible_default_ipv4.alias }}' -b all
```

See values in maxmtu and minimum of that values will be our `max_mtu`.

## Switch

Increase max MTU over `max_mtu`.

## Router

Set MTU in DMZ interface to `max_mtu`.

## Servers

Set MTU to `max_mtu`. Use prepare role with `prepare_mtu` variable.

## Calico

Set up `calico_mtu` to `max_mtu` for normal usage. If you are using IP-in-IP or WireGuard check [this table](https://docs.projectcalico.org/networking/mtu).

net.ipv6.conf.all.disable_ipv6
net.ipv6.conf.default.disable_ipv6
