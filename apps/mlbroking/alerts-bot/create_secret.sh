#!/bin/bash

ALPHAVANTAGE_API_KEY=$(pass kubernetes.grigri/mlbroking/alpha_vantage_api_key )
ALERTS_BOT_TOKEN=$(pass kubernetes.grigri/mlbroking/telegram-bot-token )
kubectl create secret generic -n mlbroking alpha-vantage --from-literal=api_key=${ALPHAVANTAGE_API_KEY}
kubectl create secret generic -n mlbroking alerts-bot --from-literal=token=${ALERTS_BOT_TOKEN}
