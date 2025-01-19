# Use the Python 3.9 slim base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Install curl
RUN apt-get update && apt-get install -y curl iproute2 iputils-ping

# Upgrade pip
RUN pip install --upgrade pip

# Copy the requirements file and install dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy the application code
COPY . .

# Set environment variables for Flask
ENV FLASK_APP=app.py

# Run the Flask application
CMD ["flask", "run", "--host=0.0.0.0"]
