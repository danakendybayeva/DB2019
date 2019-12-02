CREATE database lab1;

create table users(
    id int not null,
    firstname varchar(50),
    lastname varchar(50)
);

alter table users
    add isadmin int;

ALTER TABLE users ALTER COLUMN isadmin DROP DEFAULT;
ALTER TABLE users ALTER isadmin TYPE bool USING isadmin::boolean;

alter table users
alter column isadmin set default false;

alter table users
add constraint pk_user primary key (id);

create table tasks(
    id int,
    name varchar(50),
    user_id int
);
Select * from users;