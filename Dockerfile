FROM eclipse-temurin:8-jre-alpine@sha256:3e802b5f1915aeb0f2ef7a01218ebcd30e8f8419ac4b80c7f379f39efc74e2b8

WORKDIR /root

RUN apk add --no-cache tzdata wget unzip \
  && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && echo "Asia/Tokyo" > /etc/timezone \
  && apk del tzdata

COPY entrypoint.sh .
ENTRYPOINT ["sh", "entrypoint.sh"]

VOLUME ["/jar", "/wd"]
