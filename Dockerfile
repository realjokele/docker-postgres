FROM postgres:17-alpine

RUN apk add --no-cache icu-libs

ENV LANG=de_DE.UTF-8
ENV LANGUAGE=de_DE:de
ENV LC_ALL=de_DE.UTF-8
ENV TZ=UTC

# ADD /scripts/ /opt/scripts/
# RUN chmod -R 770 /opt/scripts/