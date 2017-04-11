FROM asannou/ilogscanner-apache:base

RUN wget https://www.ipa.go.jp/security/vuln/iLogScanner/app/iLogScanner.zip
RUN unzip iLogScanner.zip && rm iLogScanner.zip
