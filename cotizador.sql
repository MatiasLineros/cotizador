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

CREATE TABLE cortinas_predefinidas(
	id 		int(255) auto_increment not null,
	roller_id 	int(255),
	medida_id 	int(255),
	color_id    int(255),
	precio 		int(255),
	created_at datetime,
	updated_at datetime,
	CONSTRAINT pk_cortinas_predefinidas PRIMARY KEY(id),
	CONSTRAINT fk_cortinas_predefinidas_roller FOREIGN KEY(roller_id) REFERENCES rollers(id),
	CONSTRAINT fk_cortinas_predefinidas_medida FOREIGN KEY(medida_id) REFERENCES medidas(id),
	CONSTRAINT fk_cortinas_predefinidas_color FOREIGN KEY(color_id) REFERENCES colores(id)
)ENGINE=InnoDb;

/*Blackout*/
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 1, 1, 6770);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 1, 3, 6770);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 2, 1, 7750);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 2, 5, 7750);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 3, 1, 8770);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 3, 2, 8770);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 4, 1, 9770);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 4, 7, 9770);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 5, 1, 10640);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 5, 2, 10640);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 6, 1, 11600);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 6, 9, 11600);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 7, 1, 12750);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 7, 3, 12750);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 8, 1, 13750);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 8, 4, 13750);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 9, 1, 15080);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 9, 5, 15080);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 10, 1, 7810);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 10, 6, 7810);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 11, 1, 9040);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 11, 3, 9040);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 12, 1, 10210);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 12, 6, 10210);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 13, 1, 11430);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 13, 2, 11430);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 14, 1, 12500);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 14, 7, 12500);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 15, 1, 13710);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 15, 10, 13710);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 16, 1, 15020);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 16, 2, 15020);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 17, 1, 16230);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 17, 5, 16230);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 18, 1, 17850);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(1, 18, 9, 17850);

/*Lino blackout*/
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 1, 1, 9710);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 1, 3, 9710);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 2, 1, 11290);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 2, 4, 11290);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 3, 1, 12820);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 3, 5, 12820);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 4, 1, 14360);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 4, 6, 14360);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 5, 1, 15900);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 5, 3, 15900);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 6, 1, 17420);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 6, 9, 17420);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 7, 1, 18990);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 7, 5, 18990);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 8, 1, 21360);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 8, 5, 21360);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 9, 1, 23570);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 9, 4, 23570);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 10, 1, 11260);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 10, 4, 11260);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 11, 1, 13140);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 11, 3, 13140);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 12, 1, 15000);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 12, 3, 15000);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 13, 1, 16840);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 13, 2, 16840);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 14, 1, 18690);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 14, 7, 18690);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 15, 1, 20520);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 15, 7, 20520);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 16, 1, 22420);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 16, 5, 22420);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 17, 1, 31420);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 17, 4, 31420);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 18, 1, 31890);
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(2, 18, 11, 31890);

/*translucida*/
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(3, 1, 1, 5040);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(3, 2, 1, 5660);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(3, 3, 1, 6270);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(3, 4, 1, 6940);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(3, 5, 1, 7430);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(3, 6, 1, 8030);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(3, 7, 1, 8810);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(3, 8, 1, 9460);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(3, 9, 1, 10310);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(3, 10, 1, 5740);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(3, 11, 1, 6490);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(3, 12, 1, 7280);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(3, 13, 1, 8060);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(3, 14, 1, 8700);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(3, 15, 1, 9460);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(3, 16, 1, 10360);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(3, 17, 1, 11130);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(3, 18, 1, 12150);

/*Lino translucida*/
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(4, 1, 1, 6730);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(4, 2, 1, 7690);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(4, 3, 1, 8620);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(4, 4, 1, 9560);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(4, 5, 1, 10470);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(4, 6, 1, 11400);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(4, 7, 1, 12390);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(4, 8, 1, 14150);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(4, 9, 1, 15550);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(4, 10, 1, 8090);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(4, 11, 1, 9350);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(4, 12, 1, 10570);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(4, 13, 1, 11780);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(4, 14, 1, 13000);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(4, 15, 1, 14210);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(4, 16, 1, 15460);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(4, 17, 1, 21300);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(4, 18, 1, 21780);

/*Screen*/
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(5, 1, 1, 8600);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(5, 2, 1, 9960);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(5, 3, 1, 11340);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(5, 4, 1, 12740);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(5, 5, 1, 14010);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(5, 6, 1, 15370);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(5, 7, 1, 16870);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(5, 8, 1, 18270);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(5, 9, 1, 20120);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(5, 10, 1, 10360);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(5, 11, 1, 12080);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(5, 12, 1, 13820);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(5, 13, 1, 15550);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(5, 14, 1, 17180);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(5, 15, 1, 18880);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(5, 16, 1, 20730);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(5, 17, 1, 22470);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(5, 18, 1, 24790);

/*Duo*/
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(6, 19, 1, 15730);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(6, 20, 1, 18480);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(6, 21, 1, 21090);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(6, 22, 1, 23900);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(6, 23, 1, 26520);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(6, 24, 1, 29700);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(6, 25, 1, 32390);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(6, 26, 1, 35080);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(6, 27, 1, 38870);

/*Duo Sun Out*/
insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(7, 19, 1, 22930);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(7, 20, 1, 27390);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(7, 21, 1, 31520);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(7, 22, 1, 35680);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(7, 23, 1, 40050);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(7, 24, 1, 44780);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(7, 25, 1, 49000);

insert into cortinas_predefinidas (roller_id, medida_id, color_id, precio) values(7, 26, 1, 53220);


/*
CREATE TABLE rollers_colores(
	id 		int(255) auto_increment not null,
	roller_id 	int(255),
	color_id 	int(255),
	created_at datetime,
	updated_at datetime,
	CONSTRAINT pk_roller_color PRIMARY KEY(id),
	CONSTRAINT fk_roller_color_roller FOREIGN KEY(roller_id) REFERENCES rollers(id),
	CONSTRAINT fk_roller_color_color FOREIGN KEY(color_id) REFERENCES colores(id)
)ENGINE=InnoDb;

/*Agregar rollers_colores*/


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
	created_at datetime,
	updated_at datetime,
	CONSTRAINT pk_cotizacion_a_medida PRIMARY KEY(id),
	CONSTRAINT fk_cotizacion_a_medida_cotizacion FOREIGN KEY(id) REFERENCES cotizaciones(id),
	CONSTRAINT fk_cotizacion_a_medida_cortina_predefinida FOREIGN KEY(cortina_predefinida_id) REFERENCES cortinas_predefinidas(id)
)ENGINE=InnoDb;