FROM eclipse-temurin:8-jre-alpine@sha256:bcee5a88b9762758619c470f028d7a99fd95d5d5998b8973e0da74adc51a0dac

WORKDIR /root

RUN apk add --no-cache tzdata wget unzip \
  && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && echo "Asia/Tokyo" > /etc/timezone \
  && apk del tzdata

COPY entrypoint.sh .
ENTRYPOINT ["sh", "entrypoint.sh"]

VOLUME ["/jar", "/wd"]
