Archivo: modulo2_unidad1_diseno.sql

1. Definición de la tabla 'clientes'
CREATE TABLE clientes2 (
    id_cliente INT NOT NULL IDENTITY (1,1) PRIMARY KEY,          -- INT: Tipo entero ideal para identificadores únicos, IDENTITY: para ordenarlos, PRIMARY KEY: valor único e irreplazable.
    nombre VARCHAR(100) NOT NULL,                                -- VARCHAR(100): Permite texto variable hasta 100 caracteres.
    perfil_bio VARCHAR(MAX),                                     -- VARCHAR(MAX): Almacena texto largo para biografías o notas sin límite corto.
    fecha_registro DATE                                          -- DATE: Guarda exclusivamente la fecha (año-mes-día) sin hora.
);

CREATE TABLE productos2 (
    id_producto INT NOT NULL IDENTITY (1,1) PRIMARY KEY,         -- INT: Tipo entero único para cada producto.
    descripcion VARCHAR(255) NOT NULL,                            -- VARCHAR(255): Espacio de texto adecuado para describir el producto.
    precio DECIMAL(10, 2) NOT NULL,                               -- DECIMAL(10,2): Exactitud exacta para dinero (hasta 10 dígitos total, 2 decimales).
    esta_activo BIT DEFAULT 1                                      -- BIT: Representa un valor booleano en SQL Server (1 = Activo / 0 = Inactivo).
);
