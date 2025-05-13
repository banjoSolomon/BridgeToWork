#todo.py
from flask import Flask, request, jsonify

app = Flask(__name__)

tasks = []
id_counter = 1


@app.route('/tasks', methods=['POST'])
def add_task():
    global id_counter
    data = request.get_json()
    task = {'id': id_counter, 'title': data.get('title')}
    tasks.append(task)
    id_counter += 1
    return jsonify(task), 201


@app.route('/tasks', methods=['GET'])
def get_tasks():
    return jsonify(tasks)


@app.route('/tasks/<int:task_id>', methods=['DELETE'])
def delete_task(task_id):
    global tasks
    tasks = [task for task in tasks if task['id'] != task_id]
    return '', 204


@app.route('/health', methods=['GET'])
def health():
    return 'OK', 200


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3000)
