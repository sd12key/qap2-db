-- set default schema to be marmot_academy
-- valid only for current session
SET search_path TO marmot_academy;

-- update e-mail
UPDATE students
SET email = 'lebowskij@marmot.edu'
WHERE first_name = 'Jeffrey' AND last_name = 'Lebowski';

-- check after update
SELECT 
    first_name || ' ' || last_name AS student_name,
    email AS current_email
	FROM students
WHERE first_name = 'Jeffrey' AND last_name = 'Lebowski';