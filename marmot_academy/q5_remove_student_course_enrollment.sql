-- set default schema to be marmot_academy
-- valid only for current session
SET search_path TO marmot_academy;

-- remove Bunny Lebowski from Business Ethics
DELETE FROM enrollments
WHERE student_id = (
    SELECT id FROM students 
    WHERE first_name = 'Bunny' AND last_name = 'Lebowski'
)
AND course_id = (
    SELECT id FROM courses 
    WHERE course_name = 'Business Ethics'
);

-- check remaining enrollments
SELECT  students.first_name || ' ' || students.last_name AS student,
		courses.course_name AS enrolled_in_courses
		FROM enrollments
JOIN students ON enrollments.student_id = students.id
JOIN courses ON enrollments.course_id = courses.id
WHERE students.first_name = 'Bunny' AND students.last_name = 'Lebowski';
