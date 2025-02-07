-- set default schema to be marmot_academy
-- valid only for current session
SET search_path TO marmot_academy;

-- select distinct courses which active enrollments
-- sort by course_name
-- (see that course with id=10 has no enrollments)
SELECT
	DISTINCT courses.course_name AS courses_with_active_enrollments,
	courses.id AS course_id
    FROM courses
JOIN enrollments ON courses.id = enrollments.course_id
ORDER BY courses.course_name;
