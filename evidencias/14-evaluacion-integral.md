# Evidencia 14: Evaluación Integral de Riesgos de Privacidad

**Estudiante:** Irwin Gabriel Martinez Prado  
**Materia:** Gestión de Seguridad y Desempeño de Bases de Datos  
**Práctica:** LAB-03 — Privacidad, cumplimiento y gobierno de los datos  

---

## 1. Objetivo
Evaluar un escenario corporativo integral e identificar 10 vulnerabilidades de privacidad, relacionando cada problema con el principio afectado, el riesgo latente y el control propuesto.

---

## 2. Matriz de Evaluación de Riesgos

| # | Problema Identificado | Principio Afectado | Riesgo Asociado | Control Propuesto |
| :-: | :--- | :--- | :--- | :--- |
| **1** | Analistas consultan directamente la tabla `clientes`. | Mínimo Privilegio / Separación de Finalidad | Exposición de datos personales identificables a personal no autorizado. | Crear vistas agregadas (`v_analitica_clientes`) y limitar permisos a la tabla base. |
| **2** | Presencia de campos identificables en consultas analíticas. | Minimización de Datos | Identificación directa de personas en reportes estadísticos. | Seudonimización o agregación por grupos (rangos de edad, municipios). |
| **3** | Conservación de datos por 12 años sin política documentada. | Limitación del Plazo de Conservación | Retención ilegal de datos inactivos y sanciones administrativas. | Definir e implementar una Política de Retención y purga automatizada. |
| **4** | Desarrolladores reciben copias completas con datos reales. | Privacidad por Diseño / Confidencialidad | Filtración de datos de producción desde entornos de desarrollo no seguros. | Anonimización y enmascaramiento estricto de datos (*Data Masking*) en respaldos de pruebas. |
| **5** | Uso de correos para campañas de marketing sin consentimiento. | Limitación de Finalidad / Consentimiento | Incumplimiento de la LFPDPPP y molestia al cliente (Spam). | Implementar bandera de consentimiento (`acepta_publicidad`) y filtro por vistas. |
| **6** | Falta de documentación sobre la finalidad de cada dato. | Transparencia y Gobierno de Datos | Incapacidad para auditar el uso adecuado de los datos y responder a autoridades. | Elaborar e implementar un Catálogo de Datos y Matriz de Gobierno de Datos. |
| **7** | Almacenamiento de RFC en texto claro en la tabla general. | Confidencialidad / Protección Reforzada | Extracción de datos fiscales sensibles en caso de fuga de información. | Aplicar cifrado simétrico a nivel de columna con `pgcrypto` (`pgp_sym_encrypt`). |
| **8** | Inexistencia de registros de auditoría sobre consultas de analítica. | Trazabilidad y Responsabilidad Rendida (*Accountability*) | Imposibilidad de detectar quién consultó qué registros en caso de fuga interna. | Configurar auditoría de consultas en PostgreSQL (`pgaudit`). |
| **9** | Todos los empleados de analítica tienen el mismo nivel de acceso. | Control de Acceso Funcional | Ausencia de segregación de funciones e incremento del riesgo interno. | Definir roles específicos de PostgreSQL con permisos granulares (RBAC). |
| **10** | Sin procedimiento técnico para atender solicitudes ARCO. | Atención a Derechos de Titulares | Sanciones legales por no responder a solicitudes de cancelación o rectificación. | Crear scripts y procedimientos almacenados seguros para ejecutar solicitudes ARCO. |

---

## 3. Conclusión
El escenario analizado muestra múltiples fallas en la cadena de custodia de datos. Corregir estas deficiencias requiere combinar controles técnicos (vistas, cifrado, enmascaramiento) con controles administrativos (políticas de retención y consentimiento).