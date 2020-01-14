# Metallb

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

  neighbor 192.168.1.21 {
  	remote-as 64513
      announce all
  	descr "k8s-1"
  }

  neighbor 192.168.1.22 {
  	remote-as 64513
      announce all
  	descr "k8s-2"
  }

  neighbor 192.168.1.23 {
  	remote-as 64513
      announce all
  	descr "k8s-3"
  }

  neighbor 192.168.1.24 {
  	remote-as 64513
      announce all
  	descr "k8s-4"
  }

  neighbor 192.168.1.25 {
  	remote-as 64513
      announce all
  	descr "k8s-5"
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

