#!/bin/bash
set -e
TMP_FILE=$(mktemp /tmp/file.XXXXXX)
TELEGRAM_BOT_TOKEN=$(pass kubernetes.grigri/netdata/telegram_bot_token);
sed "s/__TELEGRAM_BOT_TOKEN__/$TELEGRAM_BOT_TOKEN/g" 3_config.yml.template > $TMP_FILE
NETDATA_API_KEY=$(pass kubernetes.grigri/netdata/netdata_api_key);
sed "s/__NETDATA_API_KEY__/$NETDATA_API_KEY/g" $TMP_FILE > 3_config.yml

