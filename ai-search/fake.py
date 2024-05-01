#!/usr/bin/env python3

from flask import Flask, request, jsonify

app = Flask(__name__)

# Fake JSON data
fake_json_data = [
    {
        "artist": "Fake Artist 1",
        "genre": "Fake Genre 1",
        "title": "Fake Title 1"
    },
    {
        "artist": "Fake Artist 2",
        "genre": "Fake Genre 2",
        "title": "Fake Title 2"
    },
    {
        "artist": "Fake Artist 3",
        "genre": "Fake Genre 3",
        "title": "Fake Title 3"
    }
]

@app.route('/receive_json', methods=['POST'])
def receive_json():
    if request.method == 'POST':
        try:
            # Print the fake JSON data
            print("Received fake JSON data:", fake_json_data)
            return jsonify({"message": "Fake JSON received successfully", "data": fake_json_data}), 200
        except Exception as e:
            return jsonify({"error": str(e)}), 400

@app.route('/get_fake_data', methods=['GET'])
def get_fake_data():
    try:
        # Return the fake JSON data
        
        return jsonify({"data": fake_json_data}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

def main():
    # Run the Flask app on 127.0.0.1:9091
    app.run(host='127.0.0.1', port=9091, debug=True)

if __name__ == "__main__":
    main()
