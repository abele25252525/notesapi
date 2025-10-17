# Use official OpenJDK 21 image
FROM openjdk:21-jdk-slim

# Set working directory
WORKDIR /app

# Copy everything
COPY . .

# Make mvnw executable (important on Linux)
RUN chmod +x mvnw

# Build Spring Boot app
RUN ./mvnw clean package -DskipTests

# Expose port 8080
EXPOSE 8080

# Run the built JAR file
CMD ["java", "-jar", "target/notesapi-0.0.1-SNAPSHOT.jar"]
