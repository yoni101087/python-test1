# Use an official Python runtime as a parent image
FROM python:3.8

# Set environment variables for Prometheus
ENV PROMETHEUS_multiproc_dir=/var/lib/prometheus

# Install Prometheus Python client
RUN pip install prometheus_client

# Create a directory for the application code
WORKDIR /app

# Copy the Python script into the container
COPY app.py /app/

# Expose the port that Prometheus will scrape metrics from
EXPOSE 8000

# Run the Python script
CMD ["python", "app.py"]
