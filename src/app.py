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

@app.route('/users/<int:user_id>', methods=['DELETE'])
def delete_user(user_id):
    user = User.query.get(user_id)
    if not user:
        return jsonify({'error': 'User not found'}), 404

    db.session.delete(user)
    db.session.commit()
    return jsonify({'message': f'User with ID {user_id} deleted successfully'}), 200

@app.route('/orders/<int:order_id>', methods=['DELETE'])
def delete_order(order_id):
    order = Order.query.get(order_id)
    if not order:
        return jsonify({'error': 'Order not found'}), 404

    # Optional: Check if there are associated order items and delete them first
    order_items = OrderItem.query.filter_by(order_id=order_id).all()
    for item in order_items:
        db.session.delete(item)

    db.session.delete(order)
    db.session.commit()
    return jsonify({'message': f'Order with ID {order_id} deleted successfully'}), 200



if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)