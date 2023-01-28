/*1. Вывести абитуриентов, которые хотят поступать на образовательную программу «Мехатроника и робототехника» в отсортированном 
по фамилиям виде.*/

select name_enrollee
from enrollee
   join program_enrollee
   using(enrollee_id)
        join program
        using(program_id)
where name_program = 'Мехатроника и робототехника'
order by name_enrollee

/*2. Вывести образовательные программы, на которые для поступления необходим предмет 
«Информатика». Программы отсортировать в обратном алфавитном порядке.*/

select name_program
from program
    join program_subject
    using(program_id)
        join subject
        using(subject_id)
where name_subject  = 'Информатика'
order by name_program desc

/*3. Выведите количество абитуриентов, сдавших ЕГЭ по каждому предмету,
 максимальное, минимальное и среднее значение баллов по предмету ЕГЭ. 
 Вычисляемые столбцы назвать Количество, Максимум, Минимум, Среднее.
 Информацию отсортировать по названию предмета в алфавитном порядке,
 среднее значение округлить до одного знака после запятой.*/

select name_subject, count(subject_id) Количество, max(result) Максимум, 
       min(result) Минимум , round(avg(result), 1) Среднее 
from subject
      join enrollee_subject
      using(subject_id)
group by name_subject
order by name_subject

/*4. Вывести образовательные программы, для которых минимальный балл ЕГЭ 
по каждому предмету больше или равен 40 баллам. 
Программы вывести в отсортированном по алфавиту виде.*/

select  name_program  
from program
    join program_subject
    using(program_id)  
group by name_program  
having min(min_result) > 39  
order by name_program

/*5.Вывести образовательные программы, которые имеют самый большой план набора,  
вместе с этой величиной.*/

select name_program, plan
from program
where plan = (select max(plan)
              from program)

/*6.Посчитать, сколько дополнительных баллов получит каждый абитуриент. 
Столбец с дополнительными баллами назвать Бонус.  
Информацию вывести в отсортированном по фамилиям виде.*/

select name_enrollee, IFNULL(SUM(bonus), 0) Бонус 
from enrollee
      left join enrollee_achievement
     using(enrollee_id)
           left join achievement
           using(achievement_id)
group by name_enrollee
order by name_enrollee

/*7. Выведите сколько человек подало заявление на каждую образовательную программу и
 конкурс на нее(число поданных заявлений деленное на количество мест по плану),
 округленный до 2-х знаков после запятой. 
В запросе вывести название факультета, к которому относится образовательная программа, 
название образовательной программы, план набора абитуриентов на образовательную 
программу (plan), количество поданных заявлений (Количество) и Конкурс. 
Информацию отсортировать в порядке убывания конкурса.*/

select name_department,name_program, plan,count(enrollee_id) Количество, 
       round(count(enrollee_id)/plan,2)Конкурс  
from program_enrollee
   join program
   using(program_id)
        join department
        using(department_id)
group by program_id  
order by Конкурс desc

/*8. Вывести образовательные программы, на которые для поступления необходимы предмет 
«Информатика» и «Математика» в отсортированном по названию программ виде.*/

select name_program
from program
      join program_subject
      using(program_id)
            join subject
            using(subject_id)
where name_subject in ('Информатика', 'Математика') 
group by name_program
having count(name_program) = 2
order by name_program 

/*9. Посчитать количество баллов каждого абитуриента на каждую образовательную программу, 
на которую он подал заявление, по результатам ЕГЭ. В результат включить название
образовательной программы, фамилию и имя абитуриента, а также столбец с 
суммой баллов, который назвать itog.
 Информацию вывести в отсортированном сначала по образовательной программе, 
а потом по убыванию суммы баллов виде.*/

select name_program,name_enrollee,sum(result) itog
from enrollee
       join program_enrollee 
       using (enrollee_id)
             join program
             using (program_id)
             join program_subject 
             using (program_id)
             join enrollee_subject 
             using (subject_id,enrollee_id)
group by name_program,name_enrollee
order by name_program,itog desc
