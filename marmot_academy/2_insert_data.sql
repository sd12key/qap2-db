-- set default schema to be marmot_academy
-- valid only for current session
SET search_path TO marmot_academy;

-- was used for debug purposes, removing all data
-- from the tables, and resetting serial id counters
TRUNCATE TABLE students, professors, courses, enrollments RESTART IDENTITY;

-- insert data into students table
INSERT INTO students (first_name, last_name, email, school_enrollment_date) 
VALUES 
    ('Jeffrey', 'Lebowski', 'thedude@marmot.edu', '2024-09-01'),
    ('Walter', 'Sobchak', 'sobchakw@marmot.edu', '2024-09-01'),
    ('Donny', 'Kerabatsos', 'kerabatsosd@marmot.edu', '2024-09-01'),
    ('Bunny', 'Lebowski', 'lebowskib@marmot.edu', '2025-01-10'),
    ('Francis', 'Donelly', 'donellyf@marmot.edu', '2024-09-01'),
    ('Larry', 'Sellers', 'sellersl@marmot.edu', '2025-01-10'),
    ('Arthur Digby', 'Sellers', 'sellersa@marmot.edu', '2025-01-10'),
    ('Uli', 'Kunkel', 'kunkelu@marmot.edu', '2024-09-01'),
    ('Karl', 'Hungus', 'hungusk@marmot.edu', '2024-09-01'),
    ('Jim', 'Smokey', 'smokeyj@marmot.edu', '2024-09-01'),
    ('Maude', 'Lebowski', 'lebowskim@marmot.edu', '2025-01-10');

-- insert data into professors table
INSERT INTO professors (first_name, last_name, department) 
VALUES 
    ('Jesus', 'Quintana', 'Physical Education'),
    ('Jackie', 'Treehorn', 'Art'),
    ('Michael', 'Stranger', 'Philosophy'),
    ('Richard', 'Brandt', 'Business');

-- insert data into courses table
INSERT INTO courses (course_name, course_description, professor_id)
VALUES 
    ('Philosophy of Bowling', 'Exploring the deeper meaning of life through bowling', (SELECT id FROM professors WHERE first_name = 'Michael' AND last_name = 'Stranger')),
    ('Abstract Rug Art', 'How rugs tie the room together', (SELECT id FROM professors WHERE first_name = 'Jackie' AND last_name = 'Treehorn')),
    ('Business Ethics', 'Navigating the complexities of ransom negotiations', (SELECT id FROM professors WHERE first_name = 'Richard' AND last_name = 'Brandt')),
    ('Advanced Bowling Techniques', 'Mastering the art of bowling with flair', (SELECT id FROM professors WHERE first_name = 'Jesus' AND last_name = 'Quintana')),
    ('Nihilism and Existentialism', 'The philosophy of nothingness', (SELECT id FROM professors WHERE first_name = 'Michael' AND last_name = 'Stranger')),
    ('The Art of Negotiation', 'How to get what you want (or not)', (SELECT id FROM professors WHERE first_name = 'Richard' AND last_name = 'Brandt')),
    ('Physical Fitness and Dance', 'Staying fit while looking fabulous', (SELECT id FROM professors WHERE first_name = 'Jesus' AND last_name = 'Quintana')),
    ('Shomer Shabbos', 'A deep dive into Shabbos rules', (SELECT id FROM professors WHERE first_name = 'Jesus' AND last_name = 'Quintana')),
    ('Advanced Henchman Management', 'Learn how to recruit-train-deploy henchmen effectively', (SELECT id FROM professors WHERE first_name = 'Jackie' AND last_name = 'Treehorn')),
	('Marmot Strategies', 'Tactical deployment of enraged rodents in high-stakes negotiations', (SELECT id FROM professors WHERE first_name = 'Richard' AND last_name = 'Brandt'));

-- insert data into enrollments table
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES 
    ((SELECT id FROM students WHERE first_name = 'Jeffrey' AND last_name = 'Lebowski'), (SELECT id FROM courses WHERE course_name = 'Philosophy of Bowling'), '2025-01-10'),
    ((SELECT id FROM students WHERE first_name = 'Jeffrey' AND last_name = 'Lebowski'), (SELECT id FROM courses WHERE course_name = 'Abstract Rug Art'), '2025-01-12'),
    ((SELECT id FROM students WHERE first_name = 'Jeffrey' AND last_name = 'Lebowski'), (SELECT id FROM courses WHERE course_name = 'Nihilism and Existentialism'), '2025-01-15'),
    ((SELECT id FROM students WHERE first_name = 'Jeffrey' AND last_name = 'Lebowski'), (SELECT id FROM courses WHERE course_name = 'The Art of Negotiation'), '2025-01-18'),
    ((SELECT id FROM students WHERE first_name = 'Walter' AND last_name = 'Sobchak'), (SELECT id FROM courses WHERE course_name = 'Advanced Bowling Techniques'), '2025-01-11'),
    ((SELECT id FROM students WHERE first_name = 'Walter' AND last_name = 'Sobchak'), (SELECT id FROM courses WHERE course_name = 'Shomer Shabbos'), '2025-01-13'),
    ((SELECT id FROM students WHERE first_name = 'Walter' AND last_name = 'Sobchak'), (SELECT id FROM courses WHERE course_name = 'Physical Fitness and Dance'), '2025-01-16'),
    ((SELECT id FROM students WHERE first_name = 'Walter' AND last_name = 'Sobchak'), (SELECT id FROM courses WHERE course_name = 'Advanced Henchman Management'), '2025-01-20'),
    ((SELECT id FROM students WHERE first_name = 'Donny' AND last_name = 'Kerabatsos'),	(SELECT id FROM courses WHERE course_name = 'Advanced Bowling Techniques'), '2025-01-10'),
    ((SELECT id FROM students WHERE first_name = 'Donny' AND last_name = 'Kerabatsos'),	(SELECT id FROM courses WHERE course_name = 'Philosophy of Bowling'), '2025-01-14'),
    ((SELECT id FROM students WHERE first_name = 'Donny' AND last_name = 'Kerabatsos'),	(SELECT id FROM courses WHERE course_name = 'Physical Fitness and Dance'), '2025-01-19'),
    ((SELECT id FROM students WHERE first_name = 'Bunny' AND last_name = 'Lebowski'), (SELECT id FROM courses WHERE course_name = 'Abstract Rug Art'), '2025-01-12'),
    ((SELECT id FROM students WHERE first_name = 'Bunny' AND last_name = 'Lebowski'), (SELECT id FROM courses WHERE course_name = 'Business Ethics'), '2025-01-15'),
    ((SELECT id FROM students WHERE first_name = 'Bunny' AND last_name = 'Lebowski'), (SELECT id FROM courses WHERE course_name = 'The Art of Negotiation'), '2025-01-21'),
    ((SELECT id FROM students WHERE first_name = 'Francis' AND last_name = 'Donelly'), (SELECT id FROM courses WHERE course_name = 'Nihilism and Existentialism'), '2025-01-11'),
    ((SELECT id FROM students WHERE first_name = 'Francis' AND last_name = 'Donelly'), (SELECT id FROM courses WHERE course_name = 'Advanced Henchman Management'), '2025-01-13'),
    ((SELECT id FROM students WHERE first_name = 'Francis' AND last_name = 'Donelly'), (SELECT id FROM courses WHERE course_name = 'Physical Fitness and Dance'), '2025-01-17'),
    ((SELECT id FROM students WHERE first_name = 'Larry' AND last_name = 'Sellers'), (SELECT id FROM courses WHERE course_name = 'Philosophy of Bowling'), '2025-01-10'),
    ((SELECT id FROM students WHERE first_name = 'Larry' AND last_name = 'Sellers'), (SELECT id FROM courses WHERE course_name = 'Advanced Bowling Techniques'), '2025-01-14'),
    ((SELECT id FROM students WHERE first_name = 'Larry' AND last_name = 'Sellers'), (SELECT id FROM courses WHERE course_name = 'Business Ethics'), '2025-01-18'),
    ((SELECT id FROM students WHERE first_name = 'Arthur Digby' AND last_name = 'Sellers'), (SELECT id FROM courses WHERE course_name = 'Abstract Rug Art'), '2025-01-12'),
    ((SELECT id FROM students WHERE first_name = 'Arthur Digby' AND last_name = 'Sellers'), (SELECT id FROM courses WHERE course_name = 'Nihilism and Existentialism'), '2025-01-16'),
    ((SELECT id FROM students WHERE first_name = 'Arthur Digby' AND last_name = 'Sellers'), (SELECT id FROM courses WHERE course_name = 'The Art of Negotiation'), '2025-01-20'),
    ((SELECT id FROM students WHERE first_name = 'Uli' AND last_name = 'Kunkel'), (SELECT id FROM courses WHERE course_name = 'Philosophy of Bowling'), '2025-01-10'),
    ((SELECT id FROM students WHERE first_name = 'Uli' AND last_name = 'Kunkel'), (SELECT id FROM courses WHERE course_name = 'Advanced Henchman Management'), '2025-01-13'),
    ((SELECT id FROM students WHERE first_name = 'Uli' AND last_name = 'Kunkel'), (SELECT id FROM courses WHERE course_name = 'Shomer Shabbos'), '2025-01-17'),
    ((SELECT id FROM students WHERE first_name = 'Karl' AND last_name = 'Hungus'), (SELECT id FROM courses WHERE course_name = 'Nihilism and Existentialism'), '2025-01-11'),
    ((SELECT id FROM students WHERE first_name = 'Karl' AND last_name = 'Hungus'), (SELECT id FROM courses WHERE course_name = 'Business Ethics'), '2025-01-15'),
    ((SELECT id FROM students WHERE first_name = 'Karl' AND last_name = 'Hungus'), (SELECT id FROM courses WHERE course_name = 'Physical Fitness and Dance'), '2025-01-19'),
    ((SELECT id FROM students WHERE first_name = 'Jim' AND last_name = 'Smokey'), (SELECT id FROM courses WHERE course_name = 'Advanced Bowling Techniques'), '2025-01-10'),
    ((SELECT id FROM students WHERE first_name = 'Jim' AND last_name = 'Smokey'), (SELECT id FROM courses WHERE course_name = 'Shomer Shabbos'), '2025-01-14'),
    ((SELECT id FROM students WHERE first_name = 'Jim' AND last_name = 'Smokey'), (SELECT id FROM courses WHERE course_name = 'The Art of Negotiation'), '2025-01-18'),
    ((SELECT id FROM students WHERE first_name = 'Maude' AND last_name = 'Lebowski'), (SELECT id FROM courses WHERE course_name = 'Abstract Rug Art'), '2025-01-12'),
    ((SELECT id FROM students WHERE first_name = 'Maude' AND last_name = 'Lebowski'), (SELECT id FROM courses WHERE course_name = 'Business Ethics'), '2025-01-16'),
    ((SELECT id FROM students WHERE first_name = 'Maude' AND last_name = 'Lebowski'), (SELECT id FROM courses WHERE course_name = 'Advanced Henchman Management'), '2025-01-21');

-- check
-- SELECT * FROM students
-- SELECT * FROM professors
-- SELECT * FROM courses;
-- SELECT * FROM enrollments;
SELECT  students.first_name || ' ' || students.last_name AS student,
    	students.school_enrollment_date AS joined_academy,
    	courses.course_name || ' (' || courses.course_description || ')' AS enrolled_in_course,
    	enrollments.enrollment_date AS date_of_enrollment,
    	professors.first_name || ' ' || professors.last_name AS taught_by_professor
		FROM students
JOIN enrollments ON students.id = enrollments.student_id
JOIN courses ON courses.id = enrollments.course_id
JOIN professors ON courses.professor_id = professors.id;
