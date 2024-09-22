#!/bin/bash

# Retry logic to connect to MySQL
MAX_RETRIES=10
RETRY_DELAY=5
HOST="mysql-db"
PORT="3306"

for i in $(seq 1 $MAX_RETRIES); do
  echo "Attempt $i/$MAX_RETRIES: Checking database connection to $HOST:$PORT..."

  # Check if MySQL is up
  if nc -z $HOST $PORT; then
    echo "Database is available! Starting the Spring Boot application..."
    exec java -jar app.jar
  else
    echo "Database not yet available. Retrying in $RETRY_DELAY seconds..."
    sleep $RETRY_DELAY
  fi
done

echo "Database connection could not be established after $MAX_RETRIES attempts. Exiting..."
exit 1

