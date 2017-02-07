FROM openjdk:jre-alpine

WORKDIR /root

RUN apk update && apk add tzdata openssl

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && echo "Asia/Tokyo" > /etc/timezone
RUN wget https://www.ipa.go.jp/security/vuln/iLogScanner/app/iLogScanner.zip && unzip iLogScanner.zip && rm iLogScanner.zip

RUN apk del tzdata openssl

COPY entrypoint.sh .
ENTRYPOINT ["sh", "entrypoint.sh"]

VOLUME ["/accesslog", "/outdir"]
