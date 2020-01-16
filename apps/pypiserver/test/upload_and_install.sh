#!/bin/bash
set -e

PYPI_URL=https://pypi.k8s.grigri

git clone https://github.com/django/django.git
cd django
python setup.py sdist upload -r ${PYPI_URL}

python3 -m venv django-pyenv
cd django-pyenv
pip install --extra-index-url ${PYPI_URL} django

cd ../..
rm -rf django
