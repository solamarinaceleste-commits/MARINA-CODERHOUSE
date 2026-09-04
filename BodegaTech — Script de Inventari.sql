-- BodegaTech — Script de Inventario
-- Autor: Marina
-- Fecha: 2026-09-03

-- ── SECCIÓN DDL ──────────────────────────

-- Paso 1: Eliminar la tabla si ya existe para poder re-ejecutar el script sin errores

DROP TABLE IF EXISTS inventario;

-- Paso 2: Creación de la tabla inventario

CREATE TABLE Inventario (
id_producto INT NOT NULL PRIMARY KEY,    -- INT: Identificador único entero para la clave primaria
nombre_producto VARCHAR(100) NOT NULL,
categoria VARCHAR(50) NOT NULL,
precio_unitario DECIMAL(10,2) NOT NULL,    -- DECIMAL(10,2): Evita problemas de redondeo/imprecisión monetaria que causaría FLOAT
stock_actual INT NOT NULL,
stock_minimo INT NOT NULL,
fecha_ingreso DATE,                        -- DATE: Guarda exactamente el año, mes y día sin incluir la hora
activo BIT DEFAULT (1),                    -- BIT: Utilizado en SQL Server para representar valores booleanos (1 = Activo, 0 = Inactivo)
);

-- ── SECCIÓN DML ──────────────────────────

-- Paso 3: Carga inicial de datos (10 productos)

INSERT INTO Inventario (id_producto, nombre_producto, categoria, precio_unitario, stock_actual, stock_minimo, fecha_ingreso, activo) 
VALUES 
(1, 'Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1),
(2, 'Mouse Inalámbrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
(3, 'Monitor 4K 27"', 'Computación', 450.00, 12, 2, '2024-01-15', 1),
(4, 'Teclado Mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
(5, 'Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1),
(6, 'Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
(7, 'Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
(8, 'Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
(9, 'SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
(10, 'Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);

-- Paso 4: Registrar las ventas del día actualizando stock_actual
-- Laptop Pro 15 (id: 1) vendió 3 unidades (15 - 3 = 12)

UPDATE Inventario 
SET stock_actual = stock_actual - 3
WHERE id_producto = 1;

-- Mouse Inalámbrico (id: 2) vendió 12 unidades (80 - 12 = 68)

UPDATE Inventario
SET stock_actual = stock_actual - 12
WHERE id_producto = 2;

-- Auriculares BT Pro (id: 6) vendió 5 unidades (35 - 5 = 30)

UPDATE Inventario
SET stock_actual = stock_actual - 6
WHERE id_producto = 6;

-- Paso 5: Marcar Webcam HD 1080p (id: 8) como inactiva (descontinuada)

UPDATE Inventario
SET activo = 0
WHERE id_producto = 8;

-- Paso 6: SELECT de validación para confirmar que los datos se actualizaron correctamente

SELECT * FROM Inventario;









