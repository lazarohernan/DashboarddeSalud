import { supabase } from '../lib/supabase'

function mapAvancePorAnio(registros = []) {
  return Object.fromEntries(
    registros.map((a) => [
      String(a.anio),
      {
        añoReferencia: a.anio_referencia,
        priorizado: a.priorizado ? 'Si' : 'No',
        estado: a.estado,
        resultado: a.resultado,
        observaciones: a.observaciones
      }
    ])
  )
}

export async function fetchResultados() {
  const { data, error } = await supabase
    .from('indicadores_actividad')
    .select(`
      id,
      cod_actividad,
      actividad_ingles,
      actividad_espanol,
      codigo_indicador,
      descripcion_indicador,
      outputs (codigo, nombre),
      fondos (nombre),
      indicador_avance_anual (
        anio,
        anio_referencia,
        priorizado,
        estado,
        resultado,
        observaciones
      )
    `)
    .order('id')

  if (error) throw error

  return (data ?? []).map((row) => ({
    id: row.id,
    codOutput: String(row.outputs?.codigo ?? ''),
    output: row.outputs?.nombre ?? '',
    fondo: row.fondos?.nombre ?? '',
    codActividad: row.cod_actividad ?? row.codigo_indicador,
    actividadIngles: row.actividad_ingles ?? '',
    actividad: row.actividad_espanol ?? '',
    codigoIndicador: row.codigo_indicador,
    indicador: row.descripcion_indicador,
    anos: mapAvancePorAnio(row.indicador_avance_anual),
    departamento: '',
    municipio: '',
    comunidad: '',
    establecimientoNombre: '',
    tipoEstablecimiento: '',
    estado: '',
    porcentajeAvance: 0,
    fechaInicio: '',
    fechaFin: ''
  }))
}

export async function fetchProvision() {
  const { data, error } = await supabase
    .from('provision_consumo')
    .select(`
      id,
      nombre_establecimiento,
      tipo_establecimiento,
      mes,
      anio,
      consumo,
      riss (nombre),
      municipios (nombre),
      metodos_anticonceptivos (codigo, nombre)
    `)
    .order('id')

  if (error) throw error

  return (data ?? []).map((row) => ({
    id: row.id,
    nombreES: row.nombre_establecimiento,
    tipo: row.tipo_establecimiento,
    RISS: row.riss?.nombre ?? '',
    municipio: row.municipios?.nombre ?? '',
    mes: row.mes,
    ano: row.anio,
    codigo: row.metodos_anticonceptivos?.codigo ?? null,
    tipoMetodo: row.metodos_anticonceptivos?.nombre ?? '',
    consumo: Number(row.consumo) || 0
  }))
}

export async function fetchEstandares() {
  const { data, error } = await supabase
    .from('estandares_calidad')
    .select('*')
    .order('id')

  if (error) throw error

  return (data ?? []).map((row) => ({
    id: row.id,
    nivel: row.nivel,
    departamento: row.departamento,
    municipio: row.municipio,
    comunidad: row.comunidad,
    establecimientoNombre: row.establecimiento_nombre,
    tipoEstablecimiento: row.tipo_establecimiento,
    codEje: row.cod_eje,
    ejeNombre: row.eje_nombre,
    codIndicador: row.cod_indicador,
    indicador: row.descripcion_indicador,
    calificacion: row.calificacion,
    cumple: row.cumple,
    fecha: row.fecha_evaluacion
      ? new Date(row.fecha_evaluacion).toLocaleDateString('en-US')
      : ''
  }))
}

export async function fetchCatalogos() {
  const [deptRes, munRes, tiposRes, fondosRes] = await Promise.all([
    supabase.from('departamentos').select('nombre').order('nombre'),
    supabase.from('municipios').select('nombre, departamentos (nombre)').order('nombre'),
    supabase.from('tipos_establecimiento').select('nombre').order('nombre'),
    supabase.from('fondos').select('nombre').order('nombre')
  ])

  const error = deptRes.error || munRes.error || tiposRes.error || fondosRes.error
  if (error) throw error

  return {
    departamentos: (deptRes.data ?? []).map((d) => d.nombre),
    municipios: (munRes.data ?? []).map((m) => ({
      nombre: m.nombre,
      departamento: m.departamentos?.nombre ?? ''
    })),
    tiposEstablecimiento: (tiposRes.data ?? []).map((t) => t.nombre),
    fondos: (fondosRes.data ?? []).map((f) => f.nombre)
  }
}

export async function fetchOutputs() {
  const { data, error } = await supabase
    .from('outputs')
    .select('codigo, nombre')
    .order('codigo')

  if (error) throw error
  return data ?? []
}

export async function fetchIndicadoresKpi() {
  const { data, error } = await supabase
    .from('indicadores_kpi')
    .select(`
      id,
      codigo,
      descripcion,
      output_id,
      outputs (codigo, nombre),
      indicadores_kpi_resultados (anio, valor)
    `)
    .order('id')

  if (error) throw error

  const porOutput = {}
  for (const row of data ?? []) {
    const codOutput = String(row.outputs?.codigo ?? '')
    if (!porOutput[codOutput]) {
      porOutput[codOutput] = {
        nombre: row.outputs?.nombre ?? '',
        indicadores: []
      }
    }
    porOutput[codOutput].indicadores.push({
      codigo: row.codigo,
      nombre: row.descripcion,
      años: Object.fromEntries(
        (row.indicadores_kpi_resultados ?? []).map((r) => [r.anio, r.valor])
      )
    })
  }
  return porOutput
}
