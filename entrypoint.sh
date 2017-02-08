#!/bin/sh

args=$(getopt f:t: $*)
test $? != 0 && exit 2

set -- $args

for i do
  case "$i" in
    -f) DATEFROM="$2"; shift 2;;
    -t) DATETO="$2"; shift 2;;
    --) shift; break;;
  esac
done

ACCESSLOG="$1"

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
