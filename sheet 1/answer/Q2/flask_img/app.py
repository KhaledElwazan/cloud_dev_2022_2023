import sys
from flask import Flask

app = Flask(__name__)


@app.route('/')
def index():
    return """
        <html>

        <body>

            <h1>Hello world from Flask</h1>

            <img src="./static/crying.jpg"/>


        </body>


        </html>

        """


if __name__ == '__main__':

    app.run(debug=True)