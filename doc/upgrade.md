# Upgrade k8s version

:warning: [Do not skip releases when upgrading--upgrade by one tag at a time.](https://github.com/kubernetes-sigs/kubespray/issues/3849#issuecomment-451386515) :warning:

- Update kubespray:
  ```bash
  cd ansible/kubespray
  git pull
  # find next kubespray version, E.g.:
  # (if you're on v2.6.0, then check out v2.7.0, run the upgrade, check the next tag, and run the)
  git checkout {version}
  cd ..
  git add kubespray
  ```
- Update version in `ansible/inventory/grigri-cluster/group_vars/k8s-cluster/k8s-cluster.yml`
  from `kubespray/inventory/sample/group_vars/k8s-cluster/k8s-cluster.yml`.
- Launch upgrade `ansible-playbook -b playbooks/maintenance/upgrade-cluster.yml` from `ansible` dir

