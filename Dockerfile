FROM tomcat:8.5.95-jdk21-temurin-jammy
COPY target/*.war /usr/local/tomcat/webapps/
