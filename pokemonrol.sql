\c jlopez
DROP DATABASE pokerols;
CREATE DATABASE pokerols;
\c pokerols


CREATE TABLE rol(
id SERIAL,
nombre VARCHAR,
descripcion VARCHAR,
PRIMARY KEY (id)

); 

SELECT * FROM rol;

CREATE TABLE usuario(
rut VARCHAR(12),
nombre VARCHAR(15),
telefono INT,
mail VARCHAR(30),
genero VARCHAR(30),
fecha_nacimiento DATE,
rol_id INT,
FOREIGN KEY (rol_id) REFERENCES rol(id)

);

SELECT * FROM usuario;

INSERT INTO rol (nombre, descripcion)
VALUES ('administrador', 'control total');
INSERT INTO rol (nombre, descripcion)
VALUES ('marketing', 'editar y crear anuncios');
INSERT INTO rol (nombre, descripcion)
VALUES ('editor', 'editar articulos');
INSERT INTO rol (nombre, descripcion)
VALUES ('subscriptor', 'leer articulos');

SELECT * FROM rol;

INSERT INTO usuario (rut, nombre, telefono, mail, genero, fecha_nacimiento, rol_id)
VALUES ('1-9 ', 'Juan soto', 9999999, 'juan-soto@gmail.com', 'M','2000-06-23', '1');
INSERT INTO usuario (rut, nombre, telefono, mail, genero, fecha_nacimiento, rol_id)
VALUES ('2-7 ', 'Jorge Perez', 8888888, 'jorge-morales@gmail.com', 'M','2000-06-24', '4');
INSERT INTO usuario (rut, nombre, telefono, mail, genero, fecha_nacimiento)
VALUES ('3-5 ', 'Sarita soto', 7777777, 'sarita-soto@gmail.com', 'F','2000-06-25');

SELECT * FROM usuario;

-- SELECT * FROM rol INNER JOIN usuario ON rol.id = usuario.rol_id;
-- SELECT * FROM rol JOIN usuario ON rol.id = usuario.rol_id;

-- SELECT rol.nombre FROM rol JOIN usuario ON rol.id = usuario.rol_id WHERE usuario.genero = 'M';

SELECT rol.nombre AS rol_ejemplo1
FROM rol JOIN usuario
ON rol.id = usuario.rol_id
WHERE usuario.genero = 'M';

SELECT A.nombre AS rol_ejemplo2
FROM rol AS A
JOIN usuario AS B 
ON A.id = B.rol_id
WHERE B.genero = 'M';

--> JOIN > igualdad entre p key y f key. Por eso en el ejemplo busca solo los dos (de 3) que tienen id.



SELECT * FROM usuario
JOIN rol
ON usuario.rol_id = rol.id;

-- SELECT * FROM usuario
-- LEFT JOIN rol
-- ON usuario.rol_id = rol.id;

SELECT * FROM rol
LEFT JOIN usuario
ON rol.id = usuario.rol_id;

SELECT rol.*
FROM rol 
LEFT JOIN usuario
ON rol.id = usuario.rol_id
WHERE usuario.rol_id IS NULL; 

