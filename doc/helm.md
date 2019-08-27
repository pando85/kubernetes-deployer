# helm

Helm does not support arm64 images so we need to use [this repo](https://github.com/jessestuart/tiller-multiarch)

Deployment:

```bash
kubectl create -f rbac-config.yaml
helm init --service-account tiller --tiller-image jessestuart/tiller
```
