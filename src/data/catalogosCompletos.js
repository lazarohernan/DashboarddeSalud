// Catálogos Completos - Importados desde el JSON generado del CSV
import catalogosData from './catalogos.json'

export const departamentos = catalogosData.departamentos

export const municipios = catalogosData.municipios

export const metodosAnticonceptivos = catalogosData.metodos

export const tiposEstablecimiento = catalogosData.tiposEstablecimiento

export const relaciones = catalogosData.relaciones

// Funciones de utilidad para filtrado
export const municipiosPorDepartamento = (departamento) => {
  return municipios.filter(m => m.departamento === departamento)
}

export const relacionesPorDepartamento = (departamento) => {
  return relaciones.filter(r => r.departamento === departamento)
}

export const relacionesPorMunicipio = (municipio) => {
  return relaciones.filter(r => r.municipio === municipio)
}

export const relacionesPorTipoEstablecimiento = (tipo) => {
  return relaciones.filter(r => r.tipoEstablecimiento === tipo)
}

