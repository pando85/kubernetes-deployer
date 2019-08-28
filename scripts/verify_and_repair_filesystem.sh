#!/bin/bash -e
hostname=$1
VerifyRepairExcludes="/etc/|/boot/|cache|getty|/var/lib/smartmontools/"

STAGE1=$(dpkg --verify | egrep -v -i "${VerifyRepairExcludes}" | awk -F" /" '{print "/"$2}')

if [[ -z $STAGE1 ]]; then
	echo -e "${LGREEN}${BOLD}It would appear you don't have any corrupt files or packages!${NC}"
	echo -e "\nIf you are experiencing issues, it is probably best to back"
	echo -e "up your data, and reinstall the OS from a new image.\n"
else
	echo -e "### The following changed from packaged state files were detected:\n"
	echo -e "${STAGE1}"
        if [[ -z $hostname ]]; then
		read -p "Enter hostname to copy files from: " hostname
	fi
	for file_path in ${STAGE1}; do
		scp -p rock64@${hostname}:${file_path} ${file_path}
	done;
fi
