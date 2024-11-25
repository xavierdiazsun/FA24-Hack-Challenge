from datetime import datetime
import json

import src.db as db
from flask import Flask
from flask import request
from flask import jsonify

DB = db.DatabaseDriver()

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "Hello world!"

# your routes here

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)