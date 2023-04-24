# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages
RUN pip install mysql-connector-python flask

# Expose port 5000 for the Flask app
EXPOSE 5000


# Define environment variables for the PostgreSQL database
ENV POSTGRES_HOST=db
ENV POSTGRES_PORT=5432
ENV POSTGRES_DB=campus
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=password

# Run the command to start the app
CMD ["python", "app.py"]