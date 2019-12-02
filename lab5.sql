create database lab5;

create table customers(
    customer_id int,
    cust_name varchar(100),
    city varchar(100),
    grade int,
    salesman_id int
);

create table orders(
    ord_no int,
    purch_amt float,
    ord_date date,
    customer_id int,
    salesman_id int
);

insert into customers values (3002, 'Nick Rimando', 'New York', 100, 5001),
                             (3005, 'Graham Zusi', 'California', 200, 5002),
                             (3001, 'Brad Guzan', 'London', null, 5005),
                             (3004, 'Fabian Johns', 'Paris', 300, 5006),
                             (3007, 'Brad Davis', 'New York', 200, 5001),
                             (3009, 'Geoff Camero', 'Berlin', 100, 5002),
                             (3008, 'Julian Green', 'London', 300, 5002);

insert into orders values (70001, 150.5, '2012-10-05', 3005, 5002),
                          (70009, 270.65, '2012-09-10', 3001, 5005),
                          (70002, 65.26, '2012-10-05', 3002, 5001),
                          (70004, 110.5, '2012-08-17', 3009, 5003),
                          (70007, 948.5, '2012-09-10', 3005, 5002),
                          (70005, 2400.6, '2012-07-27', 3007, 5001),
                          (70008, 5760, '2012-09-10', 3002, 5001);
--3
select sum(purch_amt) from orders;
--4
select avg(purch_amt) from orders;
--5
select count(*) from customers where customer_id in (select customer_id from orders);
--6
select min(purch_amt) from orders;
--7
select * from customers where cust_name like '%n';
--8
select * from orders where customer_id in (select customer_id from customers where city = 'New York');
select orders.ord_no, orders.purch_amt, orders.ord_date, orders.customer_id, orders.salesman_id from orders join customers on orders.customer_id = customers.customer_id
where customers.city = 'New York';
select * from orders, customers;
select * from orders join customers on orders.customer_id = customers.customer_id;
--9
select * from customers where customer_id in (select customer_id from orders where purch_amt > 10);
--10
select sum(grade) from customers;
--11
select * from customers where customer_id in (select customer_id from orders);
--12
select max(grade) from customers;