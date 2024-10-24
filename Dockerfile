FROM eclipse-temurin:8-jre-alpine@sha256:98a125daa0a30f3fd411287aca6b4ab5dcdaa92dc1df6ada63e04cdf9407888f

WORKDIR /root

RUN apk add --no-cache tzdata wget unzip \
  && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && echo "Asia/Tokyo" > /etc/timezone \
  && apk del tzdata

COPY entrypoint.sh .
ENTRYPOINT ["sh", "entrypoint.sh"]

VOLUME ["/jar", "/wd"]
