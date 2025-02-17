FROM eclipse-temurin:8-jre-alpine@sha256:0865d08cf588d2d11e5ec090e1cd42ede14f6db1dcacde17d37f558b60b081ef

WORKDIR /root

RUN apk add --no-cache tzdata wget unzip \
  && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && echo "Asia/Tokyo" > /etc/timezone \
  && apk del tzdata

COPY entrypoint.sh .
ENTRYPOINT ["sh", "entrypoint.sh"]

VOLUME ["/jar", "/wd"]
