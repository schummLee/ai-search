#!/usr/bin/env python3

import sys
import json
from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/receive_json', methods=['POST'])
def receive_json():
    if request.method == 'POST':
        try:
            # Retrieve JSON data from the request
            json_data = request.get_json()
            if json_data is None:
                return jsonify({"error": "No JSON data received"}), 400
            
            # Print the received JSON data
            print("Received JSON data:", json_data)
            
            return jsonify({"message": "JSON received successfully"}), 200
        except Exception as e:
            return jsonify({"error": str(e)}), 400

def main():
    # Check if JSON data is passed as a command-line argument
    if len(sys.argv) < 2:
        print("Usage: python script.py '<json_data>'")
        sys.exit(1)
    
    # Extract JSON data from command-line argument
    json_str = sys.argv[1]
    
    try:
        # Parse JSON string to Python dictionary
        json_data = json.loads(json_str)
    except json.JSONDecodeError as e:
        print("Error decoding JSON:", e)
        sys.exit(1)
    
    # Run the Flask app on 127.0.0.1:9090
    app.run(host='127.0.0.1', port=9090, debug=True)

if __name__ == "__main__":
    main()
