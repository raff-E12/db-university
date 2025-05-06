-- Script di esecuzione:

-- selezionare tutti gli studenti nati nel 1990.
select * from students where year(`date_of_birth`) = 1990;

-- selezionare tutti i corsi che valgono più di 10 crediti.
select * from exam_student where `vote` > 10;

-- selezionare gli studenti che hanno più di 30 anni.
select * from students where floor(year(now()) - year(`date_of_birth`)) > 30 ;

-- selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea.
select * from courses where `period` =  "I semestre";

-- Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020.
select * from exams where `date` = "2020-06-20" and hour(`hour`) > 14;

-- Selezionare tutti i corsi di laurea magistrale.
select * from degrees where `level` = "magistrale";

-- Da quanti dipartimenti è composta l'università.
select (select count(id) from departments) as total_depaertments;

--  Quanti sono gli insegnanti che non hanno un numero di telefono.
select (select count(phone) from teachers where phone is not null) as teachers_null_numbers;
-- select * from teachers where phone is null;
