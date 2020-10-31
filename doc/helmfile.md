# helmfile

## Requirements

- helm
- helmfile
- helm-diff plugin: `helm plugin install https://github.com/databus23/helm-diff`

## Example

```yaml
repositories:
- name: loki
  url: https://grafana.github.io/loki/charts
releases:
  - name: loki
    namespace: monitoring
    createNamespace: false
    chart: loki/loki-stack
    values:
      - values.yml
```

To create `values.yaml` do `helm inspect values loki/loki  > values.default.yaml` and add custom
values to `values.yaml`.

**Warning**: Coping all default values to our file could cause problems updating charts.

## Usage

See final template:

```
helmfile template
```


See changes:

```
helmfile diff
```

Apply changes:

```
helmfile apply
```

