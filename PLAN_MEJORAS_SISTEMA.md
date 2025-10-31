# Plan de Mejoras y Actualizaciones del Sistema

## Resumen de Reunión - Cambios y Mejoras a Implementar

Este documento resume las mejoras y actualizaciones discutidas para el dashboard de salud.

---

## 📍 **1. MAPA EN PÁGINA DE INICIO**

### Ubicación
- El mapa debe ir **al final de la página de inicio**, después de los cuadros de outputs/outputs.
- Actualmente está implementado en esa ubicación.

### Estado Actual
- ✅ MapLibre GL JS integrado
- ✅ GeoJSON de Honduras cargado (departamentos)
- ✅ Mapa funcional con visualización de departamentos

### Pendiente
- [ ] Agregar información de municipios conforme a la imagen de referencia
- [ ] Mostrar información de población cuando esté disponible
- [ ] Integrar datos de presentación en el mapa

---

## 📊 **2. VISTA DE ESTÁNDARES (EstandaresView)**

### ✅ Estado: **IMPLEMENTADO**

### Mejora Requerida
- ✅ **Agrupar por ejes** en lugar de mostrar todo en una tabla
- ✅ Mostrar de manera **gráfica y visual**

### Cambios Implementados:

#### **2.1 Tarjetas de Ejes (Antes de la tabla)** ✅
- [x] ~~Crear sección con **tarjetas/cuadros** que muestren cada eje~~
- [x] ~~Cada tarjeta debe mostrar:~~
  - ✅ Nombre del eje (ej: "Eje 1", "Eje 2")
  - ✅ **Porcentaje obtenido** del eje
- [x] ~~Diseño similar a las tarjetas existentes (con iconografía)~~
  - ✅ **Componente creado**: `TarjetasEjes.vue`
  - ✅ **Iconografía Lucide**: `Layers` para "Todos", `Target` para ejes
  - ✅ **Carrusel horizontal** implementado para mejor UX
  - ✅ **Tarjetas compactas** con diseño optimizado

#### **2.2 Funcionalidad de Selección** ✅
- [x] ~~Al hacer clic en una tarjeta de eje:~~
  - ✅ Mostrar el **detalle de las preguntas** de ese eje (filtrado automático)
  - ✅ Filtrar la tabla de estándares para mostrar solo ese eje
- [x] ~~Cuando **no hay eje seleccionado**: mostrar todos los estándares~~
  - ✅ Tarjeta "Todos los Ejes" muestra porcentaje general
  - ✅ Al hacer clic muestra todos los estándares

#### **2.3 Organización** ✅
- [x] ~~Mover la **tabla de estándares más abajo**~~
- [x] ~~Colocar las **tarjetas de ejes primero** (arriba)~~
  - ✅ **Orden actualizado**: Tarjetas arriba → Tabla abajo

#### **2.4 Características Adicionales Implementadas**
- ✅ **Barra de progreso visual** en cada tarjeta
- ✅ **Colores semánticos** según porcentaje (verde ≥70%, amarillo ≥50%, rojo <50%)
- ✅ **Contador de indicadores** ("X de Y indicadores")
- ✅ **Hover effects** con animaciones suaves
- ✅ **Carrusel horizontal** con scroll suave (alternativa al grid)
- ✅ **Scroll snap** para mejor navegación
- ✅ **Responsive design** adaptado a diferentes pantallas

---

## 📈 **3. VISTA DE OUTPUTS (OutputsView)**

### Cambios Importantes

#### **3.1 Estructura de la Vista**
La vista debe tener **3 secciones principales**:

1. **Resultados de Indicadores** (ARRIBA)
   - [ ] Mostrar de manera **gráfica** (no solo tablas)
   - [ ] Visualización por año (año 1, año 2, año 3)
   - [ ] Gráficos o visualizaciones interactivas

2. **Selector de Filtros** (EN MEDIO)
   - [ ] **Primero**: Selector de año (obligatorio)
   - [ ] **Segundo**: Selector de Output (opcional)
     - Por defecto mostrar todos los outputs
     - 4 outputs disponibles

3. **Tabla de Actividades** (ABAJO)
   - [ ] Mantener la tabla actual
   - [ ] Aplicar filtros del selector

#### **3.2 Visualización de Outputs**
- [ ] Crear **cuadros/contenedores** para cada output (similar a tarjetas)
- [ ] Al hacer clic en un cuadro:
  - Se **despliega** la información del output
  - Muestra los indicadores del output seleccionado
- [ ] Diseño con animaciones para la expansión/colapso

#### **3.3 Información por Output**
Cada output debe mostrar:
- **Código del output**
- **Nombre del output**
- **Indicadores** (cada actividad tiene indicadores)
  - Output 1: 7 indicadores
  - Output 2: 6 indicadores
  - Output 3: ~20 indicadores
  - Output 4: TBD
- **Resultados por año** (año 1, año 2, año 3)

#### **3.4 Diagrama de Referencia**
```
[Output 1] [Output 2] [Output 3] [Output 4]
    ↓
[Nombre del Output]
    ↓
[Iconografías de Indicadores]
```

#### **3.5 Filtrado Secuencial**
- [ ] Usuario **debe seleccionar un año primero** (obligatorio)
- [ ] Después puede seleccionar un output específico
- [ ] Si no selecciona output, mostrar todos

#### **3.6 Prioridad**
- La información de indicadores debe ir **arriba del selector**
- El selector debe estar en medio
- La tabla debe estar **debajo del selector**

---

## 💊 **4. VISTA DE PROVISIÓN DE ANTICONCEPTIVOS (ProvisionView)**

### Cambios a Implementar

#### **4.1 Rediseño de la Vista**
- [ ] Cambiar de **tabla** a **cuadros/tarjetas**
- [ ] Diseño similar a las tarjetas de outputs
- [ ] Usar iconografía (no solo texto)

#### **4.2 Selector de Métodos**
- [ ] Crear **selector de métodos** anticonceptivos
- [ ] Mostrar movimiento gráfico:
  - Valor **inicial**
  - Valor **final**
  - Progreso/interacción visual

#### **4.3 Organización**
- [ ] **Filtros y selectores** arriba
- [ ] **Información agregada** en medio
- [ ] **Tabla completa** abajo (mantener para referencia)

#### **4.4 Mejora de Visualización**
- [ ] Diseño más gráfico y visual
- [ ] Tarjetas con iconografía similar a otras secciones

---

## 🔐 **5. SISTEMA DE CAPTURA DE DATOS**

### Consideraciones
- [ ] Crear formularios dentro del mismo ecosistema (no PHP separado)
- [ ] Sección de entrada de datos con login
- [ ] Más dinámico que formularios estáticos
- [ ] Posibilidad de agregar fotos y animaciones

### Vínculos a Medios de Verificación
- [ ] En las tablas, agregar vínculos a medios de verificación
- [ ] Similar a sistemas de gestión de calidad

---

## 📋 **6. PRIORIDADES PARA MAÑANA (Reunión con Jefatura)**

### ✅ Alta Prioridad
1. **Estándares de Calidad**
   - [ ] Tarjetas de ejes
   - [ ] Filtrado por eje
   - [ ] Organización de la vista

2. **ProvisionView**
   - [ ] Rediseño con tarjetas
   - [ ] Selector de métodos
   - [ ] Visualización gráfica

### ⏳ Media Prioridad
3. **OutputsView**
   - [ ] Diagrama de outputs con indicadores
   - [ ] Filtrado secuencial (año → output)
   - [ ] Visualización gráfica de resultados

### 🔄 Baja Prioridad (Para después)
4. **Mapa de Municipios**
   - [ ] Información de municipios en el mapa
   - [ ] Datos de población
   - [ ] Integración completa de datos

---

## 📝 **7. NOTAS ADICIONALES**

### Diseño General
- Mantener **consistencia visual** entre todas las vistas
- Usar **tarjetas/cuadros** con iconografía
- Implementar **animaciones** para transiciones
- Colores semánticos: **naranja** para elementos principales

### Datos Pendientes
- [ ] Tabla de outputs con indicadores (en preparación)
- [ ] Información de población para el mapa
- [ ] Datos específicos de municipios

### Tiempos
- **Corto plazo**: Estándares y ProvisionView
- **Medio plazo**: OutputsView completo
- **Largo plazo**: Mapa completo con todos los datos

---

## 🎯 **8. RESUMEN EJECUTIVO**

### Cambios Principales
1. **Estándares**: Agrupar por ejes con tarjetas y filtrado
2. **Outputs**: Diagrama gráfico con indicadores y filtrado secuencial
3. **Provision**: Rediseño con tarjetas y selector de métodos
4. **Mapa**: En proceso, pendiente datos de municipios

### Principios de Diseño
- **Visual y gráfico** antes que tablas
- **Filtrado secuencial** (año → categoría)
- **Tarjetas con iconografía** en lugar de solo texto
- **Animaciones** para mejor UX
- **Consistencia** entre todas las vistas

---

## 📅 **Fecha de Creación**
Documento creado basado en reunión de revisión del sistema.

**Próxima revisión**: Después de reunión con jefatura

---

## ✅ **Checklist de Implementación**

### Estándares ✅ **COMPLETADO**
- [x] ~~Crear componente de tarjetas de ejes~~ ✅ Componente `TarjetasEjes.vue` creado
- [x] ~~Implementar filtrado por eje~~ ✅ Filtrado automático al seleccionar eje
- [x] ~~Reorganizar vista (tarjetas arriba, tabla abajo)~~ ✅ Orden actualizado
- [x] ~~Mostrar porcentaje por eje~~ ✅ Porcentaje visible en cada tarjeta
- [x] Carrusel horizontal implementado (bonus)
- [x] Barras de progreso visuales (bonus)
- [x] Colores semánticos según porcentaje (bonus)

### Outputs
- [ ] Crear diagrama visual de outputs
- [ ] Implementar selector de año (obligatorio)
- [ ] Implementar selector de output (opcional)
- [ ] Crear visualización gráfica de indicadores
- [ ] Reorganizar vista (indicadores arriba, filtros medio, tabla abajo)

### Provision
- [ ] Rediseñar con tarjetas/cuadros
- [ ] Implementar selector de métodos
- [ ] Mostrar valores inicial/final gráficamente
- [ ] Reorganizar vista (filtros arriba, info medio, tabla abajo)

### Mapa
- [ ] Esperar datos de municipios
- [ ] Integrar información de población
- [ ] Agregar interactividad según imagen de referencia
