FROM postgres:17-alpine

RUN apk add --no-cache tzdata icu-libs

# set Alpine timezone
ENV TZ=UTC
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV LANG=de_DE.UTF-8
ENV LANGUAGE=de_DE:de
ENV LC_ALL=de_DE.UTF-8
ENV TZ=UTC

# Postgres init options
ENV POSTGRES_INITDB_ARGS="--locale-provider=icu --icu-locale=de-DE"

# Copy SQL init script
COPY ./scripts/00-init.sql /docker-entrypoint-initdb.d/

# ADD /scripts/ /opt/scripts/
# RUN chmod -R 770 /opt/scripts/
