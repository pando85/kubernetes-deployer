# cert-manager

Generate and update certifcates automatically.

## Issuers

### Internal

name: internal
Kind: ClusterIssuer
Domain: k8s.grigri

### External (TODO)

Domain: k8s.grigri.cloud

## Ingress integration

Example:

```yaml
---
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: web-ingress
  namespace: default
  annotations:
    # use the shared nginx-ingress
    kubernetes.io/ingress.class: "nginx-internal"
    certmanager.k8s.io/cluster-issuer: "internal"
spec:
  tls:
  - hosts:
    - test.k8s.grigri
    secretName: test-tls
  rules:
  - host: test.k8s.grigri
    http:
      paths:
      - path: /
        backend:
          serviceName: app
          servicePort: 80
```
