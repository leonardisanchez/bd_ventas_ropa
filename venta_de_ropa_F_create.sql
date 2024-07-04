-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-07-04 14:52:33.752

-- tables
-- Table: clientes
CREATE TABLE clientes (
    dni char(8)  NOT NULL,
    nombre varchar(100)  NOT NULL,
    direccion varchar(100)  NOT NULL,
    distrito varchar(50)  NOT NULL,
    provincia varchar(50)  NOT NULL,
    producto_codigo varchar(20)  NOT NULL,
    producto_id_categorias int  NOT NULL,
    CONSTRAINT clientes_pk PRIMARY KEY (dni)
) COMMENT 'datos  del cliente';

-- Table: detalle_ventas
CREATE TABLE detalle_ventas (
    id int  NOT NULL,
    id_ventas int  NOT NULL,
    codigo_proiducto varchar(20)  NOT NULL,
    cantidad int  NOT NULL,
    precio_unidad decimal(10,5)  NOT NULL,
    ventas_id int  NOT NULL,
    CONSTRAINT detalle_ventas_pk PRIMARY KEY (id)
) COMMENT 'contiene los detallesde la tabla  venta';

-- Table: producto
CREATE TABLE producto (
    codigo varchar(20)  NOT NULL,
    nombre varchar(100)  NOT NULL,
    precio_actual decimal(10,5)  NOT NULL,
    stok int  NOT NULL,
    id_categorias int  NOT NULL,
    provedores_ruc char(11)  NOT NULL,
    CONSTRAINT producto_pk PRIMARY KEY (codigo,id_categorias)
) COMMENT 'datos del produnto';

-- Table: proveedores
CREATE TABLE proveedores (
    ruc char(11)  NOT NULL,
    nombre varchar(100)  NOT NULL,
    direccion varchar(150)  NOT NULL,
    telefono varchar(9)  NOT NULL,
    CONSTRAINT proveedores_pk PRIMARY KEY (ruc)
) COMMENT 'datos del proveedor';

-- Table: telefono_cliente
CREATE TABLE telefono_cliente (
    id int  NOT NULL,
    dni char(8)  NOT NULL,
    telefono varchar(9)  NOT NULL,
    clientes_dni char(8)  NOT NULL,
    CONSTRAINT telefono_cliente_pk PRIMARY KEY (id)
);

-- Table: ventas
CREATE TABLE ventas (
    id int  NOT NULL,
    fecha date  NOT NULL,
    dni_cliente char(9)  NOT NULL,
    monto_final decimal(10,5)  NOT NULL,
    producto_codigo varchar(20)  NOT NULL,
    producto_id_categorias int  NOT NULL,
    CONSTRAINT ventas_pk PRIMARY KEY (id)
) COMMENT '  contien los datos  de la venta';

-- foreign keys
-- Reference: clientes_producto (table: clientes)
ALTER TABLE clientes ADD CONSTRAINT clientes_producto FOREIGN KEY clientes_producto (producto_codigo,producto_id_categorias)
    REFERENCES producto (codigo,id_categorias);

-- Reference: detalle_ventas_ventas (table: detalle_ventas)
ALTER TABLE detalle_ventas ADD CONSTRAINT detalle_ventas_ventas FOREIGN KEY detalle_ventas_ventas (ventas_id)
    REFERENCES ventas (id);

-- Reference: producto_provedores (table: producto)
ALTER TABLE producto ADD CONSTRAINT producto_provedores FOREIGN KEY producto_provedores (provedores_ruc)
    REFERENCES proveedores (ruc);

-- Reference: telefono_cliente_clientes (table: telefono_cliente)
ALTER TABLE telefono_cliente ADD CONSTRAINT telefono_cliente_clientes FOREIGN KEY telefono_cliente_clientes (clientes_dni)
    REFERENCES clientes (dni);

-- Reference: ventas_producto (table: ventas)
ALTER TABLE ventas ADD CONSTRAINT ventas_producto FOREIGN KEY ventas_producto (producto_codigo,producto_id_categorias)
    REFERENCES producto (codigo,id_categorias);

-- End of file.

