from flask import Flask, jsonify, request

app = Flask(__name__)

products = [
    {"id":1, "name": "Laptop", "price": 1200},
    {"id":2, "name": "Phone", "price": 800}
]

@app.route('/products', methods=['GET'])
def get_products():
    return jsonify(products)

@app.route('/products', methods=['POST'])
def add_product():
    new_product = request.json
    products.append(new_product)
    return jsonify(new_product), 201

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5001)
    
    
    
# .............explanation..................................

# The provided code is a simple web API built using the Flask framework in Python. This API allows users to retrieve a list of products and add new products to the list. Here's a breakdown of each part of the code:

# ### 1. **Importing Required Modules**
# ```python
# from flask import Flask, jsonify, request
# ```
# - **`Flask`**: This is the main class from the Flask framework, used to create the web application.
# - **`jsonify`**: A helper function from Flask that converts Python data (like lists or dictionaries) into JSON format, which is the standard format for web APIs.
# - **`request`**: This object allows you to access data sent in the HTTP request, especially for handling `POST` requests when data is sent from the client.

# ### 2. **Creating a Flask App**
# ```python
# app = Flask(__name__)
# ```
# - **`app`**: This is the Flask app instance, which represents the web application. The argument `'__name__'` is passed so Flask knows where to look for resources and templates.

# ### 3. **Product Catalog**
# ```python
# products = [
#     {"id": 1, "name": "Laptop", "price": 1200},
#     {"id": 2, "name": "Phone", "price": 800},
# ]
# ```
# - **`products`**: This is a simple list that contains dictionaries. Each dictionary represents a product in the catalog, with attributes `id`, `name`, and `price`.

# ### 4. **GET Endpoint to Retrieve Products**
# ```python
# @app.route('/products', methods=['GET'])
# def get_products():
#     return jsonify(products)
# ```
# - **`@app.route('/products', methods=['GET'])`**: This defines a route (URL) `/products` that can be accessed via the `GET` method to retrieve data.
# - **`get_products()`**: A function that is called when a user sends a `GET` request to the `/products` endpoint. It returns the list of products in JSON format using the `jsonify()` function.

# ### 5. **POST Endpoint to Add New Products**
# ```python
# @app.route('/products', methods=['POST'])
# def add_product():
#     new_product = request.json
#     products.append(new_product)
#     return jsonify(new_product), 201
# ```
# - **`@app.route('/products', methods=['POST'])`**: This defines another route `/products` that handles `POST` requests for adding new products.
# - **`add_product()`**: This function is called when a user sends a `POST` request to `/products`. 
#   - `request.json`: This extracts the data sent in the request body (in JSON format) and stores it in the `new_product` variable.
#   - `products.append(new_product)`: This adds the new product to the `products` list.
#   - `return jsonify(new_product), 201`: This returns the new product in JSON format and a status code of `201`, which indicates that the resource was successfully created.

# ### 6. **Running the Application**
# ```python
# if __name__ == "__main__":
#     app.run(host='0.0.0.0', port=5001)
# ```
# - **`if __name__ == "__main__"`**: This checks if the script is being run directly (and not imported as a module elsewhere). If it's run directly, it starts the Flask application.
# - **`app.run(host='0.0.0.0', port=5001)`**: This starts the Flask development server.
#   - `host='0.0.0.0'`: Makes the application accessible on the local network.
#   - `port=5001`: Specifies that the application will run on port `5001`.

# ### Summary of Endpoints
# 1. **GET /products**: Retrieves the list of all products in JSON format.
# 2. **POST /products**: Allows you to add a new product to the list by sending a JSON payload in the request body.

# ### Example Usage:
# - **GET /products**:
#   ```json
#   [
#     {"id": 1, "name": "Laptop", "price": 1200},
#     {"id": 2, "name": "Phone", "price": 800}
#   ]
#   ```
# - **POST /products**: 
#   You would send a new product as a JSON object:
#   ```json
#   {
#     "id": 3,
#     "name": "Tablet",
#     "price": 600
#   }
#   ```
#   After the POST request, this product will be added to the `products` list.

