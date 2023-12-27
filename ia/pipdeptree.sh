#!/bin/sh -x

# ###########################################################################
echo Starting pipdeptree.sh

pip3 install pipdeptree
pip3 install --upgrade pip

export EXCLUDE_PACKAGES=pipdeptree
pipdeptree -f --warn silence -e "$EXCLUDE_PACKAGES" | grep -E '^[a-zA-Z0-9\-]+' > /logs/python_packages.txt

echo Finished pipdeptree.sh
