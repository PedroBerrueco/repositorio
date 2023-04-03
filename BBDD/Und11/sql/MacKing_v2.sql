-- ------------------------------------------------
-- Base de datos MacKing                        
-- ------------------------------------------------   
-- Gestión de un establecimiento de comida rápida  
-- Creada con fines educativos
-- Enrique Arnaiz, 2022
-- ------------------------------------------------  
-- Versión 2:
-- Se añaden campos a la tabla "categoria" para dar profundidad a las consultas reflexivas
-- ------------------------------------------------                           


CREATE DATABASE MacKing;

USE MacKing;

CREATE TABLE CATEGORIA (
Categoria VARCHAR(20),
Texto_marketing VARCHAR(50) COMMENT 'Texto para promocionar los productos de la categoría',
Temp_almacenado INTEGER COMMENT 'Temperatura a la que hay que almacenar los productos de la categoría, en grados centígrados',
Categoria_padre VARCHAR(20),
PRIMARY KEY (Categoria),
FOREIGN KEY (Categoria_padre) REFERENCES CATEGORIA (Categoria) ON UPDATE CASCADE ON DELETE CASCADE
) Engine = innodb;

CREATE TABLE PROVEEDOR (
Cif VARCHAR(9),
Nombre VARCHAR(40),
PRIMARY KEY (Cif)
) Engine = innodb;

CREATE TABLE PRODUCTO (
Cod_producto VARCHAR(7),
Nombre VARCHAR(30),
Hora_desde TIME DEFAULT '00:00:00',
Hora_hasta TIME DEFAULT '23:59:59',
Precio_proveedor DECIMAL(4,2),
Precio_venta DECIMAL(4,2),
Stock INTEGER DEFAULT 0,
Peso DECIMAL(5,2) COMMENT 'Peso neto en gramos',
Vegano BOOLEAN,
Categoria VARCHAR(20),
Cif_proveedor VARCHAR(9),
PRIMARY KEY (Cod_producto),
FOREIGN KEY (Categoria) REFERENCES CATEGORIA(categoria) ON UPDATE CASCADE ON DELETE SET NULL,
FOREIGN KEY (Cif_proveedor) REFERENCES PROVEEDOR (Cif)
) Engine = innodb, COMMENT 'Los productos pueden ser principales o extras';

CREATE TABLE SUSTITUIBLE (
Cod_prod_quita VARCHAR(7),
Cod_prod_pone VARCHAR(7),
Sobrecoste DECIMAL(4,2) COMMENT 'Sobrecoste aplicable',
PRIMARY KEY (Cod_prod_quita, Cod_prod_pone),
FOREIGN KEY (Cod_prod_quita) REFERENCES PRODUCTO (Cod_producto) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (Cod_prod_pone) REFERENCES PRODUCTO (Cod_producto) ON UPDATE CASCADE ON DELETE CASCADE
) Engine = innodb, COMMENT 'En esta tabla se almacenan los productos que pueden sustituirse por otros en los menús.';

CREATE TABLE PRINCIPAL (
Cod_producto VARCHAR(7),
Nutriscore CHAR NOT NULL,
PRIMARY KEY (Cod_producto),
FOREIGN KEY (Cod_producto) REFERENCES PRODUCTO (Cod_producto) ON UPDATE CASCADE ON DELETE RESTRICT 
) Engine = innodb, COMMENT 'Por seguridad para borrar un producto principal primero hay que borrarlo en esta tabla';

CREATE TABLE EXTRA (
Cod_producto VARCHAR(7),
Autoservicio BOOLEAN,
PRIMARY KEY (Cod_producto),
FOREIGN KEY (Cod_producto) REFERENCES PRODUCTO (Cod_producto) ON UPDATE CASCADE ON DELETE CASCADE
) Engine = innodb;

CREATE TABLE REGALO (
Cod_regalo INTEGER AUTO_INCREMENT,
Nombre VARCHAR(20),
Color VARCHAR(10) DEFAULT 'NA',
Edad_minima INTEGER DEFAULT 18,
Stock INTEGER,
PRIMARY KEY (Cod_regalo)
) Engine = innodb;

CREATE TABLE MENU (
Nombre VARCHAR(20),
Precio DECIMAL(4,2),
Cod_regalo INTEGER,
PRIMARY KEY (Nombre),
FOREIGN KEY (Cod_regalo) REFERENCES REGALO (Cod_regalo) ON UPDATE RESTRICT ON DELETE RESTRICT
) Engine = innodb;

CREATE TABLE PROMOCION (
Nombre_menu VARCHAR(20),
Num_promo INTEGER,
Valido_hasta DATETIME,
Porc_descuento INTEGER,
PRIMARY KEY (Nombre_menu, Num_promo),
FOREIGN KEY (Nombre_menu) REFERENCES MENU (Nombre) ON UPDATE CASCADE ON DELETE CASCADE
) Engine = innodb;

CREATE TABLE MENU_PRODUCTO (
Nombre_menu VARCHAR(20),
Cod_producto VARCHAR(7),
Unidades INTEGER,
PRIMARY KEY (Nombre_menu, Cod_producto),
FOREIGN KEY (Nombre_menu) REFERENCES MENU (Nombre) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (Cod_producto) REFERENCES PRODUCTO (Cod_producto) ON UPDATE CASCADE ON DELETE RESTRICT
) Engine = innodb;

-- Datos ficticios
INSERT INTO CATEGORIA (Categoria, Texto_marketing, Temp_almacenado, Categoria_padre) VALUES ('Hamburguesas', 'Prueba nuestra deliciosas hamburguesas', -18, null);
INSERT INTO CATEGORIA (Categoria, Texto_marketing, Temp_almacenado, Categoria_padre)  VALUES ('Bebidas', 'Sacia tu sed con nuestras bebidas', 25, null);
INSERT INTO CATEGORIA (Categoria, Texto_marketing, Temp_almacenado, Categoria_padre)  VALUES ('Frías', '¡Refressscantes!', 25, 'Bebidas');
INSERT INTO CATEGORIA (Categoria, Texto_marketing, Temp_almacenado, Categoria_padre)  VALUES ('Calientes', 'Reconfortantes', 25, 'Bebidas');
INSERT INTO CATEGORIA (Categoria, Texto_marketing, Temp_almacenado, Categoria_padre)  VALUES ('Refrescos', 'Deliciosos y refrescantes', 25, 'Frías');
INSERT INTO CATEGORIA (Categoria, Texto_marketing, Temp_almacenado, Categoria_padre)  VALUES ('Cervezas', 'Fabricada por los mejores artesanos', 25, 'Frías');
INSERT INTO CATEGORIA (Categoria, Texto_marketing, Temp_almacenado, Categoria_padre)  VALUES ('Cafés', 'Tómate un descanso, tómate un café', 25, 'Calientes');
INSERT INTO CATEGORIA (Categoria, Texto_marketing, Temp_almacenado, Categoria_padre) VALUES ('Condimentos', 'Dale sabor a la vida', 25, null);
INSERT INTO CATEGORIA (Categoria, Texto_marketing, Temp_almacenado, Categoria_padre)  VALUES ('Salsas', 'Deliciosas salsas', 20, 'Condimentos');
INSERT INTO CATEGORIA (Categoria, Texto_marketing, Temp_almacenado, Categoria_padre)  VALUES ('Acompañantes', 'Completa tu comida', -18, null);
INSERT INTO CATEGORIA (Categoria, Texto_marketing, Temp_almacenado, Categoria_padre)  VALUES ('Postres', 'Endulza tu día', -25, null);

INSERT INTO PROVEEDOR (Cif, Nombre) VALUES ('A12326787', 'Carnes y preparados');
INSERT INTO PROVEEDOR (Cif, Nombre) VALUES ('B45662345', 'Chocolaterias Antonio');
INSERT INTO PROVEEDOR (Cif, Nombre) VALUES ('A34364367', 'Productos monodosis, s.a.');
INSERT INTO PROVEEDOR (Cif, Nombre) VALUES ('A82364522', 'Congelados Manuel');

INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('HAM-001', 'Hamburguesa sencilla', 0.5, 2, 100, 100, False, 'Hamburguesas', 'A12326787');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('HAM-002', 'Hamburguesa doble', 0.8, 3.5, 150, 120, False, 'Hamburguesas', 'A12326787');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('HAM-003', 'Mc King', 1.5, 6, 500, 200, False, 'Hamburguesas', 'A12326787');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('HAM-004', 'Mc Bacon', 1.3, 5.5, 420, 180, False, 'Hamburguesas', 'A12326787');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('HAM-005', 'Mc Vegana', 2.5, 6, 80, 90, TRUE, 'Hamburguesas', 'A12326787');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('FRI-001', 'Patatas fritas', 0.3 , 2, 600, 150, FALSE, 'Acompañantes', 'A82364522');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('FRI-002', 'Patatas gajo', 0.4 , 3, 300, 200, FALSE, 'Acompañantes', 'A82364522');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('FRI-003', 'Patatas fritas XL', 0.5 , 3.25, 300, 220, FALSE, 'Acompañantes', 'A82364522');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('HOR-001', 'Patata al horno', 0.85 , 3, 60, 180, TRUE, 'Acompañantes', 'A82364522');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('SAL-001', 'Sobre de keptchup', 0.01 , 0, 1000, 10, TRUE, 'Salsas', 'A34364367');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('SAL-002', 'Sobre de mostaza', 0.01 , 0, 800, 10, TRUE, 'Salsas', 'A34364367');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('SAL-003', 'Sobre de picante', 0.01 , 0, 0, 10, TRUE, 'Salsas', 'A34364367');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('SAL-004', 'Tarrina de salsa de ajo', 0.1 , 0.5, 400, 10, TRUE, 'Salsas', 'A34364367');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('CON-001', 'Sobre de azúcar', 0.1 , 0.1, 870, 10, TRUE, 'Condimentos', 'A34364367');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('CON-002', 'Sobre de sal', 0.1 , 0, 900, 10, TRUE, 'Condimentos', 'A34364367');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('HEL-001', 'Tarrina de helado', 0.5 , 1, 0, 50.5, TRUE, 'Postres', 'B45662345');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('FRU-001', 'Plátano', 0.05 , 1, 10, 150, TRUE, 'Postres', 'A82364522');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('FRU-002', 'Manzana', 0.05 , 1, 0, 150, TRUE, 'Postres', 'A82364522');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('BEB-001', 'Refresco de cola', 0.1, 1.5, 1500, 330, TRUE, 'Refrescos', 'A82364522');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('BEB-002', 'Refresco de naranja', 0.1, 1.5, 1200, 330, TRUE, 'Refrescos', 'A82364522');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Hora_desde, Hora_hasta, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('BEB-003', 'Cerveza', '11:00:00', '20:00:00', 0.3, 2, 300, 330, TRUE, 'Cervezas', 'A82364522');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('BEB-004', 'Refresco de cola grande', 0.2, 3, 500, 500, TRUE, 'Refrescos', 'A82364522');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('BEB-005', 'Refresco de naranja grande', 0.2, 3, 600, 500, TRUE, 'Refrescos', 'A82364522');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Hora_desde, Hora_hasta, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('BEB-006', 'Café con leche', '08:00:00', '11:00:00', 0.15, 2, 0, 50, TRUE, 'Cafés', 'A82364522');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('BEB-007', 'Té verde', 0.25, 2, 100, 50, TRUE, 'Frías', 'A82364522');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('BEB-008', 'Té verde', 0.25, 2, 200, 50, TRUE, 'Calientes', 'A82364522');
INSERT INTO PRODUCTO (Cod_producto, Nombre, Precio_proveedor, Precio_venta, Stock, Peso, Vegano, Categoria, Cif_proveedor)
       VALUES ('BEB-009', 'Agua del grifo', 0, 0, 9999, 100, TRUE, 'Bebidas', null);

INSERT INTO SUSTITUIBLE (Cod_prod_quita, Cod_prod_pone, Sobrecoste) VALUES ('BEB-001', 'BEB-002', 0);
INSERT INTO SUSTITUIBLE (Cod_prod_quita, Cod_prod_pone, Sobrecoste) VALUES ('BEB-002', 'BEB-001', 0);
INSERT INTO SUSTITUIBLE (Cod_prod_quita, Cod_prod_pone, Sobrecoste) VALUES ('BEB-001', 'BEB-004', 0.5);
INSERT INTO SUSTITUIBLE (Cod_prod_quita, Cod_prod_pone, Sobrecoste) VALUES ('BEB-002', 'BEB-005', 0.5);
INSERT INTO SUSTITUIBLE (Cod_prod_quita, Cod_prod_pone, Sobrecoste) VALUES ('FRI-001', 'FRI-002', 0.75);
INSERT INTO SUSTITUIBLE (Cod_prod_quita, Cod_prod_pone, Sobrecoste) VALUES ('FRI-002', 'FRI-001', 0);
INSERT INTO SUSTITUIBLE (Cod_prod_quita, Cod_prod_pone, Sobrecoste) VALUES ('FRI-001', 'FRI-003', 1);
INSERT INTO SUSTITUIBLE (Cod_prod_quita, Cod_prod_pone, Sobrecoste) VALUES ('FRU-001', 'FRU-002', 0);
INSERT INTO SUSTITUIBLE (Cod_prod_quita, Cod_prod_pone, Sobrecoste) VALUES ('FRU-002', 'FRU-001', 0);
INSERT INTO SUSTITUIBLE (Cod_prod_quita, Cod_prod_pone, Sobrecoste) VALUES ('BEB-001', 'BEB-003', 1.5);
INSERT INTO SUSTITUIBLE (Cod_prod_quita, Cod_prod_pone, Sobrecoste) VALUES ('BEB-002', 'BEB-003', 1.5);
INSERT INTO SUSTITUIBLE (Cod_prod_quita, Cod_prod_pone, Sobrecoste) VALUES ('BEB-007', 'BEB-008', 0);
INSERT INTO SUSTITUIBLE (Cod_prod_quita, Cod_prod_pone, Sobrecoste) VALUES ('BEB-008', 'BEB-007', 0);

INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('HAM-001', 'C');
INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('HAM-002', 'D');
INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('HAM-003', 'C');
INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('HAM-004', 'D');
INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('HAM-005', 'A');
INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('FRI-001', 'D');
INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('FRI-002', 'C');
INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('FRI-003', 'D');
INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('HOR-001', 'A');      
INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('HEL-001', 'C');       
INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('FRU-001', 'A');       
INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('FRU-002', 'A');  
INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('BEB-001', 'D');  
INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('BEB-002', 'D');  
INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('BEB-003', 'B');  
INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('BEB-004', 'C');  
INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('BEB-005', 'C');  
INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('BEB-006', 'C');  
INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('BEB-007', 'A');  
INSERT INTO PRINCIPAL (Cod_producto, Nutriscore) VALUES ('BEB-008', 'A');  

INSERT INTO EXTRA (Cod_producto, Autoservicio) VALUES ('SAL-001', True);  
INSERT INTO EXTRA (Cod_producto, Autoservicio) VALUES ('SAL-002', False);  
INSERT INTO EXTRA (Cod_producto, Autoservicio) VALUES ('SAL-003', False);
INSERT INTO EXTRA (Cod_producto, Autoservicio) VALUES ('SAL-004', False);  
INSERT INTO EXTRA (Cod_producto, Autoservicio) VALUES ('CON-001', False);       
INSERT INTO EXTRA (Cod_producto, Autoservicio) VALUES ('CON-002', True); 

INSERT INTO Regalo (Nombre, Color, Edad_minima, Stock) VALUES ('Muñeco perro', 'Azul', 3, 30); 
INSERT INTO Regalo (Nombre, Color, Edad_minima, Stock) VALUES ('Muñeco gato', 'Rojo', 3, 20); 
INSERT INTO Regalo (Nombre, Color, Stock) VALUES ('Vaso de cristal', 'Azul', 40); 
INSERT INTO Regalo (Nombre, Color, Stock) VALUES ('Vaso de cristal', 'Rojo', 20); 
INSERT INTO Regalo (Nombre, Color, Stock) VALUES ('Vaso de cristal', 'Amarillo', 63); 
INSERT INTO Regalo (Nombre, Edad_minima, Stock) VALUES ('Cromo', 10, 9); 
INSERT INTO Regalo (Nombre, Edad_minima, Stock) VALUES ('Álbum cromos', 10, 5); 

INSERT INTO Menu (Nombre, Precio, Cod_regalo) VALUES ('Happy kid blue', 6, 1); 
INSERT INTO Menu (Nombre, Precio, Cod_regalo) VALUES ('Happy kid red', 6, 6); 
INSERT INTO Menu (Nombre, Precio, Cod_regalo) VALUES ('Mc King', 9.99, 4); 
INSERT INTO Menu (Nombre, Precio, Cod_regalo) VALUES ('Mc Bacon', 8.99, 5); 
INSERT INTO Menu (Nombre, Precio, Cod_regalo) VALUES ('Mc Royal', 10.99, null); 
INSERT INTO Menu (Nombre, Precio, Cod_regalo) VALUES ('Mc Desayuno 1', 5, null); 
INSERT INTO Menu (Nombre, Precio, Cod_regalo) VALUES ('Mc Desayuno 2', 5, null); 
INSERT INTO Menu (Nombre, Precio, Cod_regalo) VALUES ('King Pika', 10.99, null); 
INSERT INTO Menu (Nombre, Precio, Cod_regalo) VALUES ('Combo Familiar', 28.99, 7); 

INSERT INTO Promocion (Nombre_menu, Num_promo, Valido_hasta, Porc_descuento) VALUES ('Mc King', 1, '2020-01-01 00:00:00', 10); 
INSERT INTO Promocion (Nombre_menu, Num_promo, Valido_hasta, Porc_descuento) VALUES ('Mc King', 2, '2021-01-01 00:00:00', 10); 
INSERT INTO Promocion (Nombre_menu, Num_promo, Valido_hasta, Porc_descuento) VALUES ('Mc King', 3, '2022-01-01 00:00:00', 5); 
INSERT INTO Promocion (Nombre_menu, Num_promo, Valido_hasta, Porc_descuento) VALUES ('Mc King', 4, '9999-01-01 00:00:00', 5); 
INSERT INTO Promocion (Nombre_menu, Num_promo, Valido_hasta, Porc_descuento) VALUES ('King Pika', 1, '2021-01-01 23:59:59', 10); 
INSERT INTO Promocion (Nombre_menu, Num_promo, Valido_hasta, Porc_descuento) VALUES ('King Pika', 2, '2030-01-01 23:59:59', 15);

INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Happy kid blue', 'HAM-001', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Happy kid blue', 'BEB-002', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Happy kid blue', 'FRU-002', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Happy kid red', 'HAM-001', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Happy kid red', 'BEB-002', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Happy kid red', 'FRU-001', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Mc King', 'HAM-003', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Mc King', 'FRI-001', 2);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Mc King', 'SAL-001', 2);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Mc King', 'BEB-004', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Mc Bacon', 'HAM-004', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Mc Bacon', 'FRI-002', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Mc Bacon', 'SAL-001', 2);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Mc Royal', 'HAM-002', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Mc Royal', 'HOR-001', 2);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Mc Royal', 'SAL-001', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Mc Royal', 'SAL-002', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Mc Royal', 'HEL-001', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Mc Royal', 'BEB-004', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Mc Desayuno 1', 'HAM-001', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Mc Desayuno 1', 'BEB-006', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Mc Desayuno 2', 'HAM-001', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Mc Desayuno 2', 'BEB-008', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('King Pika', 'HAM-002', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('King Pika', 'FRI-001', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Happy kid blue', 'BEB-001', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('King Pika', 'SAL-003', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Combo familiar', 'HAM-001', 2);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Combo familiar', 'BEB-002', 2);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Combo familiar', 'FRU-002', 2);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Combo familiar', 'HAM-003', 2);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Combo familiar', 'BEB-004', 2);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Combo familiar', 'FRI-002', 2);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Combo familiar', 'HEL-001', 1);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Combo familiar', 'SAL-001', 6);
INSERT INTO Menu_producto (Nombre_menu, Cod_producto, Unidades) VALUES ('Combo familiar', 'SAL-004', 2);
