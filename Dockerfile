FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk:11.0
WORKDIR /app
COPY --from=build jenkins_home/.jenkins/workspace/Nexus-project/target/TrainBook-1.0.0-SNAPSHOT.war /app/
EXPOSE 9090
CMD ["java","-war","TrainBook-1.0.0-SNAPSHOT.war"] 
