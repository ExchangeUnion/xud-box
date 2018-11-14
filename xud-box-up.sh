#!/bin/bash
# Check Virtualbox
temp=$(which VBoxManage)
if [ $? -ne 0 ]; then
	echo "Virtualbox is missing"
	exit 1
fi
# Check Vagrant
temp=$(which vagrant)
if [ $? -ne 0 ]; then
	echo "Vagrant is missing"
	exit 1
fi
vagrant up
