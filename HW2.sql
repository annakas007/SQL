create table employees(
id serial primary key,
employees_name varchar(50) not null);

insert into employees(employees_name)
values
('Reggie Batey'), 
('Clara Poore'), 
('Tammy Galindo'), 
('Rickey Jones'), 
('Jill Anspach'), 
('Lacy Racicot'), 
('David Macias'), 
('Jessica Manns'), 
('Amber Holcomb'), 
('Betty Wells'), 
('Miguel Fletcher'), 
('Joseph Hodges'), 
('Ida Bohannon'), 
('Cindy Merrifield'), 
('Mary Dowell'), 
('Marie Thomas'), 
('Donald Fierro'), 
('Anna Wick'), 
('Robert Harian'), 
('Michael Mark'), 
('Lucius Patterson'), 
('Lorna Rose'), 
('Karen Santiago'), 
('Peggy Beachler'), 
('Chester Baird'), 
('Ronda Colley'), 
('Robert Chapman'), 
('Sandra Hibbard'), 
('Steven Pagano'), 
('Ramona Russell'), 
('Ryan Morgan'), 
('Shannon Daugherty'), 
('Charlene Little'), 
('Steve Lewandowski'), 
('Donnie Shoemaker'), 
('Veronica Treto'), 
('Jonathon Belanger'), 
('William Hughes'), 
('Courtney Alston'), 
('Isaac Walters'), 
('Leon Ashcraft'), 
('Daniel Patterson'), 
('Randall Phillips'), 
('James Williams'), 
('Nancy Searles'), 
('Edward Hilliard'), 
('Joel Vandevelde'), 
('Nancy Bravo'), 
('Jesse Clark'), 
('Gregory Magelssen'), 
('Ella Cortez'), 
('Michael Diaz'), 
('Robert Walsh'), 
('Valorie Seibert'), 
('Yoshiko Miller'), 
('Timothy Johnson'), 
('Lita Webb'), 
('Lindsay Barrera'), 
('Jacqulyn Matthews'), 
('Lee Rehart'), 
('Fred Spencer'), 
('Melinda Webster'), 
('Shawn Pretti'), 
('Betty Schaefer'), 
('Barbara Teets'), 
('Patricia Tomas'), 
('Mattie Kelley'), 
('Mary Yates'), 
('Andrea Croes'), 
('Amanda Riley');

create table salary(
id serial primary key,
monthly_salary int not null);

insert into salary(monthly_salary)
values 
(1000),
(1100),
(1200),
(1300),
(1400),
(1500),
(1600),
(1700),
(1800),
(1900),
(2000),
(2100),
(2200),
(2300),
(2400),
(2500);
delete  from salary
where id >15; 
select * from salary;
select * from employees;

create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null);

insert into employee_salary (employee_id, salary_id)
values 
(3, 7),
(1, 4),
(5, 9),
(40,13),
(23, 4),
(11, 2),
(52, 10),
(15,13),
(26, 4),
(16, 1),
(33, 7),
(2, 15),
(4, 14),
(6, 13),
(7, 12),
(8, 11),
(9, 10),
(10, 9),
(12, 8),
(13, 7),
(14, 6),
(17, 5),
(18, 4),
(19, 3),
(20, 2),
(21, 1),
(22, 2),
(24, 3),
(25, 4),
(27, 5),
(28, 6),
(71, 1),
(72, 2),
(73, 3),
(74, 4),
(75, 5),
(76, 6),
(77, 7),
(78, 8),
(79, 9);

select * from employee_salary;

create table roles(
id serial  primary key,
role_name int not null unique);


alter table roles 
alter column role_name type varchar(30);



insert into roles(role_name)
values
('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

select * from roles;

create table roles_employee(
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (role_id) references roles (id));

insert into roles_employee (employee_id, role_id)
values
(7, 2),
(20, 4),
(3, 9),
(5, 13),
(23, 4),
(11, 2),
(10, 9),
(22, 13),
(21, 3),
(34, 4),
(6, 7),
(1, 20),
(2, 19),
(4, 18),
(40, 17),
(8, 16),
(9, 15),
(12, 14),
(13, 13),
(14, 12),
(15, 11),
(16, 10),
(17, 9),
(18, 8),
(19, 7),
(41, 6),
(24, 5),
(25, 4),
(26, 3),
(27, 2),
(28, 1),
(29, 20),
(30, 19),
(31, 18),
(32, 17),
(33, 16),
(35, 15),
(36, 14),
(37, 13),
(38, 12),
(39, 11);

select * from roles_employee;
