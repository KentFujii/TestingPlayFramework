FROM openjdk:8
ENV SBT_VERSION 1.1.2
RUN curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb
RUN apt-get update && \
  apt-get install -y sbt && \
  apt-get clean

WORKDIR /TestingPlayFramework
ADD build.sbt /TestingPlayFramework/build.sbt
ADD project /TestingPlayFramework/project/
RUN sbt compile
ADD . /TestingPlayFramework
EXPOSE 9000
