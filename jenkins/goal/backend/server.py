from flask import Flask, request
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/api', methods=['GET'])
def api():
    return {"message": "Hello, World!"}

@app.route('/api/message', methods=['GET'])
def message():
    message = request.args.get('message')
    if message:
        return {"message": f"{message}"}
    else:
        return {"error": "No message provided"}, 400

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=3000)
