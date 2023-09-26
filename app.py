from prometheus_client import start_http_server, Summary
import random
import time

# Create a Prometheus summary metric to track the duration of a function
request_duration = Summary('request_duration_seconds', 'Time spent processing requests')

# Sample function to monitor
@request_duration.time()
def process_request():
    # Simulate some work
    time.sleep(random.uniform(0.1, 0.5))

if __name__ == '__main__':
    # Start the Prometheus HTTP server to expose metrics
    start_http_server(9086)

    while True:
        process_request()
