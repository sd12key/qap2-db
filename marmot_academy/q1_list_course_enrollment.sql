-- set default schema to be marmot_academy
-- valid only for current session
SET search_path TO marmot_academy;

-- list enrollments for 'Abstract Rug Art' course
SELECT 	(students.first_name || ' ' || students.last_name) AS student_name,
		courses.course_name AS enrolled_in_course, 
		(professors.first_name || ' ' || professors.last_name) AS taught_by_professor 
        FROM students
JOIN enrollments ON students.id = enrollments.student_id
JOIN courses ON courses.id = enrollments.course_id
JOIN professors ON courses.professor_id = professors.id
WHERE courses.course_name = 'Abstract Rug Art';



