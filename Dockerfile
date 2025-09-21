FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]

FROM tomcat:9.0
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh","run"]

//commands
docker build -t lmswarimage .
docker run -d -p 7089:8080 --name lmswarcontainer lmswarimage
docker ps
docker login
docker tag lmswarimage aakarshabandi/lmswarimage:latest   // tag you image for dockerhub
docker push aakarshabandi/lmswarimage:latest
docker stop lmswarcontainer
docker rm lmswarcontainer    //remove container
docker images
