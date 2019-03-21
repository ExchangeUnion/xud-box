#!/bin/bash
./check-deps.sh
echo "Saving state..."
vagrant snapshot save "$(date)"
