# kubernetes-arm

All necessary code to deploy and operate Kubernetes clusters.
It uses kubespray to k8s basic setup and it is focused in multi-arch bare-metal deployments.

Contains:

- ansible: all operations automated with ansible
- apps: all services deployed in Kubernetes manually, mainly with `kubectl`

## Git Submodules

Init:
`git submodule update --init --recursive`

Update from remote:
`git submodule update --recursive --remote`
