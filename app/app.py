from flask import Flask
import os
import psycopg2
from datetime import datetime
from prometheus_flask_exporter import PrometheusMetrics
# import random

app = Flask(__name__)

metrics = PrometheusMetrics(app)

from prometheus_client import Counter
REQUESTS = Counter('my_endpoint_requests_total', 'Total requests to /db endpoint')

@app.route('/')
def hello():
    return "Hello DevOps! It's {}".format(datetime.now())

@app.route('/db')
def db_check():
    REQUESTS.inc()
   # if random.random() < 0.3:
   #     return "Simulated DB error", 500
    try:
        conn = psycopg2.connect(
            dbname=os.environ.get('POSTGRES_DB'),
            user=os.environ.get('POSTGRES_USER'),
	    password=os.environ.get('POSTGRES_PASSWORD'),
	    host='postgres-service'
	)
        cur = conn.cursor()
        cur.execute('SELECT version()')
        version = cur.fetchone()[0]
        cur.close()
        conn.close()
        return f"Connected to PostgreQL: {version}"
    except Exception as e:
        return f"Error: {e}"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
