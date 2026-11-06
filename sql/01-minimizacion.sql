-- ============================================================
-- LAB-03: Privacidad, cumplimiento y gobierno de datos
-- Script: 01-minimizacion.sql
-- Estudiante: Irwin Gabriel Martinez Prado
-- Descripción: Creación de tabla base de clientes y aplicación del
--              principio de minimización de datos para Soporte.
-- ============================================================

-- 1. Crear tabla principal de clientes si no existe
CREATE TABLE IF NOT EXISTS clientes (
    id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    correo VARCHAR(150) NOT NULL,
    telefono VARCHAR(20),
    rfc VARCHAR(13),
    edad INTEGER,
    ciudad VARCHAR(80),
    codigo_postal VARCHAR(10),
    fecha_alta DATE DEFAULT CURRENT_DATE
);

-- Insertar registros iniciales si la tabla está vacía
INSERT INTO clientes (nombre, correo, telefono, rfc, edad, ciudad, codigo_postal)
SELECT 'Ana López', 'ana@example.com', '6671234567', 'LOPA900101ABC', 28, 'Culiacán', '80000'
WHERE NOT EXISTS (SELECT 1 FROM clientes WHERE correo = 'ana@example.com');

INSERT INTO clientes (nombre, correo, telefono, rfc, edad, ciudad, codigo_postal)
SELECT 'Carlos Sánchez', 'carlos@example.com', '6679876543', 'SAHC850512XYZ', 41, 'Mazatlán', '82000'
WHERE NOT EXISTS (SELECT 1 FROM clientes WHERE correo = 'carlos@example.com');

INSERT INTO clientes (nombre, correo, telefono, rfc, edad, ciudad, codigo_postal)
SELECT 'Eliud Gómez', 'eliud@example.com', '6685554433', 'GOME950320DEF', 22, 'Los Mochis', '81200'
WHERE NOT EXISTS (SELECT 1 FROM clientes WHERE correo = 'eliud@example.com');

-- 2. Crear tabla minimizada para atención a clientes (soporte)
DROP TABLE IF EXISTS clientes_soporte;
CREATE TABLE clientes_soporte (
    id BIGINT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    correo VARCHAR(150) NOT NULL,
    telefono VARCHAR(20)
);

-- Poblado de datos minimizados a partir de la tabla principal
INSERT INTO clientes_soporte (id, nombre, correo, telefono)
SELECT id, nombre, correo, telefono FROM clientes;

-- Verificación de la tabla minimizada
SELECT * FROM clientes_soporte;