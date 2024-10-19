from flask import Flask, jsonify, request

app = Flask(__name__)

cart = []

@app.route('/cart', methods=['GET'])
def get_cart():
    return jsonify(cart)

# Add item to cart

@app.route('/cart', methods=['POST'])
def add_to_cart():
    item = request.json
    cart.append(item)
    return jsonify(item), 201

# Remove the item from cart

@app.route('/cart/<int:item_id>', methods=['DELETE'])
def remove_from_cart(item_id):
    global cart
    cart = [item for item in cart if item['id'] != item_id]
    return jsonify({"message": "Item removed"}), 200

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5002)