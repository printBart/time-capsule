from flask import Flask, request, jsonify
from flask_cors import CORS
from flask_bcrypt import Bcrypt

import psycopg2

app = Flask(__name__)
bcrpyt = Bcrypt(app)
CORS(app)

#Configure database
conn = psycopg2.connect(dbname="timecapsule", port="5432")

#test API
@app.route("/api/test", methods=['POST'])
def test():
	try:
		print("test")
		return {"value": True}
	except:
		raise Exception('Error test')