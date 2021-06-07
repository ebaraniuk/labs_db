import psycopg2
from tabulate import tabulate

class Psql:
    def __init__(self, password:str, dbname = 'lab4', user = 'postgres', host='localhost'):
        self.conn = psycopg2.connect(dbname = dbname,
                                     user = user,
                                     host = host,
                                     password = password)
        self.cursor = self.conn.cursor()
        print('Connect succeed')

    def get_data(self):
        command = input("Input sql command: ")
        self.cursor.execute(command)
        data = self.cursor.fetchall()
        print(tabulate(data, tablefmt='orgtbl'))

    def execute_file(self, filepath):
        with open(filepath, "r") as f:
            self.cursor.execute(f.read())

    def execute_fetch(self, command):
        self.cursor.execute(command)
        return self.cursor.fetchall()

    def get_table_contents(self, table_name):
        self.cursor.execute(f"select * from {table_name}")
        colns = [i[0] for i in self.cursor.description]
        data = self.cursor.fetchall()
        return [colns, data]

    def __del__(self):
        self.cursor.close()
        self.conn.close()

if __name__ == "__main__":
    pass