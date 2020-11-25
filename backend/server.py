from flask import Flask, request, jsonify
from flask_cors import CORS
from flask_bcrypt import Bcrypt

import psycopg2

app = Flask(__name__)
bcrpyt = Bcrypt(app)
CORS(app)

#Configure database
conn = psycopg2.connect(dbname="timecapsule", port="5432")

#register API
@app.route("/api/register", methods=['POST'])
def register():
	try:
		userId = request.get_json()['userId']
		email = request.get_json()['email']
		password = request.get_json()['password']
		
		cur = conn.cursor()
		cur.execute("INSERT INTO Users(userId, email, password) VALUES (%s, %s, %s)", (userId, email, password))

		conn.commit()
		cur.close()

		return {"value": True}
	except:
		raise Exception('Error test')

if __name__ == '__main__':
    app.debug = True
    app.run(host = '0.0.0.0', port=3001)