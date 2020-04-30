#==============================================================
FROM maven:3.6.3-adoptopenjdk-14 as build
ARG APLICATIVO
ENV APLICATIVO=${APLICATIVO}
COPY . /tmp/source
WORKDIR /tmp/source
RUN mvn clean package
RUN mkdir -p /app/config; \
	cp target/$APLICATIVO*.jar /app/$APLICATIVO.jar; \
	rm -rf /tmp/source; \
	mkdir /logs;
#==============================================================
FROM adoptopenjdk/openjdk11-openj9:x86_64-alpine-jre-11.0.3_7_openj9-0.14.3
LABEL maintainer me@juanmamorello.tech
ARG APLICATIVO
ENV APLICATIVO=${APLICATIVO}
COPY --from=build /app/$APLICATIVO.jar /app/$APLICATIVO.jar
WORKDIR /app
ENTRYPOINT java -jar $APLICATIVO.jar