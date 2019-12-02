create database lab3;
create table countries
(
    country_id   serial primary key,
    country_name varchar(50),
    region_id    int,
    population   int
);
insert into countries (country_name, region_id, population) values ('Wonderland', 3, 5000);
insert into countries (country_name) values ('Korea');
insert into countries (region_id) values (null);
insert into countries (country_name, region_id, population) values ('USA', 34, 67000), ('France', 56, 57000), ('Malaysia', 23, 43900);
alter table countries alter country_name set default 'Kazakhstan';
insert into countries (region_id, population) values (45, 170000);
alter table countries alter region_id set default 66, alter population set default 358890;
insert into countries (country_name, region_id, population) values(default, default, default);

select * into countries_new from countries;
update countries_new set region_id = 1 where region_id is null;
update countries_new set population = population * 1.1;
select country_id, country_name, region_id, population as new_population from countries_new;
delete from countries_new where population < 100000;
insert into countries (country_name, region_id, population) values ('Greece', 54, 4555);
insert into countries_new (country_name, region_id, population) select country_name, region_id, population from countries order by population limit 2;
--delete from countries_new where EXISTS(SELECT * FROM countries WHERE countries.country_id = countries_new.country_id);
delete from countries_new;
select * from countries_new;
select * from countries;