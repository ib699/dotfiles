from flask import Flask, request, jsonify
from flask_cors import CORS
import requests

app = Flask(__name__)
CORS(app)

@app.route('/api/generate', methods=['POST'])
def proxy_generate():
    data = request.json
    url = 'http://localhost:11434/api/generate'
    headers = {'Content-Type': 'application/json'}

    response = requests.post(url, json=data, headers=headers, stream=True)
    
    def generate():
        for line in response.iter_lines():
            if line:
                yield line.decode('utf-8')

    return app.response_class(generate(), content_type='application/json')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

