CREATE TABLE employee (id BIGSERIAL NOT NULL PRIMARY KEY,
                       first_name VARCHAR(50),
                       last_name VARCHAR(50)
);
CREATE TABLE city (city_id BIGSERIAL NOT NULL PRIMARY KEY,
                       city_name VARCHAR(50)
);
ALTER TABLE employee
    ADD city_id INT,
ADD FOREIGN KEY (city_id) REFERENCES city (city_id);

INSERT INTO employee (first_name,last_name, city_id) VALUES ('Ilya', 'Mishutin', 1),
                                               ('Vlad', 'Mish',2),
                                               ('Kirill','hutin',3),
                                               ('Olga', 'Mishut',1),
                                               ('Olga','Mis',2);
INSERT INTO city (city_id, city_name) VALUES (1,'Krasnodar'),
                                               (2,'Novosib'),
                                               (3,'Surgut');


-- Получите имена и фамилии сотрудников, а также города, в которых они проживают.
SELECT employee.first_name, employee.last_name, city_name
    FROM employee
    JOIN city ON employee.city_id = city.city_id;

-- Получите города, а также имена и фамилии сотрудников, которые в них проживают.
-- Если в городе никто из сотрудников не живет, то вместо имени должен стоять null.
INSERT INTO city (city_id, city_name)
VALUES (4, 'Moskva');

SELECT  city_name, employee.first_name, employee.last_name
FROM employee
RIGHT JOIN city ON employee.city_id=city.city_id;

-- Получите имена всех сотрудников и названия всех городов.
--     Если в городе не живет никто из сотрудников, то вместо имени должен стоять null.
--     Аналогично, если города для какого-то из сотрудников нет в списке, должен быть получен null.

SELECT * FROM employee
    FULL OUTER JOIN city
ON employee.city_id = city.city_id;

-- Получите таблицу, в которой каждому имени должен соответствовать каждый город.
SELECT * FROM employee
    CROSS JOIN city;

-- Получите имена городов, в которых никто не живет
SELECT city_name, employee.first_name
    FROM employee
     JOIN city ON employee.city_id=city.city_id
    WHERE employee.first_name IS NULL;