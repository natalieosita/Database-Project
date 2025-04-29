# Database-Project
# Student Record Management System

## Description
The **Student Record Management System** is a MySQL-based database designed to manage student records, course enrollments, instructors, departments, attendance tracking, grading, and tuition payments efficiently. The system provides structured data storage, ensuring integrity and accessibility for student-related operations.

## Setup and Running the Project

### **1. Import the MySQL Database**
To set up the database, follow these steps:
1. Ensure you have **MySQL installed** on your system.
2. Open **MySQL Workbench** or use the MySQL command-line client.
3. Create the database:
   ```sql
   CREATE DATABASE students_records;

4. Import the SQL schema:
   - If using **MySQL Workbench**, go to `File > Run SQL Script`, and select the `.sql` file containing the database setup.
   - If using the **command line**, run:
     ```bash
     mysql -u root -p students_records < students_records.sql
     ```
5. Verify tables:
   ```sql
   SHOW TABLES;
   ```

### **2. Running the CRUD API**
You can integrate the database with a **FastAPI (Python) or Node.js (JavaScript) API** to perform Create, Read, Update, and Delete operations.

#### **Using FastAPI (Python)**
1. Install dependencies:
   ```bash
   pip install fastapi uvicorn pymysql
   ```
2. Run the API:
   ```bash
   uvicorn main:app --reload
   ```

## **Entity Relationship Diagram (ERD)**
Here is the ERD representing the database structure:


---

