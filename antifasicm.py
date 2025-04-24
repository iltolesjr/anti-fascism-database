from flask import Flask, jsonify, request
import sqlite3

app = Flask(__name__)

def get_db_connection():
    conn = sqlite3.connect('database.db')
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/tips', methods=['GET'])
def get_tips():
    conn = get_db_connection()
    tips = conn.execute('SELECT * FROM tips').fetchall()
    conn.close()
    return jsonify([dict(row) for row in tips])

@app.route('/kanban', methods=['GET', 'POST'])
def kanban():
    conn = get_db_connection()
    if request.method == 'GET':
        tasks = conn.execute('SELECT * FROM kanban').fetchall()
        conn.close()
        return jsonify([dict(row) for row in tasks])
    elif request.method == 'POST':
        new_task = request.json
        conn.execute('INSERT INTO kanban (task, status, priority) VALUES (?, ?, ?)',
                     (new_task['task'], new_task['status'], new_task['priority']))
        conn.commit()
        conn.close()
        return jsonify({'message': 'Task added successfully'}), 201

if __name__ == '__main__':
    app.run(debug=True)