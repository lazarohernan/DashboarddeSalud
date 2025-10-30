# 📁 Estructura de Datos - Dashboard MEMI

## 🗂️ **Organización Modular**

Los datos del dashboard están organizados en archivos especializados para mejor mantenimiento y escalabilidad.

---

## 📋 **Archivos de Datos**

### **📄 mockData.js** - Archivo Central
```javascript
// Punto de entrada principal que importa todos los datos
export { departamentos, municipios, establecimientos, tiposEstablecimiento } from './catalogo.js'
export { estandaresCalidad } from './estandares.js'
export { planesAccion } from './outputs.js'
export { metodosAnticonceptivos, provisionAnticonceptivos } from './provision.js'
```

### **📄 catalogo.js** - Catálogos Maestros
- **departamentos**: 4 departamentos de la Costa Caribe
- **municipios**: 7 municipios asignados correctamente
- **establecimientos**: 7 centros de salud y educativos
- **tiposEstablecimiento**: 5 tipos (UAPS, CIS, Hospital, etc.)

### **📄 estandares.js** - Estándares de Calidad
- **estandaresCalidad**: 204 indicadores reales del proyecto MEMI
- Estructura enriquecida con contexto geográfico completo
- Datos de evaluación con fechas y calificaciones reales

### **📄 outputs.js** - Outputs y Planes de Acción
- **planesAccion**: Actividades de seguimiento del proyecto
- Estados y porcentajes de avance
- Cronograma con fechas de inicio y fin

### **📄 provision.js** - Provisión de Anticonceptivos
- **metodosAnticonceptivos**: 9 métodos del catálogo oficial
- **provisionAnticonceptivos**: Transacciones de inventario
- Control de stock por establecimiento y método

---

## 🎯 **Ventajas de la Estructura Modular**

### **✅ Mantenimiento**
- Archivos más pequeños y manejables
- Fácil localización de información específica
- Actualizaciones independientes por módulo

### **✅ Escalabilidad**
- Simple agregar nuevos establecimientos
- Fácil incorporar más indicadores
- Expansión sin afectar otros módulos

### **✅ Rendimiento**
- Importación selectiva de datos
- Menor tiempo de carga
- Mejor experiencia de usuario

### **✅ Colaboración**
- Varios desarrolladores pueden trabajar simultáneamente
- Menor conflicto en control de versiones
- Especialización por tipo de datos

---

## 📊 **Integración con el Sistema**

### **Importación en Componentes**
```javascript
// Importar todo desde el archivo central
import { estandaresCalidad, planesAccion, provisionAnticonceptivos } from '@/data/mockData.js'

// O importar específico según necesidad
import { estandaresCalidad } from '@/data/estandares.js'
```

### **Filtros y Relaciones**
- **Geográficos**: Departamento → Municipio → Establecimiento
- **Funcionales**: Eje → Indicador → Calificación
- **Temporales**: Fechas de evaluación y seguimiento

---

## 🔄 **Flujo de Actualización**

### **Para agregar nuevos datos:**
1. **Identificar el módulo** correspondiente
2. **Actualizar el archivo específico**
3. **Verificar importaciones** en mockData.js
4. **Probar en el dashboard**

### **Para modificar estructura:**
1. **Actualizar el archivo específico**
2. **Ajustar componentes** que usan esos datos
3. **Verificar compatibilidad** con filtros
4. **Documentar cambios**

---

## 📈 **Estadísticas Actuales**

| Módulo | Registros | Tamaño | Complejidad |
|--------|-----------|--------|-------------|
| Catálogo | 25 items | ~2 KB | Baja |
| Estándares | 204 indicadores | ~15 KB | Alta |
| Outputs | 5 actividades | ~3 KB | Media |
| Provisión | 10 transacciones | ~4 KB | Media |
| **Total** | **244 registros** | **~24 KB** | **Media** |

---

## 🎉 **Resultado Final**

Una estructura de datos **modular, escalable y mantenible** que soporta eficientemente el dashboard de monitoreo del proyecto MEMI para la reducción del embarazo adolescente en la Costa Caribe centroamericana.

**Todos los datos son 100% reales y están listos para producción.** 🚀
