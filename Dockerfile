FROM postgres:17-alpine

RUN apk add --no-cache tzdata icu-libs

# set Alpine timezone
ENV TZ=UTC
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV LANG=de_DE.UTF-8
ENV LANGUAGE=de_DE:de
ENV LC_ALL=de_DE.UTF-8
ENV TZ=UTC

# This variable is read by the Postgres Docker entrypoint when initializing a new database cluster.
# So the its value is passed directly to initdb when the database is created for the first time.
# --locale-provider=icu
#   Using ICU lets Postgres support more locales, Unicode-aware sorting, and proper case conversion 
#   for languages like German (de-DE).
# --icu-locale=de-DE
#   Specifies which ICU locale Postgres should use when initializing the database.
ENV POSTGRES_INITDB_ARGS="--locale-provider=icu --icu-locale=de-DE"

# Copy SQL init script
COPY ./scripts/00-init.sql /docker-entrypoint-initdb.d/

# ADD /scripts/ /opt/scripts/
# RUN chmod -R 770 /opt/scripts/
