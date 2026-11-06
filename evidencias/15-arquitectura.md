# Evidencia 15: Propuesta de Arquitectura de Datos Protegidos

**Estudiante:** Irwin Gabriel Martinez Prado  
**Materia:** Gestión de Seguridad y Desempeño de Bases de Datos  
**Práctica:** LAB-03 — Privacidad, cumplimiento y gobierno de los datos  

---

## 1. Objetivo
Diseñar una propuesta de arquitectura conceptual para separar el tratamiento de la información en la base de datos de acuerdo con su finalidad (Operación, Analítica y Auditoría), aplicando controles de privacidad, seguridad y ciclo de vida.

---

## 2. Diagrama de Arquitectura Conceptual

```text
                           BASE DE DATOS POSTGRESQL 16
                                        │
        ┌───────────────────────────────┼───────────────────────────────┐
        │                               │                               │
        ▼                               ▼                               ▼
  ESQUEMA OPERACIÓN              ESQUEMA ANALÍTICA             ESQUEMA AUDITORÍA
 (Tablas OLTP Activas)         (Vistas / Datamarts)          (Logs y Traza de Eventos)
        │                               │                               │
        ▼                               ▼                               ▼
  Datos necesarios para         Datos agregados y            Registros no modificables
  operación comercial            anonimizados                 de accesos y cambios
  (Acceso: Soporte/Ventas)      (Acceso: Analistas)          (Acceso: Auditor/DBA)