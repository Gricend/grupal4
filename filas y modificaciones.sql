-- Parte 3: Modificación de la tabla
ALTER table usuario modify column zona_horaria varchar (10) default 'UTC-2';

-- Parte 4: Creación de registros.

INSERT INTO usuario (nombre, apellido, contraseña, género, teléfono)
VALUES ('Juan', 'Pérez', 'password123', 'M', '1234567890'),
		('María', 'González', 'abcdef',  'F', '987654321'),
		 ('Pedro', 'López', 'qwerty', 'M', '456789123'),
         ('Ana', 'Rodríguez', 'xyz123', 'F', '987654321'),
         ('Carlos', 'García', 'password', 'M', '123456789'),
         ('Laura', 'Sánchez', 'abcdef', 'F', '456789123'),
         ('Luis', 'Martínez', 'qwerty', 'M', '987654321'),
         ('Marcela', 'López', 'p@ssw0rd', 'F', '123456789');
         
INSERT INTO usuario_ingreso (id_usuario) VALUES (1),
												 (2),
												 (3),
												 (4),
												 (5),
												 (6),
												 (7),
												 (8);
-- Parte 6: Creen una nueva tabla llamada Contactos
create table contactos ( id_contacto INT AUTO_INCREMENT,
						id_usuario INT,
                        numero_telefono int,
                        correo_electronico varchar (30),
                        primary key (id_contacto),
						FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
    );
 -- Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?
 /* id_usuario: El tipo de dato utilizado es INT puesto que la ID se guarda de forma numerica.
    nombre y apellido: Ambos utilizan el tipo de dato VARCHAR(255) para dar amplia varaiedad de nombres en letras.
    contraseña: Utiliza el tipo de dato VARCHAR(255), para no dar ninguna limitancia a la hora de elegir contraseña.
    zona_horaria: Utiliza el tipo de dato VARCHAR(10), que da lo suficiente para poder elegir una zona horaria, como UTC-3.
    género: Utiliza el tipo de dato VARCHAR(10). En este caso, también parece una elección adecuada para almacenar el género en formato de texto.
    teléfono: Utiliza el tipo de dato VARCHAR(20) para dar un limite de 20 caracteres en los numeros, se pone VARCHAR y no INT porque algunos numeros (en otros paises especialmente) pueden tener letras.

En la tabla "usuario_ingreso":

    id_ingreso: El tipo de dato utilizado es INT puesto que la ID se guarda de forma numerica.
    id_usuario: El tipo de dato utilizado es INT. Es apropiado para establecer una relación con la tabla "usuario" a través de una clave foránea.
    fecha_ingreso: Utiliza el tipo de dato DATETIME con el valor predeterminado CURRENT_TIMESTAMP, dando una hora exacta de cuando se ingreso. */
insert INTO contactos values (001,1,111,'usuario1@example.com'),
							(002,2,111,'user1234@gmail.com'),
							(003,3,111,'contacto@empresa.com'),
							(004,4,111,'juanita_23@hotmail.com'),
							(005,5,111,'info@website.com'),
							(006,6,111,'empleado_1@company.co'),
							(007,7,111,'nombre.apellido@example.com'),
							(008,8,111,'john.doe@example.org');

-- Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos.		
UPDATE contactos
SET numero_telefono = (SELECT teléfono FROM usuario WHERE usuario.id_usuario = contactos.id_contacto);


         
        