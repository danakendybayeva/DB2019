create database lab7;
create table locations(
    location_id     serial primary key,
    street_address  varchar(25),
    postal_code     varchar(12),
    city            varchar(30),
    state_province  varchar(12)
);
create table departments(
    department_id   serial primary key,
    department_name varchar(50) unique,
    budget          int,
    location_id     int references locations
);
create table employees(
    employee_id     int primary key,
    first_name      varchar(50),
    last_name       varchar(50),
    email           varchar(50),
    phone_number    varchar(20),
    salary          int,
    department_id   int references departments,
    manager_id      int
);
create table manager(
    manager_id int primary key,
    manager_name varchar(50)
);
create table job_grades(
    grade           char(1),
    lowest_salary   int,
    highest_salary  int
);
insert into locations (city, state_province) values ('ala', 'hjhk'),
                                                    ('ast', 'hkhk'),
                                                    ('shym', 'hjhk'),
                                                    ('karg', 'hkhk'),
                                                 ('nyc', 'hkh'),
                                                    ('london', 'rqeq');
insert into departments (department_name, location_id) values ('small', 4),
                                                              ('mega', 5),
                                                              ('silkway', 4),
                                                              ('globus', 1),
                                                              ('walmart', 6),
                                                              ('ikea', 6);
insert into employees (employee_id, first_name, last_name, manager_id, salary) values  (1, 'Smith', 'qqqq', null, 1350),
                                                                                         (2, 'John', 'bjj', 1, 1200),
                                                                                         (3, 'Sam', 'aab', 2, 900),
                                                                                         (4, 'Jen', 'aabaa', 2, 1050),
                                                                                         (5, 'Adam', 'aaa', 1, 1400);
insert into manager(manager_id, manager_name) values (1, 'Smith'),
                                         (2, 'John'),
                                         (3, 'Adam');
insert into job_grades values   ('a', 800, 1300),
                                ('b', 1301, 1500),
                                ('c', 1501, 2100);
select e.first_name, m.manager_name from employees e left join manager m on e.manager_id = m.manager_id;
--3
select e.first_name, e.last_name, e.department_id, l.city, l.state_province from departments d
    inner join locations l on d.location_id = l.location_id
    inner join employees e on d.department_id = e.department_id
    where last_name like '%b%';
--4
select d.department_name, l.city, l.state_province from locations l inner join departments d on l.location_id = d.location_id;
--5
select e.first_name, m.manager_name from employees e left join manager m on e.manager_id = m.manager_id;
--6
SELECT j.grade,
       count(*),
       avg(salary)
FROM employees e
    join job_grades j on e.salary
        BETWEEN j.lowest_salary AND j.highest_salary
group by j.grade;
--7
select e.first_name, e.last_name, l.city from departments d
    join locations l on d.location_id = l.location_id
    join employees e on d.department_id = e.department_id
    where l.city = 'london';


drop table employees;
select * from employees;