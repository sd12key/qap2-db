-- create new schema, not to mix all of
-- my tables in the default public schema
CREATE SCHEMA IF NOT EXISTS marmot_academy;

-- set default schema to be marmot_academy
-- valid only for current session
SET search_path TO marmot_academy;

-- drop tables if they exist
DROP TABLE IF EXISTS enrollments, courses, students, professors;

-- students table
-- maybe good idea to set email as UNIQUE
CREATE TABLE students (
	id SERIAL PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	email TEXT UNIQUE,
	school_enrollment_date DATE
);

-- professors table
CREATE TABLE professors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    department TEXT
);

-- courses table
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name TEXT NOT NULL,
    course_description TEXT,
    professor_id INT REFERENCES professors(id)
);

-- enrollments Table
CREATE TABLE enrollments (
    student_id INT REFERENCES students(id),
    course_id INT REFERENCES courses(id),
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id)
);
