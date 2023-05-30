-- Creacion Base de Datos y Usuario
create database grupal4;
CREATE USER 'grupal_4'@'localhost' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON grupal4.* TO 'grupal_4'@'localhost';
FLUSH PRIVILEGES;
 
 -- Parte 2: Crear dos tablas.
 
create table usuario ( id_usuario INT AUTO_INCREMENT,
					  nombre VARCHAR(255),
					  apellido VARCHAR(255),
					  contraseña VARCHAR(255),
					  zona_horaria VARCHAR(10) DEFAULT 'UTC-3',
					  género VARCHAR(10),
					  teléfono VARCHAR(20),
					  PRIMARY KEY (id_usuario)
);


create table usuario_ingreso (
							  id_ingreso INT AUTO_INCREMENT,
							  id_usuario INT,
							  fecha_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP,
							  PRIMARY KEY (id_ingreso),
							  FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);
