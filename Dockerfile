FROM eclipse-temurin:8-jre-alpine@sha256:1126c5704d25076a384d134e85a7fbfcb0eb9a00f419584739dcac070417d772

WORKDIR /root

RUN apk add --no-cache tzdata wget unzip \
  && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && echo "Asia/Tokyo" > /etc/timezone \
  && apk del tzdata

COPY entrypoint.sh .
ENTRYPOINT ["sh", "entrypoint.sh"]

VOLUME ["/jar", "/wd"]
