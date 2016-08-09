FROM debian:jessie

MAINTAINER Adam Veldhousen @adamveld12

RUN echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.2 main" > /etc/apt/sources.list.d/mongodb-org-3.2.list \
  && echo "deb http://repo.pritunl.com/stable/apt jessie main" > /etc/apt/sources.list.d/pritunl.list \
  && apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv EA312927 \
  && apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv CF8E292A \
  && apt-get update && apt-get install -y \
     pritunl \
     mongodb-org \
  && rm -f /var/lib/mongodb/mongod.lock

COPY entry.sh .

EXPOSE 1194 9700 443 80

ENTRYPOINT ./entry.sh

