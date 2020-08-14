# monitoring

This is a TODO document. Manifest actually working are under `services/40-monitoring`.

Based on [kube-prometheus](https://github.com/prometheus-operator/kube-prometheus). Which is a
jsonnet library to create all manifest for run with `kubectl apply`

## Generate manifests

Inside kube-prometheus repo:

```bash
docker run --rm -v $(pwd):$(pwd) --workdir $(pwd) --user $UID quay.io/coreos/jsonnet-ci jb update
docker run --rm -v $(pwd):$(pwd) --workdir $(pwd) --user $UID quay.io/coreos/jsonnet-ci ./build.sh example.jsonnet
```

## Grafana and dashboards

Check https://github.com/brancz/kubernetes-grafana
