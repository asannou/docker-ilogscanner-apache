#!/bin/sh

TYPE='all'
LEVEL='detail'
FORMAT=''
BEGIN=''
END=''

while getopts 't:l:d:f:b:e:' opt; do
  case "$opt" in
    t) TYPE="$OPTARG";;
    l) LEVEL="$OPTARG";;
    f) FORMAT="$OPTARG";;
    b) BEGIN="$OPTARG";;
    e) END="$OPTARG";;
    ?) exit 2;;
  esac
done

shift $(($OPTIND - 1))
ACCESSLOG="$1"

if [ ! -e /jar/iLogScanner ]; then
  wget -q https://www.ipa.go.jp/security/vuln/ilogscanner/hjuojm000000gwta-att/iLogScanner.zip
  unzip -q -d /jar iLogScanner.zip
  rm iLogScanner.zip
fi

test -z "$ACCESSLOG" && exit

mkdir /wd~ /jar~
cp /jar/iLogScanner/1_bin/* /jar~/

cat << EOD > /jar~/iLogScanner.conf
[AccessLog]
AccessLogFormat = $FORMAT
ScanDateFrom = $BEGIN
ScanDateTo = $END
EOD

sh /jar~/iLogScanner.sh mode=cui logtype=apache accesslog="/wd/$ACCESSLOG" outdir=/wd~ reporttype="$TYPE" level="$LEVEL"

cat /wd~/*.xml 2> /dev/null
cat /wd~/iLogScanner_error.log >&2 2> /dev/null

mv /wd~/* /wd/
