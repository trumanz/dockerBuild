
create database testdb;

\c testdb;

CREATE TABLE  mytable ( id integer   PRIMARY KEY, name  char(40) NOT NULL);

INSERT INTO mytable (id, name) VALUES ('1', 'peter'),('2','jackson');

SELECT * FROM mytable;


env  PGPASSWORD=postgres  pg_dump   -h 127.0.0.1  -U postgres  testdb  >  ./test.db;



testdb=# drop table mytable;
root@postgresql:/# env  PGPASSWORD=postgres psql   -h 127.0.0.1  -U postgres testdb  < test.db

root@postgresql:/# env  PGPASSWORD=postgres  pg_dump   -h 127.0.0.1  -U postgres  testdb --table="mytable"      >  ./mytable.sql

