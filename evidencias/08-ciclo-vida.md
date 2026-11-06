# Evidencia 08: Análisis del Ciclo de Vida y Derecho de Cancelación

**Estudiante:** Irwin Gabriel Martinez Prado  
**Materia:** Gestión de Seguridad y Desempeño de Bases de Datos  
**Práctica:** LAB-03 — Privacidad, cumplimiento y gobierno de los datos  

---

## 1. Objetivo
Mapear el ciclo de vida de la información personal de un cliente y analizar por qué la ejecución de una instrucción `DELETE` en la tabla principal de la base de datos no garantiza la eliminación total de los datos en la organización.

---

## 2. Mapa de Propagación del Dato

```text
clientes (Tabla Principal / Producción)
   │
   ├── respaldos (Backups en disco / Nube / Cintas de archivo)
   ├── réplicas (Servidores Read-Replica / Standby)
   ├── reportes (Archivos PDF / Excel generados históricamente)
   ├── exportaciones (Archivos CSV para ambientes de pruebas/desarrollo)
   └── sistemas externos (Pasarelas de pago, CRM, herramientas de marketing)