import provisionData from './provisionAnticonceptivos.json'

export const provisionAnticonceptivos = provisionData.datos.map(item => ({
  id: item.id,
  nivel: item.nivel,
  departamento: item.departamento,
  municipio: item.municipio,
  comunidad: item.comunidad,
  establecimientoNombre: item.establecimientoNombre,
  tipoEstablecimiento: item.tipoEstablecimiento,
  codMetodo: item.codMetodo,
  metodo: item.metodo,
  transaccion: item.transaccion,
  cantidad: item.cantidad,
  fecha: item.fecha
}));
