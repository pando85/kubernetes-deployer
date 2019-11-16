#!/bin/bash

TOKEN=$(pass kubernetes.grigri/telegram_bot_token)
kubectl create secret generic -n monitoring telegram-bot --from-literal=token=${TOKEN}
