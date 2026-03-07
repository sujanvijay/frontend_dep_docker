# Use official Tomcat image
FROM tomcat:9.0

# Remove default webapps (optional but recommended)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file into Tomcat webapps folder
COPY target/tes-institute-1.0.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
