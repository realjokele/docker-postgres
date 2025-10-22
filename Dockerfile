FROM postgres:17-alpine

RUN apk add --no-cache tzdata icu-libs

# set Alpine timezone
ENV TZ=UTC
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV LANG=de_DE.UTF-8
ENV LANGUAGE=de_DE:de
ENV LC_ALL=de_DE.UTF-8
ENV TZ=UTC

# Copy SQL script to set timezone at database creation
COPY ./scripts/00-init-timezone.sql /docker-entrypoint-initdb.d/

# ADD /scripts/ /opt/scripts/
# RUN chmod -R 770 /opt/scripts/