#1: What are the requirements from the client?

The International Language School is a language training school.
It offers language classes for corporate clients, which can be conducted at the School or at the offices of the client as they prefer. The School employs teachers, each of whom may teach multiple courses.
The school has clients, each of whom may offer multiple courses via the school. Clients offer courses to their employees, who have the option to participate.
Each course is offered by one client. Each course has one teacher at any given time.
Participants in the courses are employees of the client companies, i.e. they work for the client companies. Each participant can be employed by one company at a time. Participants may be enrolled in more than one course.

#2: Making a plan based on the requirements

Identifying the entities:

The entities that we will create tables for are: clients, teachers, courses and participants.

#3: Which attributes do we want to store?

A. Clients
client_id
client_name
address
industry

B. Teachers
teacher_id
first_name
last_name
dob
phone_no
language_1
language_2
tax_id

C. Courses
course_id
course_name
course_length_weeks
start_date
language
level
in_school (y/n) - (if no, takes place in client's office)
*teacher (has one - A course has one teacher) - this attribute is a foreign key, which references the teacher_id attribute in the teacher entity
*client (has one - A course is offered by A client) - Each client may offer multiple courses through the school, but each course may be associated with a maximum of 1 client, so again we have a 1-to-N relationship.

D. Participants
participant_id
first_name
last_name
phone_no
*client (has one - participant works for one client) - foreign key (a 1-to-N relationship — clients may employ multiple participants, participants may only work for one client)
