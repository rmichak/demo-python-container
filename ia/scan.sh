#!/bin/sh -x

# ###########################################################################
echo Starting scan
PYTHON_PATH=`python3 -c "import sys; print(':'.join([s for s in sys.path if len(s)]))"`

sourceanalyzer -b DEFAULT -Xmx16G -python-version 3 -python-path $PYTHON_PATH  "/opt/python/**/*.py" -debug -verbose -logfile /logs/python.log

sourceanalyzer -debug -verbose -b DEFAULT -XX:+CMSClassUnloadingEnabled -XX:+UseParallelGC -scan -mt -f /logs/$PROJECT_NAME.fpr -logfile /logs/python.log

# ###########################################################################

pip3 freeze > /logs/python_packages.txt
export LC_ALL=en_US.utf8
export LANG=en_US.utf8

#Safety check
pip3 install safety
safety check --full-report >> /logs/safety.txt

echo Finished scan
