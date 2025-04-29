from fastapi import FastAPI
import pymysql

app = FastAPI()

# Connect to MySQL
connection = pymysql.connect(
    host="localhost:3306",
    user="root",
    password="#CodeAcademy37",
    database="students_records_db"
)

# CRUD Operations
@app.get("/students")
def get_students():
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM Students")
        result = cursor.fetchall()
    return {"students": result}

@app.post("/students")
def create_student(student: dict):
    with connection.cursor() as cursor:
        cursor.execute("INSERT INTO Students (FullName, Email, DateOfBirth, EnrollmentDate) VALUES (%s, %s, %s, %s)",
                       (student["FullName"], student["Email"], student["DateOfBirth"], student["EnrollmentDate"]))
        connection.commit()
    return {"message": "Student created"}