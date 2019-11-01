#!/bin/bash

echo "        checksum/config-core: $(kubectl -n monitoring get configmap prometheus-core -o yaml | sha256sum | cut -d' ' -f1 )"
echo "        checksum/config-rules: $(kubectl -n monitoring get configmap prometheus-rules -o yaml | sha256sum | cut -d' ' -f1 )"
