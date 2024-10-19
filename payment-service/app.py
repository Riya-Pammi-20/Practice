from flask import Flask, jsonify, request

app = Flask(__name__)

payments = []

@app.route('/payments', method=['POST'])
def process_payment():
    payment_info = request.json
    return jsonify({"status" : "processed"}), 200

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5003)
