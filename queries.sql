-- Get all the details from the teachers table.
SELECT *
FROM teacher;

-- Get the last names and birthdays of all the teachers.
SELECT last_name, dob
FROM teacher;

-- Find all courses in English
SELECT *
FROM course
WHERE language = 'ENG';

-- Find all courses in English, order by latest start date
SELECT *
FROM course
WHERE language = 'ENG'
ORDER BY start_date DESC;

-- Find all courses in English at B2 level
SELECT *
FROM course
WHERE language = 'ENG' AND level = 'B2';

-- Find all courses in English and all courses at B2 level
SELECT *
FROM course
WHERE language = 'ENG' OR level = 'C1';

-- Find all courses where the language is not English and the level is not C1
SELECT *
FROM course
WHERE NOT language = 'ENG' OR level = 'C1';

-- Get the names and phone numbers of all teachers born before 1990.
SELECT first_name, last_name, phone_no
FROM teacher
WHERE dob < '1990-01-01';

-- Do the same as before but use aliasing.
SELECT first_name AS First Name, last_name AS 'Last Name', phone_no AS Telephone
FROM teacher
WHERE dob < '1990-01-01';

-- Find all courses which start in January
SELECT *
FROM course
WHERE start_date BETWEEN '2020-01-01' AND '2020-01-31';

-- Find intermediate courses
SELECT course_name
FROM course
WHERE course_name LIKE '%interm%';

-- Find participants whose last names are Garcia, Nowak or Mustermann
SELECT first_name, last_name
FROM participant
WHERE last_name IN ('Garcia', 'Nowak', 'Mustermann');

-- Identify teachers who only teach one or two languages
SELECT * 
FROM teacher
WHERE language_2 IS NULL;

SELECT * 
FROM teacher
WHERE language_2 IS NOT NULL;

-- Find the average length of a course
SELECT AVG(course_length_weeks)
FROM course;

-- Find the average length of a course, grouped by client
SELECT client, AVG(course_length_weeks)
FROM course
GROUP BY client;

-- Count the number of courses
SELECT COUNT(*)
FROM course;

-- Count the number of courses in English
SELECT COUNT(*)
FROM course
WHERE language = 'Eng';

-- How many courses does the school offer in each language?
SELECT language, COUNT(language)
FROM course
GROUP BY language;

-- Find all the teachers whose birthdate is above the average teacher's birthdate 
SELECT *
FROM teacher
WHERE dob > 
    (SELECT AVG(dob)
    FROM teacher);

-- Get the course details for all courses which take place at the client's offices.
SELECT course.course_id, course.course_name, course.language, client.client_name, client.address
FROM course
JOIN client
ON course.client = client.client_id
WHERE course.in_school = FALSE;

-- Get the course details for all courses which take place at the client's offices, which are taught
-- by Stefanie Martin (as above, but with added details).
SELECT course.course_id, course.course_name, course.language, client.client_name, client.address
FROM course
JOIN client
ON course.client = client.client_id
WHERE course.in_school = FALSE AND course.teacher = 2;

-- Get all particpants in classes taught by Niamh Murphy
SELECT participant.first_name, participant.last_name
FROM participant
JOIN takes_course ON takes_course.participant_id = participant.participant_id 
JOIN course ON takes_course.course_id = course.course_id
WHERE takes_course.course_id = 
    (SELECT takes_course.course_id 
    WHERE course.teacher = 6);

-- queries for new table, industry_prospects
SELECT client.client_name, client.industry, industry_prospects.outlook
FROM client
JOIN industry_prospects
ON client.industry = industry_prospects.industry;

SELECT client.client_name, client.industry, industry_prospects.outlook
FROM client
LEFT JOIN industry_prospects
ON client.industry = industry_prospects.industry;

SELECT client.client_name, client.industry, industry_prospects.outlook
FROM client
RIGHT JOIN industry_prospects
ON client.industry = industry_prospects.industry;

SELECT client.client_name, client.industry, industry_prospects.outlook
FROM client
FULL JOIN industry_prospects
ON client.industry = industry_prospects.industry;