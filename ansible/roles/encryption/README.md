# encryption

This role configures kube-apiserver to enable secrets encryption.

To modify settings just edit `/etc/kubernetes/manifests/kube-apiserver.yaml`. Kubelet is watching that directory and will restart the api on changes.

[Doc](https://kubernetes.io/docs/tasks/administer-cluster/encrypt-data/)


## Encrypt secrets

To encrypt secrets you must read all and write them again after change encrypt configuration with new key:

```bash
kubectl get secrets --all-namespaces -o json | kubectl replace -f -
```
