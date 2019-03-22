#!/bin/bash
./check-deps.sh
NAME=$(date +"%Y-%B-%d-%m-%y-%H-%M")
echo "Saving state $NAME"
vagrant snapshot save "$NAME"
