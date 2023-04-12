CREATE DATABASE skypro;
\c skypro
CREATE TABLE employee (
id BIGSERIAL NOT NULL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
gender VARCHAR(6) NOT NULL,
age INT NOT NULL
);
INSERT INTO employee(
first_name, last_name, gender, age)
VALUES ('Dmitriy', 'Ivanov', 'male', 21),
('Petr', 'Slivov', 'male', 45),
('Anna', 'Kurtova', 'famale', 19);
SELECT * FROM employee;
UPDATE employee SET  first_name = 'Olga', last_name = 'Kirovna', gender = 'famale', age = 23 WHERE id =2;
SELECT * FROM employee;
DELETE FROM employee WHERE id = 3;
SELECT * FROM employee;
INSERT INTO employee(
first_name, last_name, gender, age)
VALUES ('Anna', 'Kurtova', 'famale', 19),
('Vera', 'Oblomova', 'famale', 33),
('Stas', 'Petrenko', 'male', 56);
SELECT first_name AS "Имя", last_name AS "Фамилия" FROM employee;
SELECT * FROM employee WHERE "age" > 50 OR "age" < 30;
SELECT * FROM employee WHERE "age" BETWEEN 30 AND 50;
SELECT * FROM employee ORDER BY "last_name" DESC;
SELECT * FROM employee WHERE "first_name" LIKE '_____%';
UPDATE employee SET  first_name = 'Anna' WHERE id = 2;
UPDATE employee SET  first_name = 'Dmitriy' WHERE id = 6;
SELECT first_name, SUM(age) FROM employee GROUP BY first_name;
SELECT first_name, MIN(age) FROM employee GROUP BY first_name;
SELECT first_name, MAX(age) FROM employee GROUP BY first_name HAVING COUNT(age) > 1;
CREATE TABLE city (
city_id BIGSERIAL NOT NULL PRIMARY KEY,
city_name VARCHAR(50) NOT NULL
);
ALTER TABLE employee ADD COLUMN city_id INT REFERENCES city (city_id);
INSERT INTO city(
city_name)
VALUES ('Moscow'),
('Berlin'),
('Tbilisi');
UPDATE employee SET city_id =
CASE
WHEN id = 1 or id = 2 THEN 1
WHEN id = 4 or id = 5 THEN 2
WHEN id = 6 THEN 3
END
WHERE id IN (1,2,4,5,6);
SELECT e.first_name, e.last_name, c.city_name
FROM employee e
INNER JOIN city c ON c.city_id = e.city_id;
SELECT c.city_name, e.first_name, e.last_name
FROM city c
LEFT JOIN employee e ON c.city_id = e.city_id;
SELECT e.first_name, e.last_name, c.city_name
FROM employee e
FULL JOIN city c ON c.city_id = e.city_id;
SELECT e.first_name, e.last_name, c.city_name
FROM employee e
CROSS JOIN city c;
SELECT c.city_name
FROM city c
LEFT JOIN employee e ON c.city_id = e.city_id
WHERE e.city_id IS NULL;