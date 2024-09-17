# Use OpenJDK as the base image
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file from target folder to /app
COPY target/*.jar app.jar

# Expose the default port for Spring Boot
EXPOSE 8080

# Run the Spring Boot app
ENTRYPOINT ["java", "-jar", "app.jar"]
