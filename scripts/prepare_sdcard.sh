#!/bin/bash
set -ex
export K8S_HOSTNAME=$1
export IMAGE=/home/agil/distros/bionic-containers-rock64-0.8.3-1141-arm64.img

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

if [[ -z $K8S_HOSTNAME ]]; then
    echo "Usage: sudo ./prepare_sdcard.sh k8s-1 "
fi

bash -c "dd if=$IMAGE  of=/dev/mmcblk0 bs=1M conv=sync"
sleep 2
mount /dev/mmcblk0p7 /mnt
sed -i "s/rock64/$K8S_HOSTNAME/g" /mnt/etc/hostname
sed -i "s/rock64/$K8S_HOSTNAME/g" /mnt/etc/hosts
umount /mnt
