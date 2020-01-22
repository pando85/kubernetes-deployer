# mlflow

Helm generated templates:


`Chart.yml`
```yaml
apiVersion: v1
description: A Helm chart for Docker mlflow
name: docker-mlflow
version: 1.9.1
appVersion: 2.7.1
home: https://hub.docker.com/_/mlflow/
icon: https://hub.docker.com/public/images/logos/mini-logo.svg
sources:
  - https://github.com/docker/distribution-library-image
maintainers:
  - name: jpds
    email: jpds@protonmail.com
  - name: rendhalver
    email: pete.brown@powerhrg.com

replicaCount: 2

persistence:
  enabled: yes
  size: 50Gi

ingress:
  enabled: true
  annotations:
    kubernetes.io/ingress.class: nginx-internal
    certmanager.k8s.io/cluster-issuer: "internal"
    nginx.ingress.kubernetes.io/proxy-body-size: "0"
    prometheus.io/probe: "true"
  hosts:
    - mlflow.k8s.grigri
  tls:
  - hosts:
    - mlflow.k8s.grigri
    secretName: mlflow-tls

```

Generate templates:
```bash
helm template --namespace mlflow  -f Chart.yaml stable/docker-mlflow
```
