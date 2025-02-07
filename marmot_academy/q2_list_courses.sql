-- set default schema to be marmot_academy
-- valid only for current session
SET search_path TO marmot_academy;

-- list all courses with descriptions
-- nice to order by course name
SELECT  courses.id AS course_id,
		courses.course_name AS course,
		courses.course_description AS description,
		professors.first_name || ' ' || professors.last_name AS taught_by_professor 
		FROM courses
JOIN professors ON courses.professor_id = professors.id
ORDER BY courses.course_name;
