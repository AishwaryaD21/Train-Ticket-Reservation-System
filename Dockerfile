FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

# Other stages here...

# Stage 3: Create the final image using OpenJDK and the built WAR file
FROM openjdk:11.0
WORKDIR /app
COPY --from=build ../jenkins_home/.jenkins/workspace/Nexus-project/target/TrainBook-1.0.0-SNAPSHOT.war /app/
EXPOSE 9090
CMD ["java", "-jar", "TrainBook-1.0.0-SNAPSHOT.war"]

