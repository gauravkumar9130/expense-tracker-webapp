# Use Maven with OpenJDK 17
FROM maven:3.8.3-openjdk-17

# Set working directory
WORKDIR /app

# Copy the project files to the container
COPY . /app

# Build the project and skip tests
RUN mvn clean install -DskipTests=true \
    && cp target/ExpensesTracker-0.0.1-SNAPSHOT.jar /expenseapp.jar

# Expose the application port
EXPOSE 8080

# Start the application
ENTRYPOINT ["java", "-jar", "/expenseapp.jar"]
