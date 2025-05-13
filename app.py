from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello from ALPHON X4-보안 파이프라인 구축 및 테스트 성공"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)