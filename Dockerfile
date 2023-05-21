FROM tomcat:9.0

# Remove the existing Tomcat webapps directory
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file to the Tomcat webapps directory
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 (the default Tomcat port)
EXPOSE 8080

# Start Tomcat and deploy the application
CMD ["catalina.sh", "run"]
