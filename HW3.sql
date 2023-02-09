select * from roles_employee;
select * from roles;
select * from employee_salary;
select * from employees;
select * from salary;

/* 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.*/
select employees_name, monthly_salary from employee_salary es
     join employees e 
     on es.employee_id  = e.id 
         join salary s 
         on s.id  = es.salary_id ;
         
 /*2. Вывести всех работников у которых ЗП меньше 2000.*/    
select employees_name from employee_salary es
     join employees e 
     on es.employee_id  = e.id 
         join salary s 
         on s.id  = es.salary_id 
where monthly_salary < 2000;     

/* 3. Вывести все зарплатные позиции, но работник по ним не назначен.
 *  (ЗП есть, но не понятно кто её получает.)*/

select id, salary_id  
from employee_salary es 
where employee_id not in (select id from employees e);

/* 4. Вывести все зарплатные позиции  меньше 1500 но работник по ним не назначен.
 *  (ЗП есть, но не понятно кто её получает.)*/


select t1.id, s.monthly_salary from
 (select id, salary_id  
 from employee_salary es 
 where employee_id not in (select id from employees e)) t1
        join salary s 
        on s.id = t1.salary_id 
where  s.monthly_salary < 1500;      
       

/* 5. Найти всех работников кому не начислена ЗП.*/

select employees_name from employees e
where employees_name not in 
(select employees_name from employees e 
       join employee_salary es 
       on es.employee_id = e.id) ;
      
/* 6. Вывести всех работников с названиями их должности.*/      
      
  select e.employees_name, r.role_name  from employees e 
        join roles_employee re 
        on re.employee_id  = e.id 
           join roles r 
           on r.id  = re.role_id ;
       
 /*7. Вывести имена и должность только Java разработчиков.*/  
 
  select e.employees_name, r.role_name  from employees e 
        join roles_employee re 
        on re.employee_id  = e.id 
           join roles r 
           on r.id  = re.role_id
 where   r.role_name like '%Java %';  
 
/*8. Вывести имена и должность только Python разработчиков.*/
select e.employees_name, r.role_name  from employees e 
        join roles_employee re 
        on re.employee_id  = e.id 
           join roles r 
           on r.id  = re.role_id
 where   r.role_name like '%Python%';

/* 9. Вывести имена и должность всех QA инженеров.*/

select e.employees_name, r.role_name  from employees e 
        join roles_employee re 
        on re.employee_id  = e.id 
           join roles r 
           on r.id  = re.role_id
 where   r.role_name like '%QA%';

/*10. Вывести имена и должность ручных QA инженеров.*/

select e.employees_name, r.role_name  from employees e 
        join roles_employee re 
        on re.employee_id  = e.id 
           join roles r 
           on r.id  = re.role_id
 where   r.role_name like '%Manual%';

/*11. Вывести имена и должность автоматизаторов QA*/
select e.employees_name, r.role_name  from employees e 
        join roles_employee re 
        on re.employee_id  = e.id 
           join roles r 
           on r.id  = re.role_id
 where r.role_name like '%Automation%';

/*12. Вывести имена и зарплаты Junior специалистов*/

select e.employees_name, s.monthly_salary from employee_salary es 
       join employees e 
       on e.id = es.employee_id
          join salary s 
          on s.id = es.salary_id
             join roles_employee re  
             on re.employee_id = es.employee_id 
                join roles r 
                on r.id = re.role_id
 where r.role_name like 'Junior%';

/*13. Вывести имена и зарплаты Middle специалистов*/
select e.employees_name, s.monthly_salary from employee_salary es 
       join employees e 
       on e.id = es.employee_id
          join salary s 
          on s.id = es.salary_id
             join roles_employee re  
             on re.employee_id = es.employee_id 
                join roles r 
                on r.id = re.role_id
 where r.role_name like 'Middle%';

/*14. Вывести имена и зарплаты Senior специалистов*/

select e.employees_name, s.monthly_salary from employee_salary es 
       join employees e 
       on e.id = es.employee_id
          join salary s 
          on s.id = es.salary_id
             join roles_employee re  
             on re.employee_id = es.employee_id 
                join roles r 
                on r.id = re.role_id
 where r.role_name like 'Senior%';

/*15. Вывести зарплаты Java разработчиков*/

select e.employees_name, s.monthly_salary from employee_salary es 
       join employees e 
       on e.id = es.employee_id
          join salary s 
          on s.id = es.salary_id
             join roles_employee re  
             on re.employee_id = es.employee_id 
                join roles r 
                on r.id = re.role_id
 where r.role_name like '%Java %';

/* 16. Вывести зарплаты Python разработчиков*/

select e.employees_name, s.monthly_salary from employee_salary es 
       join employees e 
       on e.id = es.employee_id
          join salary s 
          on s.id = es.salary_id
             join roles_employee re  
             on re.employee_id = es.employee_id 
                join roles r 
                on r.id = re.role_id
 where r.role_name like '%Python%';

select s.monthly_salary from employee_salary es 
          join salary s 
          on s.id = es.salary_id
             join roles_employee re  
             on re.employee_id = es.employee_id 
                join roles r 
                on r.id = re.role_id
 where r.role_name like '%Python%';

/*17. Вывести имена и зарплаты Junior Python разработчиков*/

select e.employees_name, s.monthly_salary from employee_salary es 
       join employees e 
       on e.id = es.employee_id
          join salary s 
          on s.id = es.salary_id
             join roles_employee re  
             on re.employee_id = es.employee_id 
                join roles r 
                on r.id = re.role_id
 where r.role_name like '%Python%';

/* 18. Вывести имена и зарплаты Middle JS разработчиков*/

select e.employees_name, s.monthly_salary from employee_salary es 
       join employees e 
       on e.id = es.employee_id
          join salary s 
          on s.id = es.salary_id
             join roles_employee re  
             on re.employee_id = es.employee_id 
                join roles r 
                on r.id = re.role_id
 where r.role_name like '%JavaScript%';

/* 19. Вывести имена и зарплаты Senior Java разработчиков*/
select e.employees_name, s.monthly_salary from employee_salary es 
       join employees e 
       on e.id = es.employee_id
          join salary s 
          on s.id = es.salary_id
             join roles_employee re  
             on re.employee_id = es.employee_id 
                join roles r 
                on r.id = re.role_id
 where r.role_name like '%Senior Java%';

/*20. Вывести зарплаты Junior QA инженеров*/

select s.monthly_salary from employee_salary es 
          join salary s 
          on s.id = es.salary_id
             join roles_employee re  
             on re.employee_id = es.employee_id 
                join roles r 
                on r.id = re.role_id
 where r.role_name like 'Junior % QA %';

/* 21. Вывести среднюю зарплату всех Junior специалистов*/

 select round(avg(monthly_salary))  from salary s 
        join employee_salary es 
        on s.id = es.salary_id 
             join roles_employee re 
             on re.employee_id = es.employee_id 
                join roles r 
                on r.id = re.role_id
where r.role_name like 'Junior %';

/*Вывести сумму зарплат JS разработчиков*/

select sum(monthly_salary)  from salary s 
        join employee_salary es 
        on s.id = es.salary_id 
             join roles_employee re 
             on re.employee_id = es.employee_id 
                join roles r 
                on r.id = re.role_id
where r.role_name like '%JavaScript %';

/*23. Вывести минимальную ЗП QA инженеров*/

select min(monthly_salary)  from salary s 
        join employee_salary es 
        on s.id = es.salary_id 
             join roles_employee re 
             on re.employee_id = es.employee_id 
                join roles r 
                on r.id = re.role_id
where r.role_name like '%QA%';

/*24. Вывести максимальную ЗП QA инженеров*/

select max(monthly_salary)  from salary s 
        join employee_salary es 
        on s.id = es.salary_id 
             join roles_employee re 
             on re.employee_id = es.employee_id 
                join roles r 
                on r.id = re.role_id
where r.role_name like '%QA%';

/* 25. Вывести количество QA инженеров*/

select count(role_name) from roles r 
where role_name like '% QA %';

/*26. Вывести количество Middle специалистов.*/
select count(role_name) from roles r 
where role_name like 'Middle %';

/*27. Вывести количество разработчиков*/

select count(role_name) from roles r 
where role_name like '%developer';

/* 28. Вывести фонд (сумму) зарплаты разработчиков.*/

select sum(s.monthly_salary) from salary s 
       join employee_salary es 
       on s.id = es.salary_id 
          join roles_employee re 
          on re.employee_id  = es.employee_id 
              join roles r 
              on r.id = re.role_id 
where r.role_name like '%developer';

/*29. Вывести имена, должности и ЗП всех специалистов по возрастанию*/
select e.employees_name, r.role_name, s.monthly_salary from employees e 
       join roles_employee re 
       on re.employee_id  = e.id 
              join roles r 
              on r.id = re.role_id 
                  join employee_salary es 
                  on es.employee_id  = re.employee_id 
                        join salary s 
                        on s.id = es.salary_id 
order by s.monthly_salary;   

/*30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых 
 * ЗП от 1700 до 2300*/

select e.employees_name, r.role_name, s.monthly_salary from employees e 
       join roles_employee re 
       on re.employee_id  = e.id 
              join roles r 
              on r.id = re.role_id 
                  join employee_salary es 
                  on es.employee_id  = re.employee_id 
                        join salary s 
                        on s.id = es.salary_id
where s.monthly_salary between 1700 and 2300                       
order by s.monthly_salary; 

/*31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов
*  у которых ЗП меньше 2300*/
                    
select e.employees_name, r.role_name, s.monthly_salary from employees e 
       join roles_employee re 
       on re.employee_id  = e.id 
              join roles r 
              on r.id = re.role_id 
                  join employee_salary es 
                  on es.employee_id  = re.employee_id 
                        join salary s 
                        on s.id = es.salary_id
where s.monthly_salary < 2300                       
order by s.monthly_salary; 

/*32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых 
 * ЗП равна 1100, 1500, 2000*/

select e.employees_name, r.role_name, s.monthly_salary from employees e 
       join roles_employee re 
       on re.employee_id  = e.id 
              join roles r 
              on r.id = re.role_id 
                  join employee_salary es 
                  on es.employee_id  = re.employee_id 
                        join salary s 
                        on s.id = es.salary_id
where s.monthly_salary in (1100, 1500, 2000)                      
order by s.monthly_salary; 

  

                        
                        
       

       








               
      
       

