# kubernetes troubleshooting <!-- omit in toc -->
- [Delete namespace finishing](#delete-namespace-finishing)

## Delete namespace finishing

Example with `rook-ceph` namespace:

```bash
kubectl get namespace rook-ceph -o json > /tmp/cm.json
# remove all finalizers: "finalizers": []
vim /tmp/cm.json
kubectl proxy
curl -k -H "Content-Type: application/json" -X PUT --data-binary @/tmp/cm.json http://127.0.0.1:8001/api/v1/namespaces/rook-ceph/finalize
```
