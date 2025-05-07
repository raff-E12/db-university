-- Query con GROUP BY:
-- 1. Contare quanti iscritti ci sono stati ogni anno.
   SELECT YEAR(enrolment_date) AS years, COUNT(enrolment_date) AS enrolment_count FROM students GROUP BY years;
   
-- 2.Contare gli insegnanti che hanno l'ufficio nello stesso edificio
   SELECT office_number, COUNT(office_address) AS count_office_location FROM teachers GROUP BY office_number;
   
-- 3.Calcolare la media dei voti di ogni appello d'esame.
   SELECT student_id, AVG(vote) AS average_rating FROM exam_student GROUP BY student_id;
-- Alternativa:
   SELECT CONCAT(tb2.name, "-", tb2.surname) AS students, AVG(tb1.vote) AS average_rating FROM exam_student AS tb1
   INNER JOIN students AS tb2 ON tb1.student_id = tb2.id GROUP BY students;
   
-- 4.Contare quanti corsi di laurea ci sono per ogni dipartimento.
   SELECT department_id, COUNT(name) AS count_course FROM degrees GROUP BY department_id;
-- Alternativa:
   SELECT tb2.name AS departments, COUNT(tb1.name) AS count_course FROM degrees AS tb1
   INNER JOIN departments AS tb2 ON tb1.department_id = tb2.id GROUP BY tb2.name;