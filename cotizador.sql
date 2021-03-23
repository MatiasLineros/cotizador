CREATE DATABASE IF NOT EXISTS cotizador;
USE cotizador;


CREATE TABLE roles(
	id int(255)  auto_increment not null,
	nombre varchar(255),
	created_at datetime,
	updated_at datetime,
	CONSTRAINT pk_roles PRIMARY KEY(id)
)ENGINE=InnoDb;

insert into roles (nombre) values('Administrador');
insert into roles (nombre) values('Vendedor');
insert into roles (nombre) values('Ejecutivo');

CREATE TABLE users(
	id 		int(255) auto_increment not null,
	name	varchar(255),
	email	varchar(255),
	password varchar(255),
	remember_token varchar(255),
	role_id int(255),
	estado varchar(255),
	created_at datetime,
	updated_at datetime,
	CONSTRAINT pk_usuario PRIMARY KEY(id),
	CONSTRAINT fk_usuario_role FOREIGN KEY(role_id) REFERENCES roles(id)
)ENGINE=InnoDb;

insert into users (name, email, password, role_id, estado) values('Orlando', 'o@o.cl', 
	'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', '2', 'Activo');

insert into users (name, email, password, role_id, estado) values('Matias', 'm@m.cl', 
	'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', '1', 'Activo');

insert into users (name, email, password, role_id, estado) values('Juan', 'j@j.cl', 
	'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', '3', 'Activo');

CREATE TABLE rollers(
	id 		int(255) auto_increment not null,
	tipo 	varchar(255),
	created_at datetime,
	updated_at datetime,
	CONSTRAINT pk_roller PRIMARY KEY(id)
)ENGINE=InnoDb;

insert into rollers (tipo) values('Blackout');
insert into rollers (tipo) values('Lino Blackout');
insert into rollers (tipo) values('Translúcida');
insert into rollers (tipo) values('Lino Translúcida');
insert into rollers (tipo) values('Screen');
insert into rollers (tipo) values('Duo');
insert into rollers (tipo) values('Duo Sun Out');
/*insert into rollers (tipo) values('Sun Screen');*/

CREATE TABLE colores(
	id 		int(255) auto_increment not null,
	color 	varchar(255),
	created_at datetime,
	updated_at datetime,
	CONSTRAINT pk_color PRIMARY KEY(id)
)ENGINE=InnoDb;

insert into colores (color) values('color 1');
insert into colores (color) values('color 2');
insert into colores (color) values('color 3');
insert into colores (color) values('color 4');
insert into colores (color) values('color 5');
insert into colores (color) values('color 6');
insert into colores (color) values('color 7');
insert into colores (color) values('color 8');
insert into colores (color) values('color 9');	
insert into colores (color) values('color 10');
insert into colores (color) values('color 11');

CREATE TABLE colores_rollers_predefinidos(
	id 		int(255) auto_increment not null,
	roller_id 	int(255),
	color_id 	int(255),
	created_at datetime,
	updated_at datetime,
	CONSTRAINT pk_colores_rollers_predefinidos PRIMARY KEY(id),
	CONSTRAINT fk_colores_rollers_predefinidos_roller FOREIGN KEY(roller_id) REFERENCES rollers(id),
	CONSTRAINT fk_colores_rollers_predefinidos_color FOREIGN KEY(color_id) REFERENCES colores(id)
)ENGINE=InnoDb;

insert into colores_rollers_predefinidos (roller_id, color_id) values(1, 1);
insert into colores_rollers_predefinidos (roller_id, color_id) values(1, 2);
insert into colores_rollers_predefinidos (roller_id, color_id) values(2, 3);
insert into colores_rollers_predefinidos (roller_id, color_id) values(3, 2);
insert into colores_rollers_predefinidos (roller_id, color_id) values(4, 3);
insert into colores_rollers_predefinidos (roller_id, color_id) values(6, 4);
insert into colores_rollers_predefinidos (roller_id, color_id) values(6, 5);
insert into colores_rollers_predefinidos (roller_id, color_id) values(6, 6);
insert into colores_rollers_predefinidos (roller_id, color_id) values(6, 7);
insert into colores_rollers_predefinidos (roller_id, color_id) values(6, 8);
insert into colores_rollers_predefinidos (roller_id, color_id) values(7, 4);
insert into colores_rollers_predefinidos (roller_id, color_id) values(7, 5);
insert into colores_rollers_predefinidos (roller_id, color_id) values(7, 6);
/*falta sun set, que no tiene precio de medidas*/

CREATE TABLE medidas(
	id 		int(255) auto_increment not null,
	alto 	int(255),
	ancho 	int(255),
	created_at datetime,
	updated_at datetime,
	CONSTRAINT pk_medida PRIMARY KEY(id)
)ENGINE=InnoDb;

insert into medidas (alto, ancho) values(75, 190);
insert into medidas (alto, ancho) values(90, 190);
insert into medidas (alto, ancho) values(105, 190);
insert into medidas (alto, ancho) values(120, 190);
insert into medidas (alto, ancho) values(135, 190);
insert into medidas (alto, ancho) values(150, 190);
insert into medidas (alto, ancho) values(165, 190);
insert into medidas (alto, ancho) values(180, 190);
insert into medidas (alto, ancho) values(200, 190);
insert into medidas (alto, ancho) values(75, 250);
insert into medidas (alto, ancho) values(90, 250);
insert into medidas (alto, ancho) values(105, 250);
insert into medidas (alto, ancho) values(120, 250);
insert into medidas (alto, ancho) values(135, 250);
insert into medidas (alto, ancho) values(150, 250);
insert into medidas (alto, ancho) values(165, 250);
insert into medidas (alto, ancho) values(180, 250);
insert into medidas (alto, ancho) values(200, 250);
insert into medidas (alto, ancho) values(75, 240);
insert into medidas (alto, ancho) values(90, 240);
insert into medidas (alto, ancho) values(105, 240);
insert into medidas (alto, ancho) values(120, 240);
insert into medidas (alto, ancho) values(135, 240);
insert into medidas (alto, ancho) values(150, 240);
insert into medidas (alto, ancho) values(165, 240);
insert into medidas (alto, ancho) values(180, 240);
insert into medidas (alto, ancho) values(200, 240);

CREATE TABLE cortinas_predefinidas(
	id 		int(255) auto_increment not null,
	roller_id 	int(255),
	medida_id 	int(255),
	precio 		int(255),
	created_at datetime,
	updated_at datetime,
	CONSTRAINT pk_cortinas_predefinidas PRIMARY KEY(id),
	CONSTRAINT fk_cortinas_predefinidas_roller FOREIGN KEY(roller_id) REFERENCES rollers(id),
	CONSTRAINT fk_cortinas_predefinidas_medida FOREIGN KEY(medida_id) REFERENCES medidas(id)
)ENGINE=InnoDb;

/*Blackout*/
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(1, 1, 6770);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(1, 2, 7750);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(1, 3,  8770);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(1, 4, 9770);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(1, 5, 10640);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(1, 6, 11600);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(1, 7, 12750);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(1, 8, 13750);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(1, 9, 15080);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(1, 10, 7810);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(1, 11, 9040);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(1, 12, 10210);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(1, 13, 11430);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(1, 14, 12500);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(1, 15, 13710);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(1, 16, 15020);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(1, 17, 16230);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(1, 18, 17850);

/*Lino blackout*/
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(2, 1, 9710);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(2, 2, 11290);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(2, 3, 12820);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(2, 4, 14360);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(2, 5, 15900);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(2, 6, 17420);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(2, 7, 18990);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(2, 8, 21360);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(2, 9, 23570);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(2, 10, 11260);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(2, 11, 13140);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(2, 11, 13140);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(2, 12, 15000);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(2, 13, 16840);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(2, 14, 18690);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(2, 15, 20520);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(2, 16, 22420);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(2, 17, 31420);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(2, 18, 31890);

/*translucida -> roller3*/
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(3, 1, 5040);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(3, 2, 5660);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(3, 3, 6270);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(3, 4, 6940);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(3, 5, 7430);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(3, 6, 8030);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(3, 7, 8810);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(3, 8, 9460);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(3, 9, 10310);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(3, 10, 5740);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(3, 11, 6490);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(3, 12, 7280);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(3, 13, 8060);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(3, 14, 8700);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(3, 15, 9460);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(3, 16, 10360);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(3, 17, 11130);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(3, 18, 12150);

/*Lino translucida*/
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(4, 1, 6730);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(4, 2, 7690);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(4, 3, 8620);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(4, 4, 9560);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(4, 5, 10470);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(4, 6, 11400);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(4, 7, 12390);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(4, 8, 14150);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(4, 9, 15550);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(4, 10, 8090);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(4, 11, 9350);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(4, 12, 10570);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(4, 13, 11780);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(4, 14, 13000);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(4, 15, 14210);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(4, 16, 15460);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(4, 17, 21300);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(4, 18, 21780);

/*Screen*/
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(5, 1, 8600);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(5, 2, 9960);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(5, 3, 11340);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(5, 4, 12740);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(5, 5, 14010);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(5, 6, 15370);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(5, 7, 16870);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(5, 8, 18270);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(5, 9, 20120);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(5, 10, 10360);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(5, 11, 12080);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(5, 12, 13820);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(5, 13, 15550);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(5, 14, 17180);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(5, 15, 18880);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(5, 16, 20730);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(5, 17, 22470);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(5, 18, 24790);

/*Duo*/
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(6, 19, 15730);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(6, 20, 18480);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(6, 21, 21090);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(6, 22, 23900);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(6, 23, 26520);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(6, 24, 29700);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(6, 25, 32390);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(6, 26, 35080);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(6, 27, 38870);

/*Duo Sun Out*/
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(7, 19, 22930);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(7, 20, 27390);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(7, 21, 31520);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(7, 22, 35680);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(7, 23, 40050);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(7, 24, 44780);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(7, 25, 49000);
insert into cortinas_predefinidas (roller_id, medida_id, precio) values(7, 26, 53220);


CREATE TABLE telas(
	id 		int(255) auto_increment not null,
	tipo 	varchar(255),
	roller_id int(255),
	created_at datetime,
	updated_at datetime,
	CONSTRAINT pk_tela PRIMARY KEY(id),
	CONSTRAINT fk_tela_roller FOREIGN KEY(roller_id) REFERENCES rollers(id)
)ENGINE=InnoDb;

insert into telas (tipo, roller_id) values('503', 1);
insert into telas (tipo, roller_id) values('003', 1);
insert into telas (tipo, roller_id) values('013', 1);
insert into telas (tipo, roller_id) values('015', 1);
insert into telas (tipo, roller_id) values('017', 1);
insert into telas (tipo, roller_id) values('503', 1);
insert into telas (tipo, roller_id) values('118', 1);
insert into telas (tipo, roller_id) values('336', 1);
insert into telas (tipo, roller_id) values('371', 5);
insert into telas (tipo, roller_id) values('372', 5);
insert into telas (tipo, roller_id) values('373', 5);
insert into telas (tipo, roller_id) values('374', 5);
insert into telas (tipo, roller_id) values('390', 5);
insert into telas (tipo, roller_id) values('392', 5);
insert into telas (tipo, roller_id) values('800', 3);
insert into telas (tipo, roller_id) values('010', 3);
insert into telas (tipo, roller_id) values('017', 3);
insert into telas (tipo, roller_id) values('BN178', 6);
insert into telas (tipo, roller_id) values('467', 7);

CREATE TABLE cortinas(
	id 			int(255) auto_increment not null,
	tela_id 	int(255),
	color_id 	int(255),
	created_at datetime,
	updated_at datetime,
	CONSTRAINT pk_cortina PRIMARY KEY(id),
	CONSTRAINT fk_cortina_tela FOREIGN KEY(tela_id) REFERENCES telas(id),
	CONSTRAINT fk_cortina_color FOREIGN KEY(color_id) REFERENCES colores(id)
)ENGINE=InnoDb;

/*Agregar cortinas*/

CREATE TABLE clientes(
	id 		int(255) auto_increment not null,
	rut 	varchar(255),
	nombre	varchar(255),
	apellido	varchar(255),
	telefono	int(255),
	direccion varchar(255),
	created_at datetime,
	updated_at datetime,
	CONSTRAINT pk_cliente PRIMARY KEY(id)
)ENGINE=InnoDb;

CREATE TABLE cotizaciones(
	id	int(255) auto_increment not null, 
	margen_ganancia int(3),
	tipo_cotización varchar(255),
	precio_total int(255),
	cliente_id int(255),
	usuario_id int(255),
	created_at datetime,
	updated_at datetime,
	CONSTRAINT pk_cotizacion PRIMARY KEY(id),
	CONSTRAINT fk_cotizacion_cliente FOREIGN KEY(cliente_id) REFERENCES clientes(id),
	CONSTRAINT fk_cotizacion_usuario FOREIGN KEY(usuario_id) REFERENCES users(id)
)ENGINE=InnoDb;

CREATE TABLE cotizaciones_especificas(
	id	int(255) auto_increment not null, 
	alto varchar(255),
	ancho varchar(255),
	precio int(255),
	cortina_id int(255),
	created_at datetime,
	updated_at datetime,
	CONSTRAINT pk_cotizacion_especificas PRIMARY KEY(id),
	CONSTRAINT fk_cotizacion_especificas_cotizacion FOREIGN KEY(id) REFERENCES cotizaciones(id),
	CONSTRAINT fk_cotizacion_especificas_cortina FOREIGN KEY(cortina_id) REFERENCES cortinas(id)
)ENGINE=InnoDb;

CREATE TABLE cotizaciones_a_medida(
	id	int(255) auto_increment not null, 
	cortina_predefinida_id int(255),
	color_roller_predefinido_id int(255),
	created_at datetime,
	updated_at datetime,
	CONSTRAINT pk_cotizacion_a_medida PRIMARY KEY(id),
	CONSTRAINT fk_cotizacion_a_medida_cotizacion FOREIGN KEY(id) REFERENCES cotizaciones(id),
	CONSTRAINT fk_cotizacion_a_medida_cortina_predefinida FOREIGN KEY(cortina_predefinida_id) REFERENCES cortinas_predefinidas(id),
	CONSTRAINT fk_cotizacion_a_medida_color_roller_predefinido FOREIGN KEY(color_roller_predefinido_id) REFERENCES colores_rollers_predefinidos(id)
)ENGINE=InnoDb;