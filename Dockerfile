FROM postgres:17

RUN apt-get update && apt-get install -y locales tzdata \
 && sed -i '/de_DE.UTF-8/s/^# //g' /etc/locale.gen \
 && locale-gen \
 && dpkg-reconfigure -f noninteractive tzdata

ENV LANG=de_DE.UTF-8
ENV LANGUAGE=de_DE:de
ENV LC_ALL=de_DE.UTF-8

