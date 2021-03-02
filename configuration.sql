create user user_1 with login password '12344556';
create user user_2 with login password '12344556';
create table example();
grant all privileges on table example to user_1;
grant select,insert,update on table example to user_2;