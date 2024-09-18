# Use OpenJDK as the base image
FROM openjdk:11-jre-slim

# Set the working directory inside the Docker container
WORKDIR /app

# Copy the JAR file from the target directory (built locally) to the container
COPY healthcare-app/target/*.jar app.jar

# Expose the default port for Spring Boot
EXPOSE 8081

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]

