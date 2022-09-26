from flask import Flask,render_template,request
import platform
app = Flask(__name__)

hostname = platform.node()
@app.route('/')
def hostdisplay():
    return render_template('index.html',hostname=hostname)

if __name__ == '__main__':
    app.run(host="0.0.0.0")