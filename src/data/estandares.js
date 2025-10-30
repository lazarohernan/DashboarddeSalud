// Estándares de Calidad - Datos reales completos del proyecto MEMI
// 204 indicadores evaluados en 2 establecimientos de salud
// Datos importados desde estandares.json generado del CSV

import estandaresData from './estandares.json'

// Exportar los datos directamente desde el JSON
export const estandaresCalidad = estandaresData.datos

// Exportar metadata útil
export const estandaresMetadata = estandaresData.metadata
