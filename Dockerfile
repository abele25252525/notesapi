# Use an official OpenJDK image as base
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy Maven wrapper and project files
COPY . .

# Package the application (skip tests for faster builds)
RUN ./mvnw clean package -DskipTests

# Expose the default Spring Boot port
EXPOSE 8080

# Run the built jar
CMD ["java", "-jar", "target/notesapi-0.0.1-SNAPSHOT.jar"]
