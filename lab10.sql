create database lab10;
create table accounts (
    id int primary key,
    name varchar(20) not null,
    age int,
    balance int not null
);
insert into accounts values
                            (1 , 'Anna' , 35 , 32000),
                            (2 , 'Nurlam' , 25 , 45000),
                            (3 , 'Adam' , 21 , 35000),
                            (4 , 'Mishel' ,19 , 65000),
                            (5 , 'Dana' , 27 , 75000),
                            (6 , 'Kirill' , 22 , 95000),
                            (7 , 'Janibek' , 24 , 37000);
--2
BEGIN;
UPDATE accounts SET balance = balance + 1000
    WHERE id=1;
UPDATE accounts SET balance = balance + 2000
    WHERE id=2;
UPDATE accounts SET balance = balance + 3000
    WHERE id=3;
COMMIT;
--3
BEGIN;
UPDATE accounts SET balance = balance - 1500
    WHERE name = 'Kirill';
SAVEPOINT my_savepoint;
UPDATE accounts SET balance = balance + 1500
    WHERE name = 'Adam';
ROLLBACK TO my_savepoint;
UPDATE accounts SET balance = balance + 1500
    WHERE name = 'Anna';
COMMIT;