from flask import Flask, render_template, send_from_directory
from flask_cors import CORS, cross_origin


app = Flask(__name__, )
cors = CORS(app, support_credentials=True)

FLUTTER_WEB_APP = 'templates'


@app.route('/')
@cross_origin()
def render_page():
    return render_template('index.html')


@app.route('/web/')
@cross_origin()
def render_page_web():
    return render_template('index.html')


@app.route('/web/<path:name>')
@cross_origin()
def return_flutter_doc(name):

    datalist = str(name).split('/')
    DIR_NAME = FLUTTER_WEB_APP

    if len(datalist) > 1:
        for i in range(0, len(datalist) - 1):
            DIR_NAME += '/' + datalist[i]

    return send_from_directory(DIR_NAME, datalist[-1])


if __name__ == '__main__':
    app.run(debug=True)
