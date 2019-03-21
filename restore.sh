#!/bin/bash
./check-deps.sh
echo "Saving state $1"
vagrant snapshot restore "$1"
