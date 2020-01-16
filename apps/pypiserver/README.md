# pypiserver

To use a private pypi you need to add to ca-trust to pip config:

Example to add your ca-trust in Archlinux:
```bash
pip config set global.cert /etc/ssl/certs/ca-certificates.crt
```
