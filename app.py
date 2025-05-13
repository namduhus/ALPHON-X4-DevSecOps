from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello from ALPHON X46667-githubwebook연동테스트 성공2"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)