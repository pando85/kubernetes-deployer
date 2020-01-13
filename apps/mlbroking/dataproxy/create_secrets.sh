#!/bin/bash

PASSWORD=$(pass kubernetes.grigri/mlbroking/dataproxy/database | head -n 1)
USERNAME=$(pass kubernetes.grigri/mlbroking/dataproxy/database | head -n 2 | tail -1)
DATABASE=$(pass kubernetes.grigri/mlbroking/dataproxy/database | head -n 3 | tail -1)
kubectl create secret generic -n mlbroking dataproxy-database \
    --from-literal=password=${PASSWORD} \
    --from-literal=username=${USERNAME} \
    --from-literal=database=${DATABASE}

IEX_TOKEN=$(pass kubernetes.grigri/mlbroking/dataproxy/iex_token | head -n 1)
kubectl create secret generic -n mlbroking dataproxy-iex \
    --from-literal=token=${IEX_TOKEN}
