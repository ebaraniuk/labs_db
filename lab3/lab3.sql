--1--
--email of clients who are studying math
select clients.email,teachers.subject_id, subject.name
from subject, clients
inner join teachers on clients.teacher_id = teachers.id where subject_id = 1

--2--
--amount of clients who are studying algorithms
select count(*)
from clients
inner join teachers on clients.teacher_id = teachers.id where subject_id = 4

--3--
--clients who are studying math and algorithms
select *
from clients
inner join teachers on clients.teacher_id = teachers.id where subject_id between 3 and 4

--4--
--select amount of users with same teacher
select teacher_id,count(*) as Amount_of_students from Clients group by clients.teacher_id order by Amount_of_students

--5--
--amount of students on each subject
select subject.name, count(*) as amount_of_clients
from subject, clients
inner join teachers on clients.teacher_id = teachers.id group by subject.id order by amount_of_clients

--6--
--name of teachers who are teaching java
select subject.name,teachers.first_name,teachers.last_name
from subject,teachers
where subject_id = 3 and subject.name = 'java'

--7--
--change teachers name--
update teachers 
set first_name = 'Natasha' where last_name = 'Doyle'

--8--
--change students subject
update clients
set teacher_id = 2 where email='"hferrant1@topsy.com"'

--9--
--amount of clients who are studying java or math
select count(*)
from clients
inner join teachers on clients.teacher_id = teachers.id where subject_id = 3 or subject_id = 1

--10--
--ordered people by subject
select  subject.name, clients.email, teachers.id
from subject, clients
inner join teachers on clients.teacher_id = teachers.id order by subject.name