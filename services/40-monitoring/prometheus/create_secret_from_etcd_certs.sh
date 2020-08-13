# execute in k8s node
D="$(mktemp -d)"
cp /etc/ssl/etcd/ssl/{ca,node-k8s-1,node-k8s-1-key}.pem $D
kubectl -n monitoring create secret generic etcd-client --from-file="$D"
rm -fr "$D"
