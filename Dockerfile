FROM eclipse-temurin:8-jre-alpine@sha256:8f43ebe122ce348d6f8cbe12cf850be8f0244100dfeb3dce110ea247b9c27863

WORKDIR /root

RUN apk add --no-cache tzdata wget unzip \
  && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && echo "Asia/Tokyo" > /etc/timezone \
  && apk del tzdata

COPY entrypoint.sh .
ENTRYPOINT ["sh", "entrypoint.sh"]

VOLUME ["/jar", "/wd"]
