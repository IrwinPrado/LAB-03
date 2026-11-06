---

### **4. `evidencias/10-retencion.md`**

```markdown
# Evidencia 10: Evaluación de la Política de Retención Indefinida

**Estudiante:** Irwin Gabriel Martinez Prado  
**Materia:** Gestión de Seguridad y Desempeño de Bases de Datos  
**Práctica:** LAB-03 — Privacidad, cumplimiento y gobierno de los datos  

---

## 1. Objetivo
Evaluar la propuesta de la organización de *"Conservar todos los datos de clientes indefinidamente porque podrían ser útiles en el futuro"*, identificando sus riesgos y estableciendo los criterios para una política de retención válida.

---

## 2. Análisis de Preguntas

### Pregunta 1: ¿Es compatible con el principio de minimización?
**No.** El principio de minimización y limitación del plazo de conservación exige que los datos personales se mantengan únicamente durante el tiempo strictly necesario para cumplir con la finalidad para la cual fueron recabados o conforme a los plazos exigidos por la ley.

### Pregunta 2: ¿Qué riesgos genera conservar información innecesaria?
* **Riesgo de filtración (Data Breach):** A mayor volumen de datos antiguos o inactivos almacenados, mayor es el impacto y la severidad en caso de un incidente de seguridad.
* **Costos de almacenamiento y mantenimiento:** Incremento innecesario en el tamaño de las bases de datos, respaldos y tiempo de mantenimiento de índices.
* **Sanciones regulatorias:** Incumplimiento de marcos como la LFPDPPP o GDPR, que sancionan la conservación injustificada de datos de titulares inactivos.

### Pregunta 3: ¿Qué debería determinar la organización antes de establecer un periodo de retención?
* **Obligaciones legales y fiscales:** Por ejemplo, en México, el Código Fiscal de la Federación exige conservar contabilidad y comprobantes fiscales por un mínimo de 5 años.
* **Prescripción de responsabilidades contractuales:** Plazos de prescripción para ejercitar acciones legales o atender garantías.
* **Necesidad operativa real:** Definir el periodo activo del cliente en la plataforma.

### Pregunta 4: ¿Qué información debería documentarse para justificar el periodo seleccionado?
* El fundamento legal o normativo de la conservación (artículos de leyes aplicables).
* La finalidad específica para la cual se conserva cada tipo de dato.
* El procedimiento de depuración, borrado seguro o anonimización una vez vencido el plazo.

---

## 3. Conclusión
Almacenar información indefinidamente *"por si acaso"* viola los principios fundamentales de privacidad. El DBA debe implementar procesos automatizados de depuración o archivado histórico para eliminar o anonimizar registros cuyo periodo de retención legal haya expirado.