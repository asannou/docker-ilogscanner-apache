FROM eclipse-temurin:8-jre-alpine@sha256:6af5651ab87b8cac585e45f7887a2bfdcf42ca6f1cf63fb32f7d51c496963951

WORKDIR /root

RUN apk add --no-cache tzdata wget unzip \
  && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && echo "Asia/Tokyo" > /etc/timezone \
  && apk del tzdata

COPY entrypoint.sh .
ENTRYPOINT ["sh", "entrypoint.sh"]

VOLUME ["/jar", "/wd"]
