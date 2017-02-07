#!/bin/sh

ACCESSLOG=$1
DATEFROM=$2
DATETO=$3

mkdir /outdir~
cat << EOD > iLogScanner/1_bin/iLogScanner.conf
[AccessLog]
ScanDateFrom = $DATEFROM
ScanDateTo = $DATETO
EOD

sh iLogScanner/1_bin/iLogScanner.sh mode=cui logtype=apache accesslog="/accesslog/$ACCESSLOG" outdir=/outdir~ reporttype=all level=detail

cat /outdir~/*.xml 2> /dev/null
cat /outdir~/iLogScanner_error.log >&2 2> /dev/null

mv /outdir~/* /outdir/
