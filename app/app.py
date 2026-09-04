from flask import Flask
import os
import psycopg2
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello DevOps! It's {}".format(datetime.now())

@app.route('/db')
def db_check():
    try:
        conn = psycopg2.connect(
            dbname=os.environ.get('POSTGRES_DB'),
            user=os.environ.get('POSTGRES_USER'),
	    password=os.environ.get('POSTGRES_PASSWORD'),
	    host='postgres-db'
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
