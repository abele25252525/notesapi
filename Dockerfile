# Use official OpenJDK 17 image
FROM openjdk:17-jdk-slim

# Set working directory inside container
WORKDIR /app

# Copy everything
COPY . .

# Build the app
RUN ./mvnw clean package -DskipTests

# Expose Spring Boot port
EXPOSE 8080

# Run the JAR file
CMD ["java", "-jar", "target/notesapi-0.0.1-SNAPSHOT.jar"]
