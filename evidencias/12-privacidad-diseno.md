# Evidencia 12: Análisis de Privacidad por Diseño (Privacy by Design)

**Estudiante:** Irwin Gabriel Martinez Prado  
**Materia:** Gestión de Seguridad y Desempeño de Bases de Datos  
**Práctica:** LAB-03 — Privacidad, cumplimiento y gobierno de los datos  

---

## 1. Objetivo
Evaluar una propuesta de diseño de base de datos técnicamente deficiente bajo los principios de *Privacy by Design* y *Privacy by Default*, identificando campos innecesarios y proponiendo un modelo optimizado.

---

## 2. Análisis del Escenario Propuesto
El desarrollador propone registrar: `id`, `nombre`, `correo`, `telefono`, `rfc`, `edad`, `direccion`, `ciudad`, `codigo_postal`, `fecha_nacimiento`, `ocupacion`, `salario`, `estado_civil`, etc., bajo el argumento: *"Es mejor guardar todos los datos por si posteriormente necesitamos alguno"*.

---

## 3. Respuestas al Análisis

### 1. ¿Qué problemas identificas?
Almacenar atributos altamente sensibles e innecesarios (como `salario`, `estado_civil`, `ocupacion`, `fecha_nacimiento` completa) aumenta drásticamente el impacto de un incidente de seguridad (*data breach*) y expone a la organización a multas severas.

### 2. ¿Qué principio de privacidad se está ignorando?
Se ignoran los principios de **minimización de datos**, **proporcionalidad**, **necesidad** y **limitación de la finalidad**.

### 3. ¿Qué preguntas realizarías antes de aprobar el diseño?
* ¿Cuál es la finalidad específica y justificada de recabar el `salario` y el `estado_civil`?
* ¿Es necesario solicitar la `fecha_nacimiento` exacta o basta con confirmar si el usuario es mayor de edad mediante un booleano?
* ¿Se informó al usuario sobre el tratamiento de estos datos en el Aviso de Privacidad?

### 4. ¿Qué datos eliminarías del diseño inicial?
Eliminaría de inmediato: `salario`, `estado_civil`, `ocupacion` y `fecha_nacimiento` (si ya se tiene la validación de edad).

### 5. ¿Qué datos requerirían una justificación adicional?
`rfc` (solo si la aplicación procesará facturación directamente) y `direccion` completa (solo si hay envío físico de mercancía).

### 6. ¿Cómo aplicarías privacidad por defecto (*Privacy by Default*)?
Configurar el esquema inicial de la base de datos para que solicite únicamente los campos estrictamente indispensables (`nombre`, `correo`) y deshabilitar por defecto cualquier recopilación de datos opcionales hasta que el cliente active conscientemente una función que los requiera.

---

## 4. Conclusión
La privacidad por diseño evita la sobre-recolección de información desde la etapa de modelado conceptual. Diseñar bases de datos con estructuras mínimas reduce el área de ataque y simplifica el cumplimiento normativo.