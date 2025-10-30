import resultadosData from './resultados.json'

export const resultados = resultadosData.datos.map(item => ({
  id: item.id,
  nivel: item.nivel,
  departamento: item.departamento,
  municipio: item.municipio,
  comunidad: item.comunidad,
  establecimientoNombre: item.establecimientoNombre,
  tipoEstablecimiento: item.tipoEstablecimiento,
  codOutput: item.codOutput,
  output: item.output,
  codActividad: item.codActividad,
  actividad: item.actividad,
  estado: item.estado,
  porcentajeAvance: item.porcentajeAvance,
  fechaInicio: item.fechaInicio,
  fechaFin: item.fechaFin
}));
