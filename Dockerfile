FROM debian:jessie
ENV  DEBIAN_FRONTEND noninteractive

RUN  apt-get -q update \
&& apt-get install -y --no-install-recommends python3-pip python3-dev build-essential \
&& pip3 install Flask \
&& pip3 install netifaces \
&& apt-get purge -y --auto-remove python3-dev build-essential


EXPOSE 81
COPY /app /app

ENTRYPOINT ["/usr/bin/python3", "/app/dokuu.py"]
