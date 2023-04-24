# create a flask app that query a postgres database named `campus` on a docker container named 'db' and return all the data in students table, and display them in a html page


from flask import Flask, render_template
import mysql.connector

app = Flask(__name__)

# Connect to the mysql database running on the Docker container
mydb = mysql.connector.connect(
    host="mysql_db",
    port='3306',
    user="root",
    password="my-secret-pw"
)

# Define a route to display the data in the students table
@app.route('/')
def index():    
    # Query the students table
    mycursor = mydb.cursor()
    mycursor.execute('use campus')
    mycursor.execute('SELECT * FROM students')
    students = mycursor.fetchall()
    mycursor.close()
    # Render the HTML template with the data
    return render_template('students.html', students=students)
    # return 'hello'


# check if the database exists, if not, create it
def check_database():
    mycursor = mydb.cursor()
    mycursor.execute('show databases')
    databases = mycursor.fetchall()
    if ('campus',) not in databases:
        mycursor.execute('create database campus')
        mycursor.execute('use campus')
        mycursor.execute('create table students (id int, name varchar(255) not null, age int, primary key (id))')
        mycursor.execute('insert into students values (1, "Khaled", 20)')
        mycursor.execute('insert into students values (2, "Zeinab", 21)')
        mycursor.execute('insert into students values (3, "Fatma", 22)')
        mycursor.close()
        return True
    mycursor.close()
    return False

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
