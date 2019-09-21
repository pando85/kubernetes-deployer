#!/bin/bash
set -e
TELEGRAM_BOT_TOKEN=$(pass kubernetes.grigri/netdata/telegram_bot_token);
sed "s/__TELEGRAM_BOT_TOKEN__/$TELEGRAM_BOT_TOKEN/g" -i 3_config.yml
NETDATA_API_KEY=$(pass kubernetes.grigri/netdata/netdata_api_key);
sed "s/__NETDATA_API_KEY__/$NETDATA_API_KEY/g" -i 3_config.yml

