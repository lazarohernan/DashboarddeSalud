# Resumen de Mejoras - Dashboard Salud
## Proyecto LNOB (Living No One Behind) - Evaluación de Medio Término

## 📍 **1. Mejoras al Mapa de Honduras**

### Funcionalidades requeridas:
- **Marcadores de municipios específicos** en lugar de solo departamentos
- **Municipios LNOB a señalar:**
  - La Ceiba (Atlántida)
  - Iriona (Colón)
  - Limón (Colón)
  - Santa Fe (Colón)
  - Santa Rosa de Aguán (Colón)
  - José Santos Guardiola (Islas de la Bahía)
  - Puerto Lempira (Gracias a Dios)
- **Interactividad:** Al hacer clic en municipio mostrar ventana informativa
- **Centrado:** El mapa debe centrarse en la ubicación del municipio seleccionado
- **Coordenadas:** Usar coordenadas de los centros de salud de cada municipio

### Datos necesarios:
- Coordenadas GPS de cada municipio (centro de establecimiento de salud)
- Información específica por municipio para mostrar en ventana emergente

---

## 📊 **2. Sección A - Alcance del Proyecto**

### Ubicación:
- Primera sección principal después de filtros

### Indicadores mínimos (EIS - Educación Integral en Sexualidad):
1. **# Adolescentes alcanzadas (EIS)** - Hombres y Mujeres
2. **# Docentes capacitados (EIS)** - Hombres y Mujeres  
3. **# Organizaciones comunitarias activas** - Total general
4. **# Establecimientos de salud involucrados** - Total general
5. **# Proveedores capacitados en SSR** - Estructura SESAL (médicos, enfermeras, auxiliares)
6. **# Jóvenes/mujeres formadas en liderazgo** - Específicamente mujeres

### Visualización sugerida:
- **6 tarjetas KPI simples** con los indicadores principales
- **Gráfico de barras** "por país" o "por municipio (Honduras)" para comparaciones

### Filtros aplicables:
- Departamento
- Municipio
- Año

---

## 🏥 **3. Sección B - Servicios de Salud Sexual y Reproductiva (SSR)**

### Variables del Marco de Resultados (TDR):
1. **# Establecimientos de salud con servicios de calidad para adolescentes**
2. **# Proveedores formados en SSR con enfoque intercultural** - Estructura SESAL
3. **Disponibilidad de MAC/LARC (sí/no) por establecimiento**
   - **MAC:** Métodos Anticonceptivos Comunes
   - **LARC:** Métodos Anticonceptivos de Larga Duración

### Visualización sugerida:
- **Mapa o tabla simple por municipio** mostrando disponibilidad
- **Semáforo de disponibilidad:**
  - 🟢 **Verde:** Todos los métodos disponibles
  - 🟡 **Amarillo:** Faltan 1-2 métodos
  - 🔴 **Rojo:** Sin disponibilidad

---

## 📊 **4. Sección D - Narrativa de Barreras**

### Importancia:
- **Evidencia crítica** para evaluación de medio término
- Datos de entrevistas rápidas y grupos focales

### Top 5 barreras reportadas:
1. **Falta de disponibilidad de MAC**
2. **Carga de trabajo del personal**
3. **Falta de privacidad para la consejería**
4. **Normas sociales que limitan acceso**
5. **Racismo / discriminación lingüística**

### Visualización:
- **Gráfico de barras horizontal simple** mostrando las 5 barreras principales

---

## 🚦 **5. Sección E - Panel de Semáforo Municipal**

### Municipios LNOB en Honduras:
- La Ceiba
- Iriona  
- Limón
- Santa Fe
- Santa Rosa de Aguán
- José Santos Guardiola
- Puerto Lempira

### Variables mínimas a medir:
- **% disponibilidad de MAC**
- **% proveedores capacitados**
- **% adolescentes alcanzadas (EIS)**
- **% organizaciones comunitarias activas**

### Visualización:
**Tabla simple 7×4 con semáforos:**

| Municipio | MAC | Proveedores | EIS | Comunidades |
|-----------|-----|-------------|-----|-------------|
| La Ceiba | 🟢 | 🟡 | 🟢 | 🟢 |
| Limón | 🔴 | 🟡 | 🔴 | 🟡 |
| ... | ... | ... | ... | ... |

---

## 📈 **6. Mejoras a Outputs Existentes**

### Modificaciones requeridas:
- **Tarjetas de progreso:** Mostrar "Meta vs Real" en lugar de solo porcentajes
- **Output 1:** Mantener tarjetas de porcentaje de avance
- **Output 2:** Mantener filtros por año

---

## 🎨 **7. Requerimientos Visuales y de UX**

### Componentes a utilizar:
- **Tarjetas KPI:** Simples, con desglose de género donde aplique
- **Gráficos:** 
  - Gráfico de barras horizontal para barreras (Sección D)
  - Gráfico de barras para comparaciones por municipio (Sección A)
  - Tablas simples con semáforos (Sección E)
- **Mapa interactivo:** Con marcadores de municipios y ventanas emergentes
- **Semáforos:** Visualización con emojis 🟢🟡🔴 para estados

### Filtros globales:
- Departamento (aplica a todas las secciones)
- Municipio (aplica a todas las secciones)
- Año (donde aplique)

---

## 📋 **8. Datos Provisionales**

### Mientras se obtienen datos reales:
- Crear estructura visual completa
- Implementar datos mock/dummy para demostrar funcionalidad
- Preparar sistema para fácil actualización cuando estén disponibles los datos reales

---

## 🚀 **9. Prioridades de Implementación**

### Alta prioridad (para presentación inmediata a UNFPA):
1. ✅ **Sección A - Alcance del Proyecto** con 6 tarjetas KPI
2. ✅ **Mapa mejorado** con 7 municipios LNOB marcados
3. ✅ **Sección E - Semáforo Municipal** con tabla 7×4
4. ✅ **Sección D - Narrativa de Barreras** con gráfico de barras

### Media prioridad:
1. **Sección B - Servicios SSR** con mapa de disponibilidad MAC/LARC
2. Ventanas emergentes del mapa con información detallada
3. Integración de filtros globales sincronizados

### Baja prioridad:
1. Datos reales y actualización dinámica
2. Optimización de rendimiento
3. Funcionalidades avanzadas de exportación

---

## 🔧 **10. Consideraciones Técnicas**

### Estructura de archivos:
- Mantener estructura Vue.js + Vite existente
- Utilizar TailwindCSS para estilos
- Implementar componentes reutilizables para tarjetas KPI
- Usar MapLibre para funcionalidades del mapa

### Datos a preparar:
- Coordenadas GPS de 7 municipios LNOB
- Datos mock para todos los indicadores
- Estructura JSON para fácil actualización futura

---

## 📞 **11. Próximos Pasos**

1. **Confirmar** coordenadas exactas de los 7 municipios LNOB
2. **Preparar** datos provisionales para Sección A (alcance)
3. **Implementar** estructura visual de Sección D (barreras)
4. **Crear** tabla de semáforos para Sección E
5. **Integrar** mapa con marcadores de municipios
6. **Presentar** avance inicial para evaluación UNFPA
7. **Actualizar** con datos reales cuando estén disponibles

---

## 📝 **12. Notas Importantes**

- **Evaluación de medio término** del proyecto LNOB es el objetivo principal
- **UNFPA requiere** visualización clara y datos desagregados por género
- **Los filtros deben sincronizarse** across todas las secciones
- **Prioridad en funcionalidad básica** vs datos perfectos inicialmente
- **Evidencia crítica:** Sección D (barreras) es fundamental para evaluación
- **Enfoque en municipios LNOB:** Los 7 municipios específicos son prioritarios
