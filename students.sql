-- Create Students Records Database 
CREATE DATABASE students_records;

-- Use the Students Records Database 
USE students_records;

-- Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    DateOfBirth DATE NOT NULL,
    EnrollmentDate DATE NOT NULL
);

-- Create Courses table to include Department and Instructor
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(255) NOT NULL,
    Credits INT NOT NULL,
    DepartmentID INT,
    InstructorID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) ON DELETE CASCADE,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID) ON DELETE SET NULL
);

-- Create Enrollments table (Many-to-Many relationship)
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE NOT NULL,
    Grade VARCHAR(5), -- Optional field for grades
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);

-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(255) NOT NULL,
    Head VARCHAR(255)
);

-- Create Instructors table
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) ON DELETE SET NULL
);


-- Create Attendance table
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    AttendanceDate DATE NOT NULL,
    Status ENUM('Present', 'Absent', 'Late'),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);

-- Create Grades table
CREATE TABLE Grades (
    GradeID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    Score DECIMAL(5,2) CHECK (Score BETWEEN 0 AND 100),
    Grade CHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);

-- Create Payments table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentMethod ENUM('Cash', 'Card', 'Bank Transfer'),
    Status ENUM('Completed', 'Pending', 'Failed'),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE
);


-- Insert Sample Data
INSERT INTO Students (FullName, Email, DateOfBirth, EnrollmentDate) VALUES
('Alice Johnson', 'alice@example.com', '2002-05-10', '2025-04-29'),
('Bob Smith', 'bob@example.com', '2003-08-15', '2025-04-28');

INSERT INTO Courses (CourseName, Credits, DepartmentID, InstructorID) VALUES
('Database Systems', 3, 1, 1),
('Web Development', 4, 1, 2),
('Calculus', 3, 2, 2);

INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate, Grade) VALUES
(1, 1, '2025-04-29', 'A'),
(2, 2, '2025-04-28', 'B');

INSERT INTO Departments (DepartmentName, Head) VALUES
('Computer Science', 'Dr. Wilson'),
('Mathematics', 'Prof. Lee');

INSERT INTO Instructors (FullName, Email, DepartmentID) VALUES
('Dr. Roberts', 'roberts@example.com', 1),
('Prof. Adams', 'adams@example.com', 2);

INSERT INTO Attendance (StudentID, CourseID, AttendanceDate, Status) VALUES
(1, 1, '2025-04-29', 'Present'),
(2, 2, '2025-04-28', 'Late');

INSERT INTO Grades (StudentID, CourseID, Score, Grade) VALUES
(1, 1, 92, 'A'),
(2, 2, 76, 'B');

INSERT INTO Payments (StudentID, Amount, PaymentDate, PaymentMethod, Status) VALUES
(1, 5000, '2025-04-29', 'Bank Transfer', 'Completed'),
(2, 4500, '2025-04-28', 'Card', 'Pending');