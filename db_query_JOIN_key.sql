-- Query con JOIN:
-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia.
    SELECT tb2.id, tb2.name, tb2.surname, tb1.name FROM degrees AS tb1 
    INNER JOIN students AS tb2 ON tb1.id = tb2.degree_id WHERE tb1.name = "Corso di Laurea in Economia";
    
-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze.
    SELECT tb1.id, tb2.name AS department, tb1.name AS courses 
    FROM degrees AS tb1 INNER JOIN departments AS tb2 ON tb1.department_id = tb2.id WHERE tb2.name = "Dipartimento di Neuroscienze";
    
-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44).
    SELECT tb2.name, tb2.surname, tb1.name AS teachers_course FROM degrees 
    AS tb1 RIGHT JOIN teachers AS tb2 ON tb1.id = tb2.id WHERE tb2.name = "Fulvio";
    
-- 4.Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
-- sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome.
	SELECT tb2.id, tb2.name, tb2.surname, tb1.name AS course, tb1.department_id FROM degrees AS tb1 
    INNER JOIN students AS tb2 ON tb1.id = tb2.degree_id ORDER BY tb2.name ASC;

-- 5.Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti.
	SELECT tb2.name, tb2.surname, tb1.name AS teachers_course FROM degrees 
    AS tb1 RIGHT JOIN teachers AS tb2 ON tb1.id = tb2.id ORDER BY tb2.name ASC;

-- 6.Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica.
   SELECT tb2.name, tb2.surname, tb1.name AS teachers_course FROM departments
   AS tb1 RIGHT JOIN teachers AS tb2 ON tb1.id = tb2.id WHERE tb1.name = "Dipartimento di Matematica";

-- 7.Selezionare per ogni studente il numero di tentativi sostenuti
-- per ogni esame, stampando anche il voto massimo. Successivamente,
-- filtrare i tentativi con voto minimo 18.   
   SELECT tb2.name, tb2.surname, COUNT(tb2.id) AS attempts, MAX(tb1.vote) AS max_vote FROM exam_student AS tb1 
   JOIN students AS tb2 ON tb1.student_id = tb2.id GROUP BY tb2.name, tb2.surname HAVING MIN(tb1.vote) < 18;
