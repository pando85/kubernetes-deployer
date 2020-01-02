# Upgrade

- Update kubespray:
  ```bash
  cd ansible/kubespray
  git pull
  git checkout {version}
  cd ..
  git add kubespray
  ```
- Update version in `ansible/inventory/rock64-cluster/group_vars/k8s-cluster/k8s-cluster.yml`
- Launch upgrade `ansible-playbook -b playbooks/maintenance/upgrade-cluster.yml` from `ansible` dir

