/*1. Для каждого вопроса вывести процент успешных решений, то есть отношение
 количества верных ответов к общему количеству ответов, значение округлить до 2-х 
 знаков после запятой. Также вывести название предмета, к которому относится вопрос, 
 и общее количество ответов на этот вопрос. В результат включить название дисциплины,
 вопросы по ней (столбец назвать Вопрос), а также два вычисляемых столбца 
 Всего_ответов и Успешность. 
 Информацию отсортировать сначала по названию дисциплины, потом по убыванию успешности,
 а потом по тексту вопрос  в алфавитном порядке. Поскольку тексты вопросов могут быть
 длинными, обрезать их 30 символов и добавить многоточие "...".*/


select name_subject, 
       concat(left(name_question, 30), "...")  Вопрос, 
       obsh Всего_ответов, ifnull(round(prav *100 / obsh,2), 0)  Успешность

FROM(
    SELECT testing.question_id as question_id, COUNT(is_correct) AS obsh
    FROM testing
    INNER JOIN answer USING(answer_id)
    GROUP BY testing.question_id
    ) as temp

    INNER JOIN question USING(question_id)
    INNER JOIN subject  USING(subject_id)
    LEFT JOIN 

        (SELECT testing.question_id as question_id, COUNT(is_correct) AS prav
        FROM testing
        INNER JOIN answer USING(answer_id)
        WHERE is_correct = 1
        GROUP BY testing.question_id) AS temp1 ON temp.question_id = temp1.question_id
        order by  name_subject ASC, Успешность DESC, Вопрос ;          
		
/*COUNT() не считает строки значение, которых Null(эта особенность и позволяет
 исключить неправильные ответы)*/
 
 /*2. Вывести студентов, которые сдавали дисциплину «Основы баз данных», указать дату попытки и результат.
 Информацию вывести по убыванию результатов тестирования.*/
 
 select student.name_student, attempt.date_attempt, attempt.result
from student
   join attempt 
   on student.student_id = attempt.student_id
             join subject
             on subject.subject_id = attempt.subject_id
where subject.name_subject = 'Основы баз данных'
order by attempt.result desc

/*3. Вывести, сколько попыток сделали студенты по каждой дисциплине, а также средний 
результат попыток, который округлить до 2 знаков после запятой. 
Под результатом попытки понимается процент правильных ответов  на вопросы теста, 
который занесен в столбец result.  В результат включить название дисциплины,
 а также вычисляемые столбцы Количество и Среднее. Информацию вывести по убыванию 
 средних результатов.*/
 
 select name_subject, count(attempt_id)  Количество, round(avg(result), 2)  Среднее
from subject
       left join attempt 
       on subject.subject_id = attempt.subject_id
GROUP BY name_subject
ORDER BY Среднее DESC

/*4. Вывести студентов (различных студентов), имеющих максимальные результаты попыток.
 Информацию отсортировать в алфавитном порядке по фамилии студента.

Максимальный результат не обязательно будет 100%, поэтому явно это значение
 в запросе не задавать.*/

select distinct student.name_student,  attempt.result
from student
join attempt 
on student.student_id = attempt.student_id
where attempt.result = (select max(attempt.result) 
                       from attempt )
order by student.name_student

/*5. Если студент совершал несколько попыток по одной и той же дисциплине, 
то вывести разницу в днях между первой и последней попыткой.
 В результат включить фамилию и имя студента, название дисциплины и вычисляемый 
 столбец Интервал. Информацию вывести по возрастанию разницы. 
 Студентов, сделавших одну попытку по дисциплине, не учитывать. */
 
 
 select student.name_student, subject.name_subject, datediff(max(attempt.date_attempt), min(attempt.date_attempt))
       Интервал
from attempt
    join student
    on attempt.student_id = student.student_id
             join subject
             on subject.subject_id = attempt.subject_id
group by   student.name_student, subject.name_subject 
having Интервал > 0
order by Интервал

/*6. Студенты могут тестироваться по одной или нескольким дисциплинам 
(не обязательно по всем). Вывести дисциплину и количество уникальных студентов
 (столбец назвать Количество), которые по ней проходили тестирование . 
 Информацию отсортировать сначала по убыванию количества,
а потом по названию дисциплины. В результат включить и дисциплины, тестирование по 
которым студенты не проходили, в этом случае указать количество студентов 0.*/
 
 select   subject.name_subject, count(distinct(attempt.student_id)) Количество
 from subject
 left join attempt
 on subject.subject_id = attempt.subject_id
 
 group by subject.name_subject
 order by Количество desc, subject.name_subject 
 
 /*7. Случайным образом отберите 3 вопроса по дисциплине «Основы баз данных». 
 В результат включите столбцы question_id и name_question.*/
 
 select question_id, name_question
 from question
 join  subject
 using (subject_id)
 where name_subject = 'Основы баз данных'
 order by rand()
 limit 3
 
 /*8.Вывести вопросы, которые были включены в тест для Семенова Ивана по дисциплине 
 «Основы SQL» 2020-05-17 (значение attempt_id для этой попытки равно 7). Указать, 
 какой ответ дал студент и правильный он или нет(вывести Верно или Неверно). 
 В результат включить вопрос, ответ и вычисляемый столбец  Результат.*/
 
 SELECT name_question,  name_answer, 
       IF(is_correct = 0, "Неверно", "Верно") AS Результат
FROM question
     JOIN testing USING(question_id)
     JOIN answer USING(answer_id )
WHERE attempt_id = 7;

/*9. Посчитать результаты тестирования. Результат попытки вычислить как количество
 правильных ответов, деленное на 3 (количество вопросов в каждой попытке) и умноженное
 на 100. Результат округлить до двух знаков после запятой. Вывести фамилию студента, 
 название предмета, дату и результат.Последний столбец назвать Результат.
 Информацию отсортировать сначала по фамилии студента, потом по убыванию даты попытки.
 */

select name_student, name_subject, date_attempt,  round((sum(answer.is_correct)/ 3) * 100 ,2)  Результат
from attempt
    join student using(student_id)
         join subject using(subject_id)
              join testing using(attempt_id)
                    join answer using(answer_id)
group by  name_student, name_subject, date_attempt                 
order by  name_student, date_attempt desc    