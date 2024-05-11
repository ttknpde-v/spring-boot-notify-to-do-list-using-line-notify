FROM openjdk:17
LABEL authors="ttknpde-v"
WORKDIR /app
# how to build .jar on project spring boot (Generate a .jar file)
# First way you just use command "mvn install" or "mvn clean package"
# When the process is finished, go to the target folder from your project and see the next spring-boot-docker.jar file.
# You will see target folder after mvn install finished
##**  ARG defines a variable that can be passed to the application at runtime.
##**  For example, we pass the location of the final jar file within the target folder and save it in a JAR_FILE variable.
##** You can also pass more arguments like credentials, keys, and environment variables with their respective values.
ARG JAR_FILE=target/understand-theads-with-spring-boot-api-0.0.1*.jar
## Add the application's JAR file to the container
##** copies new files, directories or remote file URLs from the source and adds them to the filesystem of the image at the provided path.
##** In this case we add the Spring Boot application to the Docker image from the source path (the JAR_FILE variable) to a destination named application.jar.
ADD ${JAR_FILE} /app/application.jar
# for running spring boot in container
# Like you run application on your current path
# java -jar target/basic-api-in-docker-container.jar

## Make port 8080 available to the world outside container (same port your app)
EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/application.jar"]
# docker run -d -p 8080:8081 --name <name container (no exist)> <image id (exist)>
# deploye to render on 21/4/24