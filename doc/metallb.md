# Metallb

## Deployment

```bash
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
```

Reference: https://metallb.universe.tf/installation/

## Router config

In order to use Metallb in BGP mode we must configure Pfsense as router to be able of share
BGP route table and route all network to that loadbalancer IPs. We use
[this tutorial](https://www.danmanners.com/posts/pfsense-bgp-kubernetes/)


- install package openBGPD
- configure it, in `Raw config`:
  ```conf
  AS 64512
  fib-update yes
  listen on 192.168.1.1
  router-id 192.168.1.1
  network 192.168.2.0/24

  neighbor 192.168.1.11 {
  	remote-as 64513
      announce all
  	descr "k8s-rock64-1"
  }

  neighbor 192.168.1.12 {
  	remote-as 64513
      announce all
  	descr "k8s-rock64-2"
  }

  neighbor 192.168.1.13 {
  	remote-as 64513
      announce all
  	descr "k8s-rock64-3"
  }

  neighbor 192.168.1.14 {
  	remote-as 64513
      announce all
  	descr "k8s-rock64-4"
  }

  neighbor 192.168.1.15 {
  	remote-as 64513
      announce all
  	descr "k8s-rock64-5"
  }

  neighbor 192.168.1.16 {
  	remote-as 64513
      announce all
  	descr "k8s-rock64-6"
  }

  neighbor 192.168.1.21 {
  	remote-as 64513
      announce all
  	descr "k8s-odroid-1"
  }

  neighbor 192.168.1.22 {
  	remote-as 64513
      announce all
  	descr "k8s-odroid-2"
  }

  neighbor 192.168.1.31 {
  	remote-as 64513
      announce all
  	descr "k8s-amd64-1"
  }

  neighbor 192.168.1.2 {
  remote-as 64514
      announce all
  descr "grigri"
  }

  ```
- and then setup metallb `cd apps/metallb && kubectl apply -f .`

**Important:** to access metallb network from kubernetes subnet you need to add your host to bgp
Some issues could be experimented if not added as `docker push` not working correctly.

