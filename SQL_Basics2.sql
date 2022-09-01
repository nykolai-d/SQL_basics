
SELECT * FROM clientes;
SELECT * FROM cuentas;

CREATE TABLE clientes(
	id INT PRIMARY KEY AUTO_INCREMENT, #ingresa datos consecutivos automáticamente
	nombre VARCHAR(50),
	identificacion VARCHAR(50)
	);

CREATE TABLE cuentas(
	id INT PRIMARY KEY AUTO_INCREMENT,
	numero VARCHAR(10) NOT NULL, #siempre es obligatorio digitar el número de cuenta
	idcliente INT,
	CONSTRAINT cliente_fk FOREIGN KEY(idcliente) REFERENCES clientes(id)
	);	

INSERT INTO clientes(nombre, identificacion)
VALUES
('Maria', '896325'),
('Pedro', '852369'),
('Paola', '741123');

INSERT INTO cuentas(numero, idcliente)
VALUES
('415263', 4);

DELETE FROM clientes WHERE id='2'; 

INSERT INTO clientes(id, nombre, identificacion)
VALUES
(2, 'Maria', '896325');

INSERT INTO clientes(id, nombre, identificacion)
VALUES
(5, 'Laura', '74185');

DELETE FROM cuentas WHERE id='2';

INSERT INTO cuentas(id, numero, idcliente)
VALUES(1, '415263', 4);

INSERT INTO cuentas(numero, idcliente)
VALUES('789123', 1);

UPDATE cuentas SET id=2 WHERE id=3;

INSERT INTO cuentas(numero, idcliente)
VALUES
('147321', 2),
('963215', 3),
('259814', 4)
;

UPDATE cuentas SET id=3 WHERE id=4;
UPDATE cuentas SET id=4 WHERE id=5;
UPDATE cuentas SET id=5 WHERE id=6;

INSERT INTO cuentas(id, numero, idcliente)
VALUES
(6, '323265', null);

##### SQL JOINS #####

SELECT * FROM clientes;
SELECT * FROM cuentas;

## INNER JOIN: Los datos que coinciden de ambas tablas
SELECT 
	cl.id AS 'No.',
	cl.nombre AS NombreCliente, 
	cl.identificacion AS IdCliente, 
	cu.id AS IdCliente, 
	cu.numero AS NumeroCuenta, 
	cu.id AS IdCuenta 
FROM clientes cl
INNER JOIN cuentas cu
ON cl.id = cu.idcliente
;

## LEFT JOIN: Todos los clientes, así no tengan cuentas
SELECT 
	cl.id,
	cl.nombre, 
	cl.identificacion, 
	cu.id,
	cu.numero
FROM clientes cl 
LEFT JOIN cuentas cu
ON cl.id = cu.idcliente;

## RIGHT JOIN: Todas las cuentas, así no tengan clientes asociados
SELECT 
	cl.id,
	cl.nombre, 
	cl.identificacion, 
	cu.id,
	cu.numero
FROM clientes cl 
RIGHT JOIN cuentas cu
ON cl.id = cu.idcliente;

## OUTER JOIN: Toda la información de ambas tablas, usando UNION
SELECT cl.id,
  	cl.nombre,
  	cl.identificacion,
  	cu.id,
  	cu.numero
FROM clientes cl
LEFT JOIN cuentas cu
ON cl.id = cu.idcliente
UNION
SELECT 
	cl.id,
  	cl.nombre,
  	cl.identificacion,
 	cu.id,
  	cu.numero
FROM clientes cl
RIGHT JOIN cuentas cu
ON cl.id = cu.idcliente;



##### EJERCICIOS ALTER, FOREIGN KEY #####

##### EJERCICIO 1 #####
# Crear dos tablas, libros y editoriales, las cuales deberán estar relacionadas 
# por un campo que permita asociar las editoriales a  cada libro

CREATE TABLE editorial(
	id INT PRIMARY KEY,
	nombre VARCHAR(50)	
	);

CREATE TABLE libros(
	id INT PRIMARY KEY,
	titulo VARCHAR(50),
	autor VARCHAR(50),
	id_editorial INT,
	CONSTRAINT editorial_fk FOREIGN KEY(id_editorial) REFERENCES editorial(id)
	);

SELECT * FROM libros;

SELECT * FROM editorial;

ALTER TABLE libros ADD COLUMN numeropaginas INT;
ALTER TABLE libros MODIFY COLUMN numeropaginas VARCHAR(20);
ALTER TABLE libros DROP COLUMN numeropaginas;

##### EJERCICIO 2 #####
# Crear tablas para resgistrar información de cantantes, canciones y álbumes.  
# Se requiere poder registrar las canciones que tiene un album y los cantantes de cada canción.

CREATE TABLE album(
	id INT PRIMARY KEY,
	nombre VARCHAR(50)	
	);

CREATE TABLE cantante(
	id INT PRIMARY KEY,
	nombre VARCHAR(50)
	);

CREATE TABLE canciones(
	id INT PRIMARY KEY,
	titulo VARCHAR(50),
	id_album INT,
	id_cantante INT,	
	CONSTRAINT album_fk FOREIGN KEY(id_album) REFERENCES album(id),
	CONSTRAINT cantante_fk FOREIGN KEY(id_cantante) REFERENCES cantante(id)
	);

##### EJERCICIO 3 #####
# Crear tablas para resgistrar información de accidentes laborales. Es requerido registrar los datos 
# del accidente, el tipo de accidente e información del empleado.

CREATE TABLE empleado(
	id INT PRIMARY KEY,
	nombre VARCHAR(50)	
	);

CREATE TABLE tipo_accidente(
	id INT PRIMARY KEY,
	tipo VARCHAR(50)	
	);


CREATE TABLE accidente(
	id INT PRIMARY KEY,
	fecha DATE,
	descripcion VARCHAR(100),
	id_empleado INT,
	id_tipoaccidente INT,
	CONSTRAINT empleado_fk FOREIGN KEY(id_empleado) REFERENCES empleado(id),
	CONSTRAINT tipo_accidente_fk FOREIGN KEY(id_tipoaccidente) REFERENCES tipo_accidente(id)	
	);

DROP TABLE accidente;
DROP TABLE empleado;
DROP TABLE tipo_accidente;

##### EJERCICIO 4 #####
# Crear restricciones para las tablas creadas en el ejercicio de la base de datos clínica

ALTER TABLE procedimientos 
	MODIFY COLUMN id_paciente INT;

ALTER TABLE procedimientos 
	ADD CONSTRAINT paciente_fk 	
	FOREIGN KEY(id_paciente) 
	REFERENCES pacientes(id);

ALTER TABLE procedimientos 
	MODIFY COLUMN id_medico INT;

ALTER TABLE procedimientos 
	ADD CONSTRAINT medico_fk 
	FOREIGN KEY(id_medico) 
	REFERENCES medicos(id);

ALTER TABLE procedimientos 
	MODIFY COLUMN id_tratamiento INT;

ALTER TABLE procedimientos 
	ADD CONSTRAINT tratamiento_fk 
	FOREIGN KEY(id_tratamiento) 
	REFERENCES tratamientos(id);

ALTER TABLE pacientes 
	MODIFY COLUMN tipo_identificacion INT;

ALTER TABLE pacientes 
	ADD CONSTRAINT tipo_identificacion_fk 
	FOREIGN KEY(tipo_identificacion) 
	REFERENCES tipo_identificacion(id);
	
ALTER TABLE medicos 
	MODIFY COLUMN tipo_identificacion INT;	

ALTER TABLE medicos 
	ADD CONSTRAINT id_medico_fk 
	FOREIGN KEY(tipo_identificacion) 
	REFERENCES tipo_identificacion(id);



##### EJERCICIOS SQL JOINS ######

##### EJERCICIO 1 #####
# Listado con nombre, apellidos, sexo, edad de los pacientes, 
# el nombre del tratamiento que se realizó y la fecha en la cual fue realizado.

SELECT * FROM tratamientos;
SELECT * FROM pacientes;
SELECT * FROM procedimientos;
SELECT * FROM medicos;

SELECT 
	p.nombres AS Nombre, 
	p.apellidos AS Apellidos, 
	p.sexo AS Sexo,
	TRUNCATE(DATEDIFF(NOW(), p.fecha_nacimiento)/365, 0) AS Edad,
	t.tratamientos AS Tratamiento,
	pr.fecha AS Fecha
FROM pacientes p
INNER JOIN procedimientos pr
ON p.id = pr.id
INNER JOIN tratamientos t;

##### EJERCICIO 2 #####
# Nombre del tratamiento y la cantidad de veces que ha sido realizado

SELECT 
	t.tratamientos,
	COUNT(p.id_tratamiento) cantidad
FROM tratamientos t 
INNER JOIN procedimientos p 
ON t.id = p.id_tratamiento 
GROUP BY t.tratamientos
ORDER BY cantidad DESC
;

##### EJERCICIO 3 #####
# Datos completos del medico y nombre de los tratamientos que ha realizado

SELECT 
	m.id, 	
	m.nombres, 
	m.apellidos, 
	m.identificacion,
	t.tratamientos
FROM medicos m
INNER JOIN procedimientos p
ON m.id = p.id_medico
INNER JOIN tratamientos t
; 

#### EJERCICIO 4 #####
# Datos de los pacientes y la cantidad de dinero pagado en tratamientos

SELECT  
	p.nombres, 	
	p.apellidos,
	p.sexo,
	TRUNCATE(DATEDIFF(NOW(), p.fecha_nacimiento)/365, 0) AS edad,
	SUM(pr.valor) AS valor_total_pagado
FROM pacientes p 
INNER JOIN procedimientos pr 
ON p.id = pr.id_paciente
GROUP BY p.nombres, p.apellidos, p.sexo, edad
;

##### ELERCICIO 5 #####
#Cantidad de valor pagado en tratamientos por sexo

SELECT 
	p.sexo,
	SUM(pr.valor) AS valor_total_pagado
FROM pacientes p 
INNER JOIN procedimientos pr
ON p.id = pr.id_paciente
GROUP BY sexo
;


##### EJERCICIO 6 #####
#Nombre de los tratamientos que han facturado más de 1.200.000

SELECT
	t.tratamientos, SUM(p.valor)
FROM procedimientos p 
INNER JOIN tratamientos t 
ON t.id  = p.id_tratamiento 
GROUP BY t.tratamientos 
HAVING SUM(p.valor) > 1200000
ORDER BY 2 DESC;



