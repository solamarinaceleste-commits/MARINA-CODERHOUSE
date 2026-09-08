-- ══════════════════════════════════════════
-- RetailPro — Pre-entrega: Consultas SQL de Negocio
-- Autor: Marina
-- Fecha: 2026-09-07
-- Base de Datos: Ventas_Tech_DB
-- ══════════════════════════════════════════

USE Ventas_Tech_DB;

-- ──────────────────────────────────────────
-- Consulta 1 — Resumen ejecutivo mensual
-- ──────────────────────────────────────────
-- Muestra el total facturado, cantidad de pedidos y el ticket promedio agrupado por mes.

SELECT 
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

-- ──────────────────────────────────────────
-- Consulta 2 — Ranking de productos
-- ──────────────────────────────────────────
-- Muestra el Top 5 de productos por total facturado y las unidades vendidas.

SELECT TOP 5 (id_producto),
SUM(cantidad) AS unidades_vendidas, 
SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas 
GROUP BY id_producto
ORDER BY total_facturado DESC;

-- ──────────────────────────────────────────
-- Consulta 3 — Clientes recurrentes
-- ──────────────────────────────────────────
-- Identifica clientes con más de un pedido, mostrando la cantidad de compras y el gasto total.

SELECT id_cliente,
COUNT (*) AS cantidad_pedidos,
SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;

-- ──────────────────────────────────────────
-- Consulta 4 — Meses por encima/por debajo del promedio
-- ──────────────────────────────────────────
-- Evalúa el rendimiento de cada mes comparándolo contra el promedio mensual general.

-- Paso 1: Calculamos el promedio general para conocer el número de corte

SELECT 
AVG(cantidad * precio_unitario) AS promedio_general
FROM ventas;

SELECT 
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    CASE 
        WHEN SUM(cantidad * precio_unitario) > 644.4
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS rendimiento_vs_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

- ══════════════════════════════════════════
-- BLOQUE DE CIERRE: HALLAZGOS DE NEGOCIO
-- ══════════════════════════════════════════
/*
HALLAZGOS CLAVE PARA EL EQUIPO COMERCIAL:

1. Concentración de Ingresos en Productos Top: 
   El id_producto 1 lidera las ventas representando la mayor parte del total facturado, lo que demuestra una alta dependencia comercial de pocos productos estrella.

2. Fidelidad de Clientes Recurrentes: 
   Un grupo reducido de clientes (id_cliente recurrentes) realiza múltiples pedidos y genera la mayor parte del flujo de caja, lo que justifica lanzar un programa de fidelización.

3. Estacionalidad Mensual: 
   Se observa una variación clara en los meses evaluados, donde el rendimiento pasa de estar 'Por encima' en los meses de alta demanda inicial a 'Por debajo' en el período siguiente.
*/