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

from flask import Flask, request, jsonify
from db import db, User, DiningHall, Menu, MenuItem, Order, OrderItem, Payment

# Initialize Flask app
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///college_dining.db'  # Replace with your DB URI
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Initialize the database
db.init_app(app)

# API Routes

@app.route('/users', methods=['POST'])
def create_user():
    data = request.json
    new_user = User(
        name=data['name'],
        email=data['email'],
        password_hash=data['password_hash'],
        role=data.get('role', 'student')
    )
    db.session.add(new_user)
    db.session.commit()
    return jsonify({'message': 'User created successfully'}), 201

@app.route('/orders', methods=['POST'])
def place_order():
    data = request.json
    new_order = Order(
        user_id=data['user_id'],
        hall_id=data['hall_id'],
        total_price=data['total_price'],
        pickup_time=data.get('pickup_time')
    )
    db.session.add(new_order)
    db.session.commit()
    return jsonify({'message': 'Order placed successfully', 'order_id': new_order.order_id}), 201

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)