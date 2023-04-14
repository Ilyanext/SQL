skypro=# CREATE  TABLE employee (
    skypro(# id BIGSERIAL NOT NULL PRIMARY KEY,
        skypro(# fist_name VARCHAR(50) NOT NULL,
        skypro(# last_name VARCHAR(50) NOT NULL,
        skypro(# gender VARCHAR(6) NOT NULL,
        skypro(# age INT NOT NULL
        skypro(# );
CREATE TABLE
    skypro=# INSERT INTO employee(
    skypro(# fist_name, last_name, gender,age)
    skypro-# VALUES ('ILYA', 'ÍSHUTIN', 'MEN', 26);
    INSERT 0 1
    skypro=# INSERT INTO employee(
    skypro(# fist_name, last_name, gender,age)
    skypro-# VALUES ('ANNA','BELOVA','WOMEN',24);
    INSERT 0 1
    skypro=# INSERT INTO employee(
     skypro(# fist_name, last_name, gender,age)
    skypro-# VALUES ('Kirill','Kusov','MEN',21);
    INSERT 0 1
    skypro=# INSERT INTO employee(
     skypro(# fist_name, last_name, gender,age)
    skypro-# VALUES ('VLad','Tisov','MEN',27);
    INSERT 0 1
    skypro=# INSERT INTO employee(
     skypro(# fist_name, last_name, gender,age)
    skypro-# VALUES ('Rasim','Knyzev','MEN',25);
    INSERT 0 1

    skypro=# SELECT fist_name AS Имя,
    skypro-# last_name AS Фамилия
    skypro-# FROM employee
    skypro-# GROUP BY Имя;
    skypro=# SELECT * FROM employee;

    skypro=# SELECT fist_name, last_name, gender, age
    skypro-# FROM employee
    skypro-# WHERE age<30 OR age>50;

    skypro=# SELECT fist_name, last_name, gender, age
    skypro-# FROM employee
    skypro-# WHERE age>30 AND age<50;

    skypro=# SELECT fist_name, last_name, gender, age
    skypro-# FROM employee
    skypro-# ORDER BY fist_name DESC;

    skypro=# SELECT fist_name, last_name, gender, age
    skypro-# FROM employee
    skypro-# ORDER BY last_name DESC;

    skypro=# SELECT * FROM employee
    skypro-# WHERE fist_name LIKE '%____%';


    skypro=# UPDATE employee SET fist_name ='ILYA'
    skypro-# WHERE id=3;
    skypro=# UPDATE employee SET fist_name = 'Vlad'
    skypro-# WHERE id=4;

    skypro=# SELECT fist_name,
    skypro-# COUNT(age)
    skypro-# FROM employee
    skypro-# GROUP BY fist_name;

    skypro=# SELECT fist_name, age FROM employee
    skypro-# WHERE age=(
    skypro(# SELECT MIN(age)
    skypro(# FROM employee
    skypro(# );

    skypro=# SELECT fist_name, MAX(age) FROM employee
    skypro-# GROUP BY fist_name HAVING COUNT(*)>1
    skypro-# ORDER BY MAX(age);







