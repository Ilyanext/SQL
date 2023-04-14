CREATE TABLE employee (id BIGSERIAL NOT NULL PRIMARY KEY,
                       first_name VARCHAR(50) NOT NULL,
                       last_name VARCHAR(50) NOT NULL,
                       age INT NOT NULL
);
CREATE TABLE city (city_id BIGSERIAL NOT NULL PRIMARY KEY,
                       city_name VARCHAR(50) NOT NULL
);

INSERT INTO employeer (first_name,last_name, age) VALUES ('Ilya', 'Mishutin', 26, 1),
                                               ('Vlad', 'Mish',36,2),
                                               ('Kirill','hutin', 46,3),
                                               ('Olga', 'Mishut',16,1),
                                               ('Olga','Mis', 33,2);
INSERT INTO city (city_id, city_name) VALUES (1,'Krasnodar'),
                                               (2,'Novosib'),
                                               (3,'Surgut');

ALTER TABLE employee
    ADD city_id VARCHAR(50);
ADD FOREIGN KEY (city_id) REFERENCES city (city_id);

CREATE TABLE employee_city (
    employee_id INT NOT NULL,
    city_id INT NOT NULL,
    PRIMARY KEY ( employee_id, city_id),
    FOREIGN KEY (employee_id) REFERENCES employee (id),
    FOREIGN KEY (city_id) REFERENCES city (city_id)
    );
INSERT INTO employee_city (employee_id, city_id) VALUES
    (1, 1),
    (2,3),
    (3,3),
    (4,2),
    (5,3);
-- Получите имена и фамилии сотрудников, а также города, в которых они проживают.
SELECT employee.first_name, employee.last_name, city_name
FROM employee
JOIN employee_city ON employee.id = employee_city.employee_id
JOIN city ON employee_city.city_id = city.city_id;

-- Получите города, а также имена и фамилии сотрудников, которые в них проживают.
-- Если в городе никто из сотрудников не живет, то вместо имени должен стоять null.
INSERT INTO city (city_id, city_name)
VALUES (4, 'Moskva');

SELECT employee.first_name, city.city_name
FROM employee
LEFT JOIN city ON employee.id=city.city_id;

-- Получите имена всех сотрудников и названия всех городов.
--     Если в городе не живет никто из сотрудников, то вместо имени должен стоять null.
--     Аналогично, если города для какого-то из сотрудников нет в списке, должен быть получен null.

SELECT * FROM employee
    FULL OUTER JOIN city
ON employee.id = city.city_id;
-- Получите таблицу, в которой каждому имени должен соответствовать каждый город.
SELECT * FROM employee
    CROSS JOIN city;

-- Получите имена городов, в которых никто не живет.
SELECT city.city_name, employee.first_name
    FROM employee
    LEFT JOIN city ON employee.id=city.city_id
    WHERE employee.first_name IS NULL;