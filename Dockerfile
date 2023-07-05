# Alpine Linux with OpenJDK JRE
FROM openjdk:8-jre-alpine

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz

  
RUN mkdir -p /home/app
EXPOSE 8181
RUN PWD
RUN ls -ltrash 
# copy jar into image
COPY /target/spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar /home/app/spring-petclinic.jar

# run application with this command line 
ENTRYPOINT ["java","-jar","/usr/bin/spring-petclinic.jar","--server.port=8181"]
