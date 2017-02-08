#!/bin/sh

ACCESSLOG=$1
DATEFROM=$2
DATETO=$3

mkdir /wd~
cat << EOD > iLogScanner/1_bin/iLogScanner.conf
[AccessLog]
ScanDateFrom = $DATEFROM
ScanDateTo = $DATETO
EOD

sh iLogScanner/1_bin/iLogScanner.sh mode=cui logtype=apache accesslog="/wd/$ACCESSLOG" outdir=/wd~ reporttype=all level=detail

cat /wd~/*.xml 2> /dev/null
cat /wd~/iLogScanner_error.log >&2 2> /dev/null

mv /wd~/* /wd/
