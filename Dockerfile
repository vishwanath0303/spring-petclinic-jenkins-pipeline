# Alpine Linux with OpenJDK JRE
FROM openjdk:8-jre-alpine
RUN mkdir -p /home/app
EXPOSE 8181
RUN PWD
RUN ls -ltrash 
# copy jar into image
COPY ./target/spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar /home/app/spring-petclinic.jar

# run application with this command line 
ENTRYPOINT ["java","-jar","/usr/bin/spring-petclinic.jar","--server.port=8181"]
