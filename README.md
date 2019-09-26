# kubernetes-arm

All neccesary code to deploy a new kubernetes cluster.

Contains:
  - ansible: all operations automated with ansible
  - apps: all services deployed in kubernetes manually, mainly with `kubectl`

## Git Submodules

Init:
`git submodule update --init --recursive`

Update from remote:
`git submodule update --recursive --remote`
