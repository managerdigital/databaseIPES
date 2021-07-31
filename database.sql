
-- roles: ['SUPER_ADMIN', 'ADMIN_LOCATARIO'] 
CREATE TABLE admins(
    id  SERIAL PRIMARY KEY,
    email TEXT DEFAULT NULL,
    password TEXT NOT NULL,
    nombre TEXT DEFAULT NULL,
    apellido TEXT DEFAULT NULL,
    telefono NUMERIC DEFAULT NULL,
    cedula NUMERIC DEFAULT NULL,
    img TEXT DEFAULT NULL,
    rol TEXT DEFAULT 'ADMIN_LOCATARIO',
	activo boolean DEFAULT TRUE,
    token_reset TEXT DEFAULT NULL,
    created_at DATE DEFAULT NULL,
    updated_at DATE DEFAULT NULL,
	UNIQUE(email, cedula)
);

CREATE TABLE localidades (
    id SERIAL PRIMARY KEY,
	nombre  VARCHAR (50) NOT NULL,
    created_at date DEFAULT NULL,
    updated_at date DEFAULT NULL
);

INSERT INTO localidades(nombre) VALUES('Barrios Unidos');
INSERT INTO localidades(nombre) VALUES('Bosa');
INSERT INTO localidades(nombre) VALUES('Chapinero');
INSERT INTO localidades(nombre) VALUES('Ciudad Bolívar');
INSERT INTO localidades(nombre) VALUES('Engativá');
INSERT INTO localidades(nombre) VALUES('Fontibón');
INSERT INTO localidades(nombre) VALUES('Kennedy');
INSERT INTO localidades(nombre) VALUES('La candelaria');
INSERT INTO localidades(nombre) VALUES('Los Mártires');
INSERT INTO localidades(nombre) VALUES('Puente Aranda');
INSERT INTO localidades(nombre) VALUES('Rafael Uribe Uribe');
INSERT INTO localidades(nombre) VALUES('San Cristóbal');
INSERT INTO localidades(nombre) VALUES('Santa Fe');
INSERT INTO localidades(nombre) VALUES('Suba');
INSERT INTO localidades(nombre) VALUES('Sumapaz');
INSERT INTO localidades(nombre) VALUES('Teusaquillo');
INSERT INTO localidades(nombre) VALUES('Tunjuelito');
INSERT INTO localidades(nombre) VALUES('Usaquén');
INSERT INTO localidades(nombre) VALUES('Usme');


SELECT * FROM localidades where UNACCENT(UPPER('Ciudad Bolívar'));
INSERT INTO localidades(nombre) VALUES(UNACCENT(UPPER('Antonio Nariño')));
INSERT INTO localidades(admin_id, categoria_plazas_id, localidad_id, nombre, direccion, telefono1) VALUES('Usme');


CREATE TABLE plazas(
    id SERIAL PRIMARY KEY,
    admin_id  INTEGER[] DEFAULT NULL,
    localidad_id INT DEFAULT NULL REFERENCES localidades(id) ON UPDATE CASCADE ON DELETE SET NULL,
    categorias_id INTEGER[] DEFAULT NULL,
    nombre VARCHAR (50) NOT NULL,
    direccion VARCHAR (50) DEFAULT NULL,
    telefonos bigint[] DEFAULT NULL,
    email VARCHAR (50) DEFAULT null,
    img VARCHAR (250) DEFAULT NULL,
    logo VARCHAR (250) DEFAULT NULL,
    -- precio_domicilio NUMERIC DEFAULT 0,
    horarios text[] DEFAULT NULL,
    activo boolean DEFAULT TRUE,
    created_at DATE DEFAULT NULL,
    updated_at DATE DEFAULT NULL,
    UNIQUE(nombre)
);
    FOREIGN KEY (EACH ELEMENT OF admin_id) REFERENCES admins
 statements END LOOP
 
 FOREIGN KEY (EACH ELEMENT OF ftest1) REFERENCES PKTABLEFORARRAY,

INSERT INTO plazas(admin_id, localidad_nombre, nombre, direccion) VALUES('{1}', 'Barrios Unidos', '12 de Octubre', 'Calle 72 #39-62');
INSERT INTO plazas(admin_id, localidad_nombre, nombre, direccion) VALUES('{1}', 'San Cristóbal', '20 de Julio', 'Carrera 6 #24-60 sur');
INSERT INTO plazas(admin_id, localidad_nombre, nombre, direccion) VALUES('{1}', 'Barrios Unidos', '7 de Agosto', 'Calle 66 #23-30');
INSERT INTO plazas(admin_id, localidad_nombre, nombre, direccion) VALUES('{1}', 'Fontibón', 'Fontibón', 'Carrera 103 #26-71');
INSERT INTO plazas(admin_id, localidad_nombre, nombre, direccion) VALUES('{1}', 'Kennedy', 'Kennedy', 'Calle 42S #81A-50');
INSERT INTO plazas(admin_id, localidad_nombre, nombre, direccion) VALUES('{1}', 'Candelaria', 'La Concordia', 'Calle 14 #1-40');
INSERT INTO plazas(admin_id, localidad_nombre, nombre, direccion) VALUES('{1}', 'Santa Fe', 'La Perseverancia', 'Carrera 5A #30-30');
INSERT INTO plazas(admin_id, localidad_nombre, nombre, direccion) VALUES('{1}', 'Santa Fe', 'Las Cruces', 'Calle 1AF #4-60');
INSERT INTO plazas(admin_id, localidad_nombre, nombre, direccion) VALUES('{1}', 'Engativá', 'Las Ferias', 'Calle 74B #69Q-35');
INSERT INTO plazas(admin_id, localidad_nombre, nombre, direccion) VALUES('{1}', 'Ciudad Bolívar', 'Lucero', 'Carrera 17F #69A-50 Sur');
INSERT INTO plazas(admin_id, localidad_nombre, nombre, direccion) VALUES('{1}', 'Engativá', 'Quirigua', 'Calle 90 #91-51');
INSERT INTO plazas(admin_id, localidad_nombre, nombre, direccion) VALUES('{1}', 'Antonio Nariño', 'Restrepo', 'Carrera 19 #18-51 Sur');
INSERT INTO plazas(admin_id, localidad_nombre, nombre, direccion) VALUES('{1}', 'Los Mártires', 'Samper Mendoza', 'Carrera 25 #22A-13');
INSERT INTO plazas(admin_id, localidad_nombre, nombre, direccion) VALUES('{1}', 'Tunjuelito', 'San Benito', 'Carrera 17 #56A-18 Sur');
INSERT INTO plazas(admin_id, localidad_nombre, nombre, direccion) VALUES('{1}', 'Tunjuelito', 'San Carlos', 'Carrera 19C #50A-90 Sur');
INSERT INTO plazas(admin_id, localidad_nombre, nombre, direccion) VALUES('{1}', 'Antonio Nariño', 'Santander', 'Calle 26 Sur #30-51');
INSERT INTO plazas(admin_id, localidad_nombre, nombre, direccion) VALUES('{1}', 'Puente Aranda', 'Trinidad Galán', 'Carrera 60 #5-00');


INSERT INTO plazas(admin_id, localidad_nombre, nombre, direccion, telefonos, horarios, categorias_nombres) VALUES(1, 'Barrios Unidos', '12 de Octubre', 'Calle 72 #39-62','{4385964, 2342345}', '{"6am - 12pm", "2pm - 6pm"}', '{"Artesanías", "Hierbas"}');
SELECT id, nombre, categorias_nombres[1:26] FROM plazas;

CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
	nombre VARCHAR (50) NOT NULL,
    icono VARCHAR (50) DEFAULT NULL,
    descripcion text DEFAULT NULL,
    slug VARCHAR (50) DEFAULT NULL,
    activo boolean DEFAULT TRUE,
    created_at date DEFAULT NULL,
    updated_at date DEFAULT NULL,
    UNIQUE(nombre)
);

INSERT INTO categorias(nombre) VALUES('Artesanías');
INSERT INTO categorias(nombre) VALUES('Frutas');
INSERT INTO categorias(nombre) VALUES('Verduras');
INSERT INTO categorias(nombre) VALUES('Plantas');
INSERT INTO categorias(nombre) VALUES('Flores');
INSERT INTO categorias(nombre) VALUES('Hierbas');
INSERT INTO categorias(nombre) VALUES('Esotéricos');
INSERT INTO categorias(nombre) VALUES('Cárnicos');
INSERT INTO categorias(nombre) VALUES('Pollo');
INSERT INTO categorias(nombre) VALUES('Salsamentaría');
INSERT INTO categorias(nombre) VALUES('Cafetería');
INSERT INTO categorias(nombre) VALUES('Huevos');
INSERT INTO categorias(nombre) VALUES('Relojerías');
INSERT INTO categorias(nombre) VALUES('Ropa');
INSERT INTO categorias(nombre) VALUES('Ferretería');
INSERT INTO categorias(nombre) VALUES('Gastronomía');
INSERT INTO categorias(nombre) VALUES('Postres');
INSERT INTO categorias(nombre) VALUES('Productos de aseo');
INSERT INTO categorias(nombre) VALUES('Miscelánea');
INSERT INTO categorias(nombre) VALUES('Jugos');
INSERT INTO categorias(nombre) VALUES('Ensaladas de frutas');
INSERT INTO categorias(nombre) VALUES('Granero');
INSERT INTO categorias(nombre) VALUES('Mercado campesino');
INSERT INTO categorias(nombre) VALUES('Lácteos');
INSERT INTO categorias(nombre) VALUES('Peces');
INSERT INTO categorias(nombre) VALUES('Mascotas');


CREATE TABLE locatarios(
    id SERIAL PRIMARY KEY,
    admin_id INT[] DEFAULT NULL,
    plaza_id INT NOT NULL REFERENCES plazas(id) ON DELETE SET NULL,
    categorias_id INT[] DEFAULT NULL,
    productos_locatarios_id INT[] DEFAULT NULL,
    nombre_local VARCHAR (250) DEFAULT NULL,
    numero_local bigint[] DEFAULT NULL,
    nombre VARCHAR (250) DEFAULT NULL,
    apellido VARCHAR (50) DEFAULT NULL,
    cedula bigint DEFAULT NULL,
    email VARCHAR (50) DEFAULT null,
    telefonos bigint[] DEFAULT NULL,
    horarios text[] DEFAULT NULL,
    img VARCHAR (250) DEFAULT NULL,
    logo VARCHAR (250) DEFAULT NULL,
    activo boolean DEFAULT TRUE,
    created_at DATE DEFAULT NULL,
    updated_at DATE DEFAULT NULL,
    UNIQUE(email)
);

SELECT * FROM locatarios WHERE '(408)-783-5731' = ANY (numero_local);



SELECT COUNT(plaza_id) FROM locatarios WHERE plaza_id = 2 GROUP BY plaza_id;

INSERT INTO locatarios(admin_id, plaza_id, categorias, nombre, horarios) VALUES(1, 2, '{"Ropa", "Mascotas"}', 'Locatario Nombre', '{"6am - 12pm", "2pm - 6pm"}');


CREATE TABLE productos(
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    categorias_id INT[] DEFAULT NULL,
    plazas_id INT[] DEFAULT NULL,
    descripcion TEXT DEFAULT NULL ,
    sku TEXT DEFAULT NULL,
    unidad TEXT DEFAULT NULL,
    imagen_principal TEXT DEFAULT NULL,
    imagen_1 TEXT DEFAULT NULL,
    imagen_2 TEXT DEFAULT NULL,
    activo boolean DEFAULT TRUE,
    created_at date DEFAULT NULL,
    updated_at date DEFAULT NULL
);

CREATE TABLE productos_locatarios(
    id SERIAL PRIMARY KEY,
    producto_id INT DEFAULT NULL REFERENCES productos ON DELETE SET NULL,
    locatario_id INT DEFAULT NULL REFERENCES locatarios ON DELETE SET NULL,
    plaza_id INT DEFAULT NULL REFERENCES plazas ON DELETE SET NULL,
    stock BOOLEAN DEFAULT TRUE,
    en_promocion BOOLEAN DEFAULT FALSE,
    precio NUMERIC CHECK (precio > 0),
    precio_rebajado NUMERIC DEFAULT 0,
    CHECK (precio > precio_rebajado),
    descripcion TEXT DEFAULT NULL,
    sku TEXT DEFAULT NULL,
    activo BOOLEAN DEFAULT TRUE,
    created_at DATE DEFAULT NULL,
    updated_at DATE DEFAULT NULL
);



CREATE TABLE clientes(
    id SERIAL PRIMARY KEY,
    nombre TEXT DEFAULT NULL,
    telefono NUMERIC DEFAULT NULL,
    cedula bigint DEFAULT NULL,
    direccion TEXT DEFAULT NULL,
    email TEXT not null,
    password TEXT not null,
    img TEXT DEFAULT NULL,
    activo boolean DEFAULT TRUE,
    token_reset TEXT DEFAULT NULL,
    created_at DATE DEFAULT NULL,
    updated_at DATE DEFAULT NULL,
    UNIQUE(email)
);

-- ESTADOS 'ENVIADO' - 'EN PROGRESO' - 'ENTREGADO' - 'CANCELADO'
-- 0 - 1 - 2 - 3 
CREATE TABLE pedidos(
    id SERIAL PRIMARY KEY,
    pasarela_pagos_id INT DEFAULT NULL,
    plaza_id INT DEFAULT NULL REFERENCES plazas(id) ON UPDATE CASCADE ON DELETE SET NULL,
    locatorios_id INT DEFAULT NULL  REFERENCES locatarios(id) ON UPDATE CASCADE ON DELETE SET NULL,
    cliente_id INT DEFAULT NULL REFERENCES clientes(id) ON UPDATE CASCADE ON DELETE SET NULL,
    productos_locatarios_id INT[] DEFAULT NULL,
    estado NUMERIC DEFAULT 0,
    total NUMERIC DEFAULT NULL CHECK (total > 0),
    created_at DATE DEFAULT NULL,
    updated_at DATE DEFAULT NULL
);
   

CREATE TABLE ventas_productos_locatarios(
    id SERIAL PRIMARY KEY,
    plaza_id INT DEFAULT NULL REFERENCES plazas(id) ON UPDATE CASCADE ON DELETE SET NULL,
    locatario_id INT DEFAULT NULL REFERENCES locatarios(id) ON UPDATE CASCADE ON DELETE SET NULL,
    producto_locatario_id INT DEFAULT NULL REFERENCES productos_locatarios(id) ON UPDATE CASCADE ON DELETE SET NULL,
    created_at DATE DEFAULT NULL,
    updated_at DATE DEFAULT NULL
);

CREATE TABLE ventas_categorias(
    id SERIAL PRIMARY KEY,
    plaza_id INT DEFAULT NULL REFERENCES plazas(id) ON UPDATE CASCADE ON DELETE SET NULL,
    locatario_id INT DEFAULT NULL REFERENCES locatarios(id) ON UPDATE CASCADE ON DELETE SET NULL,
    categoria_id INT DEFAULT NULL REFERENCES categorias(id) ON UPDATE CASCADE ON DELETE SET NULL,
    created_at DATE DEFAULT NULL,
    updated_at DATE DEFAULT NULL
);


CREATE TABLE boletines(
    id SERIAL PRIMARY KEY,
    email TEXT not null,
    created_at DATE DEFAULT NULL,
    updated_at DATE DEFAULT NULL
);


CREATE TABLE balances(
    id SERIAL PRIMARY KEY,
    total NUMERIC DEFAULT NULL CHECK (total > 0),
    plaza_id INT DEFAULT NULL REFERENCES plazas(id) ON UPDATE CASCADE ON DELETE SET NULL,
    locatorio_id INT DEFAULT NULL REFERENCES locatarios(id) ON UPDATE CASCADE ON DELETE SET NULL,
    cliente_id INT DEFAULT NULL REFERENCES clientes(id) ON UPDATE CASCADE ON DELETE SET NULL,
    created_at DATE DEFAULT NULL,
    updated_at DATE DEFAULT NULL
);




CREATE TABLE calificaciones(
    id SERIAL PRIMARY KEY,
    cliente_id INT DEFAULT NULL REFERENCES clientes(id) ON UPDATE CASCADE ON DELETE SET NULL,
    pedido_id INT DEFAULT NULL REFERENCES pedidos(id) ON UPDATE CASCADE ON DELETE SET NULL,
    plaza_id INT DEFAULT NULL REFERENCES plazas(id) ON UPDATE CASCADE ON DELETE SET NULL,
    locatorio_id INT DEFAULT NULL REFERENCES locatarios(id) ON UPDATE CASCADE ON DELETE SET NULL,
    comentarios TEXT DEFAULT NULL,
    calificacion NUMERIC DEFAULT NULL,
    created_at DATE DEFAULT NULL,
    updated_at DATE DEFAULT NULL
);



CREATE TABLE promociones(
    id SERIAL PRIMARY KEY,
    -- nombre TEXT DEFAULT NULL,
    -- producto_id INT[] DEFAULT NULL,
    plazas_id INT[] DEFAULT NULL,
    categorias_id INT[] DEFAULT NULL,
    imagen TEXT DEFAULT NULL,
    activo boolean DEFAULT FALSE,
    created_at DATE DEFAULT NULL,
    updated_at DATE DEFAULT NULL
);



CREATE TABLE favoritos(
    id SERIAL PRIMARY KEY,
    cliente_id INT DEFAULT NULL REFERENCES clientes(id) ON UPDATE CASCADE ON DELETE SET NULL,
    producto_locatario_id INT DEFAULT NULL REFERENCES productos_locatarios(id) ON UPDATE CASCADE ON DELETE SET NULL,
    producto_id INT DEFAULT NULL REFERENCES productos(id) ON UPDATE CASCADE ON DELETE SET NULL,
    created_at DATE DEFAULT NULL,
    updated_at DATE DEFAULT NULL
);


CREATE TABLE visitas_locatarios(
    id SERIAL PRIMARY KEY,
    locatario_id INT DEFAULT NULL REFERENCES locatarios(id) ON UPDATE CASCADE ON DELETE SET NULL,
    plaza_id INT DEFAULT NULL REFERENCES plazas(id) ON UPDATE CASCADE ON DELETE SET NULL,
    created_at DATE DEFAULT NULL,
    updated_at DATE DEFAULT NULL
);



-- =====================================================================================================
-- =====================================================================================================
-- =====================================================================================================



SELECT * FROM locatarios WHERE '(408)-783-5731' = ANY (numero_local);

SELECT * FROM promociones WHERE activo = true AND '12' = ANY (plazas_id) 

SELECT * FROM productos_locatarios L, productos P WHERE L.locatario_id = 538 AND '2' = ANY (P.categorias_id) 
