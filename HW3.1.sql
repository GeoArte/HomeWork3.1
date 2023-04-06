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