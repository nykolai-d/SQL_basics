# IP: 34.122.51.150
# usuario1g51 (misma contraseña)

SELECT *
FROM selfemenina
;

SELECT 
	nombre AS NombreJugadora, 
	partidosjugados AS PJ, 
	goles AS G
FROM selfemenina
WHERE goles > 0
;

SELECT 
	nombre AS Anotadoras,
	goles AS Goles
FROM 
	selfemenina
WHERE 
	goles > 0
;

SELECT 
	nombre AS Anotadoras,
	goles AS Goles,
	partidosjugados AS PJ
FROM selfemenina
WHERE goles >0
AND partidosjugados >= 10
ORDER BY goles DESC
;

INSERT INTO selfemenina 
(id, nombre, posicion, edad, partidosjugados, goles, club)
VALUES (0, 'Jimmy', 'Aguatero', 13, 0, 0, 'Santa Fe')
;

CREATE TABLE bandas(
decada INT, 
nombre VARCHAR(50), 
genero VARCHAR(50), 
ventas INT
);

SELECT * FROM bandas;

INSERT INTO 
bandas(decada, nombre, genero, ventas)
VALUES
(1970, 'Led Zeppelin', 'Rock', 5000000),
(1980, 'Depeche mode', 'Brit Pop', 100000),
(1990, 'Stone Temple Pilots', 'Grunge', 90500),
(2000, 'Korn', 'Neo Metal', 2000),
(2010, 'Queens of the Stone Age', 'Stoner Rock', 8000000)
;

INSERT INTO 
bandas(decada, nombre, genero, ventas)
VALUES
(2020, 'Lamb of God', 'Metal', 2000000),
(1960, 'The Beatles', 'Brit Pop', 700000000)
;

SELECT * FROM selfemenina
	ORDER BY edad ASC
	LIMIT 10;

SELECT nombre, edad, goles FROM selfemenina;

SELECT  nombre, edad, goles FROM selfemenina
	WHERE goles > 2 AND edad < 30
	ORDER BY edad ASC;

SELECT SUM(goles), posicion FROM selfemenina
	GROUP BY posicion;

SELECT SUM(partidosjugados), posicion FROM selfemenina
	GROUP BY posicion;
	
SELECT AVG(edad), posicion FROM selfemenina
	GROUP BY posicion;

CREATE TABLE cliente_ndd(
ID INT PRIMARY KEY,
FECHA DATE,
NOMBRE VARCHAR(50)
);

INSERT INTO cliente_ndd(ID, FECHA, NOMBRE)
VALUES(1, '2022-08-04', 'nykolai'),
(2, '2000-01-05', 'nykolai2'),
(3, '2021-07-02', 'nykolai3')
;

SELECT * FROM cliente_ndd;

SELECT * FROM cliente_ndd WHERE FECHA > '2005-01-01'
	ORDER BY FECHA ASC;


###################
###################


#REVIEW

SELECT * FROM estudiantes;

INSERT INTO departments VALUES(3, Cerveza, Javier, 3);

SELECT MANAGER_ID FROM departments;

SELECT nombre, apellidos, sexo
	FROM estudiantes;

SELECT * FROM employees;

SELECT FIRST_NAME, LAST_NAME, SALARY 
	FROM employees 
	WHERE DEPARTMENT_ID = 30;

SELECT FIRST_NAME, LAST_NAME, SALARY 
	FROM employees 
	WHERE SALARY >= 9000
	ORDER BY SALARY DESC;

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY 
	FROM employees 
	WHERE DEPARTMENT_ID <> 30 AND SALARY > 9000
	ORDER BY SALARY DESC;

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY 
	FROM employees
	WHERE (DEPARTMENT_ID = 60 OR DEPARTMENT_ID = 100)
	AND SALARY > 4000;

#BETWEEN
	
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE, SALARY
	FROM employees 
	WHERE SALARY 
	BETWEEN 2100 AND 3000
	ORDER BY SALARY DESC;

#LIKE

SELECT FIRST_NAME, LAST_NAME, PHONE_NUMBER, SALARY
	FROM employees 
	WHERE PHONE_NUMBER LIKE '515.123%';
	
SELECT FIRST_NAME, LAST_NAME, SALARY
	FROM employees 
	WHERE FIRST_NAME LIKE 'A%';

#IN

SELECT FIRST_NAME, LAST_NAME, SALARY 
	FROM employees 
	WHERE SALARY 
	IN (3100,4400,6500);

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID 
	FROM employees 
	WHERE DEPARTMENT_ID 
	IN (30,60,100)
	AND FIRST_NAME LIKE 'S%';

#OPERATING

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY, SALARY * 1.10 AS 'SALARY+10%'
	FROM employees
	ORDER BY SALARY DESC;

SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY, SALARY * 0.8 AS 'SALARY-20%'
	FROM employees
	WHERE DEPARTMENT_ID = 50
	ORDER BY SALARY DESC;

SELECT FIRST_NAME, LAST_NAME, HIRE_DATE, NOW()
FROM employees;

#TRUNCATE

SELECT FIRST_NAME, LAST_NAME, TRUNCATE(DATEDIFF(NOW(),HIRE_DATE)/365, 0) AS YEARS_IN_COMPANY
FROM employees;

#HAVING

SELECT DEPARTMENT_ID,
	SUM(SALARY) AS Total, 
	TRUNCATE(AVG(SALARY),2) AS Average, 
	MAX(SALARY) AS 'Highest Salary',
	MIN(SALARY) AS 'Lowest Salary',
	COUNT(EMPLOYEE_ID) AS Employees 
FROM employees
	GROUP BY DEPARTMENT_ID
	HAVING COUNT(EMPLOYEE_ID) >30; #Filter within the column. HAVING always goes after a GROUP BY
	
SELECT DEPARTMENT_ID,
	SUM(SALARY) AS Total, 
	TRUNCATE(AVG(SALARY),2) AS Average, 
	MAX(SALARY) AS 'Highest Salary',
	MIN(SALARY) AS 'Lowest Salary',
	COUNT(EMPLOYEE_ID) AS Employees 
FROM employees
	GROUP BY DEPARTMENT_ID 
	HAVING AVG(SALARY)<10000; # All departments with an average salary lower than 10000
	
#UPDATE
	
SELECT * FROM estudiantes;
UPDATE estudiantes SET apellidos='Lopez', 
	email='laura@gmail.com',
	telefono ='1234567'
WHERE nombre='Juliana'; #Always use WHERE

#DELETE

DELETE FROM estudiantes 
WHERE ID=5; #Always use WHERE







