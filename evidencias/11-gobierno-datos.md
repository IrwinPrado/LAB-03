# Evidencia 11: Matriz de Gobierno de Datos

**Estudiante:** Irwin Gabriel Martinez Prado  
**Materia:** Gestión de Seguridad y Desempeño de Bases de Datos  
**Práctica:** LAB-03 — Privacidad, cumplimiento y gobierno de los datos  

---

## 1. Objetivo
Estructurar una matriz de gobierno de datos para definir los roles, responsabilidades, controles de protección, retención y acciones al finalizar el ciclo de vida de cada atributo almacenado en la tabla `clientes`.

---

## 2. Matriz de Gobierno de Datos

| Dato | Finalidad | Responsable (Data Owner) | Usuarios autorizados | Protección | Retención | Acción al finalizar |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **nombre** | Identificación formal y facturación | Gerencia de Operaciones | Atención al Cliente, Facturación, DBA | Control de acceso por rol (RBAC) | Vigencia de la relación comercial | Anonimización / Cancelación |
| **correo** | Comunicación y notificación de CFDI | Gerencia de Operaciones | Atención al Cliente, Facturación, DBA | Control de acceso por rol | Vigencia comercial o solicitud ARCO | Eliminación / Sustitución por token |
| **telefono** | Soporte operativo directo | Atención al Cliente | Atención al Cliente, DBA | Restricción de columna en vistas | Vigencia de la relación comercial | Eliminación directa |
| **rfc** | Emisión de comprobantes fiscales | Dirección de Finanzas | Facturación, DBA | Cifrado a nivel de columna (`pgp_sym_encrypt`) | 5 años (Cumplimiento CFF) | Borrado seguro / Purga |
| **edad** | Segmentación demográfica agregada | Dirección de Marketing | Analítica (solo datos agregados), DBA | Agrupación por rangos en vistas | Durante el ciclo de análisis | Eliminación de registros temporales |
| **ciudad** | Logística y análisis regional | Gerencia de Operaciones | Analítica, Atención al Cliente, DBA | Vistas filtradas | Vigencia comercial / Análisis | Anonimización |
| **codigo_postal** | Segmentación territorial | Gerencia de Operaciones | Facturación, Analítica, DBA | Acceso por rol | Vigencia comercial | Conservación agregada |

---

## 3. Conclusión
El gobierno de datos delimita la propiedad (*Data Ownership*) y la custodia (*Data Custodianship*). Asignar responsabilidades claras sobre los atributos previene accesos indebidos y asegura que los datos se destruyan o anonimizen correctamente al concluir su periodo de vida.