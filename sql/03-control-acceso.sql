-- ============================================================
-- LAB-03: Privacidad, cumplimiento y gobierno de datos
-- Script: 03-control-acceso.sql
-- Estudiante: Irwin Gabriel Martinez Prado
-- Descripción: Control de acceso basado en la finalidad mediante vistas y roles,
--              y simulación del ejercicio del Derecho de Rectificación (ARCO).
-- ============================================================

-- 1. Crear el rol de base de datos para el área de analítica
DROP ROLE IF EXISTS analista;
CREATE ROLE analista NOLOGIN;

-- 2. Crear una vista que limite el acceso a datos directamente identificables
-- La vista solo expone la ciudad y el rango de edad, protegiendo nombre, correo, teléfono y RFC.
CREATE OR REPLACE VIEW v_analitica_clientes AS 
SELECT 
    ciudad, 
    CASE
        WHEN edad < 18 THEN 'Menor de 18'
        WHEN edad BETWEEN 18 AND 29 THEN '18-29'
        WHEN edad BETWEEN 30 AND 44 THEN '30-44'
        WHEN edad BETWEEN 45 AND 59 THEN '45-59'
        ELSE '60 o más' 
    END AS rango_edad 
FROM clientes;

-- 3. Otorgar permisos únicamente sobre la vista y NO sobre la tabla directa 'clientes'
GRANT USAGE ON SCHEMA public TO analista;
GRANT SELECT ON v_analitica_clientes TO analista;

-- 4. Verificación de los privilegios asignados al rol analista
SELECT grantee, table_name, privilege_type 
FROM information_schema.role_table_grants
WHERE grantee = 'analista';

-- 5. Simulación de solicitud ARCO: Derecho de Rectificación (Actividad 7)
-- Solicitud del cliente (id = 1) para corregir su correo electrónico registrado
UPDATE clientes 
SET correo = 'nuevo-correo@example.com' 
WHERE id = 1;

-- Verificación del registro rectificado
SELECT id, nombre, correo FROM clientes WHERE id = 1;