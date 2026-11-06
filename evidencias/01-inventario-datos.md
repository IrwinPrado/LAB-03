# Evidencia 01: Inventario y Finalidad de los Datos

**Estudiante:** Irwin Gabriel Martinez Prado  
**Materia:** Gestión de Seguridad y Desempeño de Bases de Datos  
**Práctica:** LAB-03 — Privacidad, cumplimiento y gobierno de los datos  

---

## 1. Objetivo
Identificar los datos personales almacenados en la base de datos de Comercializadora Norte S.A. de C.V., clasificarlos conforme a su finalidad y determinar su nivel de acceso y periodo de retención aplicando los principios de minimización y necesidad.

---

## 2. Matriz de Inventario de Datos

| Campo | ¿Es dato personal? | Finalidad | ¿Es necesario? | Nivel de acceso | Retención |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **id** | No | Identificación técnica interna de los registros (llave primaria). | Sí | Todos los roles con acceso a la tabla | Indefinido (asociado a la existencia del registro) |
| **nombre** | Sí | Identificación formal del titular para atención, contratación y facturación. | Sí | Atención al Cliente, Facturación, DBA | Mientras la cuenta esté activa o por obligación mercantil |
| **correo** | Sí | Canal principal de comunicación, autenticación y envío de comprobantes fiscales. | Sí | Atención al Cliente, Facturación, DBA | Mientras la relación comercial exista o hasta solicitud de cancelación |
| **telefono** | Sí | Contacto operativo para soporte técnico y aclaración de servicios. | Sí | Atención al Cliente, DBA | Mientras dure la relación comercial |
| **rfc** | Sí (Sensible/Fiscal) | Cumplimiento fiscal y emisión de comprobantes fiscales digitales (CFDI). | Sí | Facturación, DBA | 5 años posteriores al cierre del ejercicio fiscal (CFF) |
| **edad** | Sí | Segmentación sociodemográfica y verificación de mayoría de edad. | No para operación directa | Analítica (en rangos agregados) | Solo durante el ciclo de análisis estadístico |
| **ciudad** | Sí (Indirecto) | Ubicación geográfica para análisis de mercado y logística regional. | Sí | Analítica, Atención al Cliente, DBA | Durante el ciclo de vida operativo del cliente |
| **codigo_postal** | Sí (Indirecto) | Identificación de zona de entrega y segmentación territorial. | Sí | Facturación, Analítica, DBA | Durante el ciclo de vida operativo del cliente |
| **fecha_alta** | No | Trazabilidad del registro e identificación de antigüedad comercial. | Sí | Todos los roles | Indefinido (historial del registro) |

---

## 3. Justificación de las Decisiones
* **Campos estrictamente necesarios:** `nombre`, `correo` y `telefono` son indispensables para la operación básica con el cliente. `rfc` es obligatorio por regulación tributaria en México (LFPDPPP y Código Fiscal de la Federación).
* **Campos no necesarios para la operación:** `edad` no es requerida para brindar soporte o emitir facturas. Su uso debe restringirse a finalidades analíticas en forma de rangos de edad, evitando la identificación individual del cliente.

---

## 4. Conclusión
El inventario de datos es el punto de partida del gobierno de datos. No todos los campos registrados en un esquema de base de datos deben estar disponibles para todos los departamentos. Definir niveles de acceso por rol y justificar la retención permite alinearse con los principios de privacidad desde la arquitectura.