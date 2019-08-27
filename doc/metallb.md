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
  network 192.168.2.1/24

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
  ```
- and then setup metallb `cd apps/metallb && kubectl apply -f .`
