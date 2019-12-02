create database lab6;
create table employees(
     emp_id serial primary key,
     first_name varchar(20),
     last_name varchar(40),
     salary int not null,
     begin_date date,
     end_date date,
     job_title varchar(50) default ''
);

create table department(
     department_id serial not null primary key,
     emp_id serial references employees(emp_id),
     department_name varchar(5),
     email varchar(40) unique,
     phone_number varchar (12),
     hire_date timestamp with time zone,
     commission float
);

Insert into employees (last_name, salary) values ('Agdh', 100000),
                                                 ('Rfgh', 100000),
                                                 ('Fleming', 100000),
                                                 ('Cdfh', 100000),
                                                 ('Kdfg', 100000),
                                                 ('Fleminf', 100000),
                                                 ('Flemini', 1000000);
--2
alter table employees add check ( end_date >= begin_date and begin_date >= '2000-01-01');
--3
alter table employees add constraint chk_salary check ( salary > 65000 );
--4
alter table employees add unique (last_name);
--5
alter table employees drop constraint chk_salary;
--6
alter table department add constraint foreign_key_con foreign key (emp_id) references employees(emp_id);
SELECT * FROM information_schema.TABLE_CONSTRAINTS
WHERE information_schema.TABLE_CONSTRAINTS.CONSTRAINT_TYPE = 'FOREIGN KEY'
AND information_schema.TABLE_CONSTRAINTS.TABLE_SCHEMA = 'public'
AND information_schema.TABLE_CONSTRAINTS.TABLE_NAME = 'department';
--7
alter table department add check ( department_name = 'FIT' or department_name = 'BS' or department_name = 'FEOG' or department_name = 'FGGE');
--8
alter table employees drop emp_id cascade;
--9
select first_name, last_name from employees where last_name > 'Fleming';
--10
alter table department add constraint UC_dep unique (email);
alter table department drop constraint UC_dep;

select first_name, last_name from employees;
Insert into employees (last_name, salary) values ('Jgjf', 456);
insert into department (department_name) values ('BS');
drop table employees cascade;
drop database lab6;
