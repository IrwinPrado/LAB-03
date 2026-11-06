-- ============================================================
-- LAB-03: Privacidad, cumplimiento y gobierno de datos
-- Script: 02-finalidad.sql
-- Estudiante: Irwin Gabriel Martinez Prado
-- Descripción: Consulta y agrupación de información para Analítica
--              garantizando la separación de datos por finalidad.
-- ============================================================

-- 1. Consulta agregada por ciudad
-- Permite al área de analítica ver la distribución geográfica sin identificar clientes.
SELECT 
    ciudad, 
    COUNT(*) AS cantidad_clientes 
FROM clientes 
GROUP BY ciudad
ORDER BY cantidad_clientes DESC;

-- 2. Consulta agregada por rangos de edad
-- Agrupa las edades en categorías sin revelar la edad exacta de cada individuo.
SELECT 
    CASE
        WHEN edad < 18 THEN 'Menor de 18'
        WHEN edad BETWEEN 18 AND 29 THEN '18-29'
        WHEN edad BETWEEN 30 AND 44 THEN '30-44'
        WHEN edad BETWEEN 45 AND 59 THEN '45-59'
        ELSE '60 o más'
    END AS rango_edad, 
    COUNT(*) AS cantidad 
FROM clientes
GROUP BY 
    CASE
        WHEN edad < 18 THEN 'Menor de 18'
        WHEN edad BETWEEN 18 AND 29 THEN '18-29'
        WHEN edad BETWEEN 30 AND 44 THEN '30-44'
        WHEN edad BETWEEN 45 AND 59 THEN '45-59'
        ELSE '60 o más'
    END 
ORDER BY rango_edad;