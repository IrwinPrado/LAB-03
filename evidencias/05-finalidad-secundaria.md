# Evidencia 05: Análisis de Finalidad Secundaria

**Estudiante:** Irwin Gabriel Martinez Prado  
**Materia:** Gestión de Seguridad y Desempeño de Bases de Datos  
**Práctica:** LAB-03 — Privacidad, cumplimiento y gobierno de los datos  

---

## 1. Objetivo
Evaluar las implicaciones legales y técnicas de utilizar la información de clientes para una finalidad secundaria no contemplada inicialmente: *"Enviar promociones personalizadas basadas en edad, ciudad y comportamiento de compra"*.

---

## 2. Análisis del Escenario

### 1. ¿El hecho de que la organización ya tenga los datos significa automáticamente que puede utilizarlos para cualquier finalidad?
**No.** El principio de **limitación de finalidad** (y la LFPDPPP en México) establece que los datos personales solo deben ser tratados para los propósitos expresamente informados al titular en el Aviso de Privacidad inicial. Poseer los datos en la base de datos no otorga derecho ilimitado sobre su uso.

### 2. ¿Qué preguntas debería realizar la organización antes de implementar este tratamiento?
* ¿La finalidad promocional fue informada expresamente en el Aviso de Privacidad inicial?
* ¿Se requiere un consentimiento explícito (opt-in) o el cliente puede manifestar su negativa (opt-out)?
* ¿El tratamiento promocional afecta derechos fundamentales del cliente?
* ¿Existen mecanismos para registrar la oposición (derecho O de ARCO) del cliente a recibir promociones?

### 3. ¿Qué datos serían realmente necesarios?
Para fines de marketing solo se requiere: `correo` (o `telefono`), `ciudad` y la segmentación por perfil. No se requiere acceso al `rfc` ni a la identificación exacta del historial de compras completo.

### 4. ¿Necesitaría el área de marketing acceso directo a la tabla `clientes`?
**No.** Dar acceso directo a la tabla de producción expone información sensible (como el RFC). El área de marketing debe interactuar con vistas o tablas intermedias anonimizadas o limitadas únicamente a clientes que hayan otorgado su consentimiento para recibir publicidad.

### 5. ¿Qué controles técnicos podrían limitar la información entregada?
* **Vistas filtradas (`CREATE VIEW`):** Excluyendo campos no relevantes como RFC.
* **Banderas de consentimiento:** Incluir una columna booleana `acepta_publicidad DEFAULT FALSE` en la tabla principal para filtrar las consultas de marketing (`WHERE acepta_publicidad = TRUE`).
* **Enmascaramiento de datos:** Ocultar partes del correo o teléfono durante las previsualizaciones de campañas.

---

## 3. Conclusión
La reutilización de datos para finalidades secundarias sin previo consentimiento vulnera el principio de finalidad. Desde la perspectiva del DBA, es fundamental implementar controles de acceso y banderas de consentimiento a nivel de base de datos para impedir que los datos operativos se utilicen arbitrariamente con fines promocionales.