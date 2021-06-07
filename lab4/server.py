from flask import Flask, render_template, request
from main import Psql

app = Flask(__name__)
psql = Psql(input())


@app.route("/", methods=['post', 'get'])
def display_table():
    if request.method == 'POST':
        command = request.form.get('command')
        message = psql.execute_fetch(command)
        return render_template("response.html", command=command, message=message)

    table_list = psql.execute_fetch(
        "SELECT table_name FROM information_schema.tables WHERE (table_schema = 'public') ORDER BY table_name;")
    data = {}
    for table in table_list:
        table_data = psql.get_table_contents(table[0])
        data.update({table[0]: table_data})
    return render_template("main.html", data=data)


def init():
    psql.execute_file("sql/create_tables.sql")

    psql.execute_file("./sql/subject.sql")
    psql.execute_file("./sql/teachers.sql")
    psql.execute_file("./sql/clients.sql")

    print("database initialised")


init()
app.run()
