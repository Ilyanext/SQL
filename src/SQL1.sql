skypro=# \c  skypro
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
    skypro=# VALUES ('ANNA','BELOVA','WOMEN',24);

    skypro=# INSERT INTO employee(
    skypro(# fist_name, last_name, gender,age)
    skypro-# VALUES ('ANNA','BELOVA','WOMEN',24);
    skypro=# INSERT INTO employee(
    skypro(# fist_name, last_name, gender,age)
    skypro-# VALUES ('ILYA', 'ÍSHUTIN', 'MEN', 26);
    skypro=# SELECT * FROM employee;
    id | fist_name | last_name | gender | age
----+-----------+-----------+--------+-----
    1 | ILYA      | ISHUTIN   | MEN    |  26
    2 | ANNA      | BELOVA    | WOMEN  |  24
    3 | ILYA      | ISHUTIN   | MEN    |  26
    skypro=# UPDATE employee SET fist_name ='Kirill';
    UPDATE 3
    skypro=# SELECT * FROM employee;
    id | fist_name | last_name | gender | age
----+-----------+-----------+--------+-----
    1 | Kirill    | ISHUTIN   | MEN    |  26
    2 | Kirill    | BELOVA    | WOMEN  |  24
    3 | Kirill    | ISHUTIN   | MEN    |  26

    skypro=# UPDATE employee SET fist_name ='ILYA' WHERE id = 1;
    skypro=# SELECT * FROM employee;
    id | fist_name | last_name | gender | age
----+-----------+-----------+--------+-----
    2 | Kirill    | BELOVA    | WOMEN  |  24
    3 | Kirill    | ISHUTIN   | MEN    |  26
    1 | ILYA      | ISHUTIN   | MEN    |  26
    skypro=# UPDATE employee SET fist_name ='ANNA' WHERE id = 2;
    id | fist_name | last_name | gender | age
----+-----------+-----------+--------+-----
    3 | Kirill    | ISHUTIN   | MEN    |  26
    1 | ILYA      | ISHUTIN   | MEN    |  26
    2 | ANNA      | BELOVA    | WOMEN  |  24

    skypro=# DELETE FROM employee
    skypro-# WHERE id=3;
    skypro=# SELECT * FROM employee;
    id | fist_name | last_name | gender | age
----+-----------+-----------+--------+-----
    1 | ILYA      | ISHUTIN   | MEN    |  26
    2 | ANNA      | BELOVA    | WOMEN  |  24