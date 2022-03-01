import os
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_geek():
    DEVOPS = os.environ.get('DEVOPS')
    return f'<h1>Env variable DEVOPS is {DEVOPS}</h2>'

if __name__ == "__main__":
    app.run(debug=True)