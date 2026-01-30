CREATE DATABASE IF NOT EXISTS quiz_db;
USE quiz_db;

-- Users Table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    role ENUM('student', 'admin') DEFAULT 'student',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Quizzes Table
CREATE TABLE IF NOT EXISTS quizzes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT
);

-- Questions Table
CREATE TABLE IF NOT EXISTS questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    quiz_id INT,
    question_text TEXT NOT NULL,
    option_a VARCHAR(255) NOT NULL,
    option_b VARCHAR(255) NOT NULL,
    option_c VARCHAR(255) NOT NULL,
    option_d VARCHAR(255) NOT NULL,
    correct_option CHAR(1) NOT NULL, -- 'A', 'B', 'C', 'D'
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id) ON DELETE CASCADE
);

-- Results Table
CREATE TABLE IF NOT EXISTS results (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    quiz_id INT,
    score INT,
    total_questions INT,
    submission_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id) ON DELETE CASCADE
);

-- Insert Default Admin (Password: admin123)
-- NOTE: In production, store hashed passwords!
INSERT INTO users (username, password, role) VALUES ('admin', 'admin123', 'admin');

-- Insert Sample Quiz
INSERT INTO quizzes (title, description) VALUES ('General Knowledge', 'Basic GK Quiz');
INSERT INTO quizzes (title, description) VALUES ('Java Basics', 'Core Java concepts');

-- Insert Sample Questions for Java Basics
INSERT INTO questions (quiz_id, question_text, option_a, option_b, option_c, option_d, correct_option) 
VALUES 
(2, 'What is the size of int in Java?', '16 bit', '32 bit', '64 bit', '8 bit', 'B'),
(2, 'Which keyword is used to define a class?', 'class', 'struct', 'int', 'void', 'A'),
(2, 'Which of these is not a primitive type?', 'int', 'float', 'String', 'boolean', 'C');

-- Insert Sample Questions for GK
INSERT INTO questions (quiz_id, question_text, option_a, option_b, option_c, option_d, correct_option) 
VALUES 
(1, 'Capital of France?', 'London', 'Berlin', 'Paris', 'Madrid', 'C'),
(1, 'Value of Pi?', '3.14', '2.14', '4.14', '3.00', 'A');
