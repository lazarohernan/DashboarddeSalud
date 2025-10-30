// Catálogos reales del Dashboard MEMI
// Archivo central de datos - Importa desde archivos especializados
// Estructura modular para mejor mantenimiento

// Catálogos y datos geográficos
export {
  departamentos,
  municipios,
  comunidades,
  establecimientos,
  tiposEstablecimiento,
  metodosAnticonceptivos,
  ejesCalidad
} from './catalogo.js'

// Estándares de calidad (204 indicadores reales)
export {
  estandaresCalidad
} from './estandares.js'

// Outputs y planes de acción
export {
  planesAccion
} from './outputs.js'

// Provisión de anticonceptivos
export {
  provisionAnticonceptivos
} from './provision.js'
