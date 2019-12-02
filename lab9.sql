create database lab9;
create table salesman(
    salesman_id int primary key,
    name varchar(40),
    city varchar(40),
    commission real
);
create table customers(
    customer_id int primary key,
    cust_name varchar(40),
    city varchar(30),
    grade int,
    salesman_id int references salesman
);
create table orders(
    ord_no int primary key,
    purch_amt real,
    ord_date date,
    customer_id int references customers,
    salesman_id int references salesman
);
--3
create role junior_dev password 'iamjunior';
--4
create view avg_tot_ord as
    select s.name, avg(o.purch_amt), sum(o.purch_amt)
    from salesman s join orders o on s.salesman_id = o.salesman_id
    group by s.name;
--5
create view show_ord_amount as
    select c.city, count(o.ord_no)
    from customers c join orders o on c.customer_id = o.customer_id
    group by c.city;
grant all privileges on show_ord_amount to junior_dev;
--6
create view cust_low_grade as
    select *
    from customers
    ORDER BY grade
    LIMIT 1
    OFFSET 0;
GRANT SELECT on cust_low_grade TO junior_dev;
--7
create view num_sal_grade as
    select c.grade, count(s.salesman_id)
    from salesman s join customers c on s.salesman_id = c.salesman_id
    group by grade;
--8
create view sal_ord as
select s.name, count(o.ord_no)
from salesman s join orders o on s.salesman_id = o.salesman_id
group by s.name
having count(o.ord_no) > 1;
--9
CREATE ROLE intern;
REASSIGN OWNED BY junior_dev TO intern;