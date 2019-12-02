create database lab4;

create table Warehouses(
    code int,
    location varchar(255),
    capacity int
);
create table Boxes(
    code char(4),
    contents varchar(255),
    value real,
    warehouse int
);

 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3),
                                                       (2,'Chicago',4),
                                                       (3,'New York',7),
                                                       (4,'Los Angeles',2),
                                                       (5,'San Francisco',8);

 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3),
                                                         ('4H8P','Rocks',250,1),
                                                         ('4RT3','Scissors',190,4),
                                                         ('7G3H','Rocks',200,1),
                                                         ('8JN6','Papers',75,1),
                                                         ('8Y6U','Papers',50,3),
                                                         ('9J6F','Papers',175,2),
                                                         ('LL08','Rocks',140,4),
                                                         ('P0H6','Scissors',125,1),
                                                         ('P2T6','Scissors',150,2),
                                                         ('TU55','Papers',90,5);
-- 4
select * from Warehouses where location = 'Chicago';
-- 5
select * from Boxes where value > 140 and value <= 200;
-- 6
select warehouse, count(distinct contents) from Boxes group by warehouse;
-- 7
select distinct warehouse from boxes where contents = 'Rocks' and value < 220;
-- 8
update Boxes set value = Boxes.value * 1.2 from Warehouses inner join Boxes B on Warehouses.code = B.warehouse
                                                           where Boxes.contents = 'Papers' and
                                                                 Warehouses.code = Boxes.warehouse and
                                                                 (Warehouses.location = 'San Francisco' or
                                                                  Warehouses.location = 'New York');
-- 9
update Boxes set value = value / 2 where contents = 'Scissors' and cast(value as int) % 2 = 0;
update Boxes set value = value / 5 from Warehouses where location = 'Chicago' and contents = 'Papers' and cast(value as int) % 2 != 0;
-- 10
select b.code from Boxes as b inner join Warehouses as w on b.warehouse = w.code where location like '%o' and capacity > 3;
-- 11

-- 12
SELECT DISTINCT Boxes.code, Boxes.contents, Boxes.value FROM Boxes, Warehouses
WHERE Boxes.warehouse = Warehouses.code and Warehouses.location != 'Chicago'
ORDER BY Boxes.value DESC
OFFSET 1
LIMIT 1;
-- 13
SELECT DISTINCT code, contents, value FROM Boxes
WHERE cast(value as int) % 3 = 0
ORDER BY value
OFFSET 2
LIMIT 1;

select * from Boxes;