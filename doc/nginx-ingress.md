# nginx-ingress

## Internal

Deployed to expose internal services.

### Deployment

Deployment

```yaml

name: nginx-ingress-controller-internal

containers:
  args:
    - /nginx-ingress-controller
    - --ingress-class=nginx-internal
```

Service selector must match deployment labels.

### Usage

Ingress object annotations must match `ingress-class`. Example:

```yaml
metadata:
  annotations:
    # use the shared ingress-nginx
    kubernetes.io/ingress.class: "nginx-internal"
```

## Future

In order to support suffix to create FQDNs Kubernetes is working on `IngressClaim`.
