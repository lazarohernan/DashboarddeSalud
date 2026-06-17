import { supabase } from '../lib/supabase'

const DEFAULT_PAGE_SIZE = 25

function rangoPagina(page = 1, pageSize = DEFAULT_PAGE_SIZE) {
  const desde = (page - 1) * pageSize
  return { desde, hasta: desde + pageSize - 1 }
}

// ─── Catálogos para dropdowns ──────────────────────────────────────────────

export async function fetchCatalogosAdmin() {
  const [deptRes, rissRes, munRes, metodosRes, outputsRes, indicadoresRes, kpiRes] = await Promise.all([
    supabase.from('departamentos').select('id, nombre').order('nombre'),
    supabase.from('riss').select('id, nombre').order('nombre'),
    supabase.from('municipios').select('id, nombre, departamentos(nombre)').order('nombre'),
    supabase.from('metodos_anticonceptivos').select('id, nombre, codigo').order('nombre'),
    supabase.from('outputs').select('id, codigo, nombre').order('codigo'),
    supabase
      .from('indicadores_actividad')
      .select('id, codigo_indicador, descripcion_indicador, outputs(codigo, nombre), fondos(nombre)')
      .order('id'),
    supabase
      .from('indicadores_kpi')
      .select('id, codigo, descripcion, outputs(codigo, nombre)')
      .order('codigo')
  ])

  const err = deptRes.error || rissRes.error || munRes.error || metodosRes.error || outputsRes.error || indicadoresRes.error || kpiRes.error
  if (err) throw err

  return {
    departamentos: deptRes.data ?? [],
    riss: rissRes.data ?? [],
    municipios: munRes.data ?? [],
    metodos: metodosRes.data ?? [],
    outputs: outputsRes.data ?? [],
    indicadores: indicadoresRes.data ?? [],
    indicadoresKpi: kpiRes.data ?? []
  }
}

// ─── Avances anuales ───────────────────────────────────────────────────────

export async function fetchAvances({ page = 1, pageSize = DEFAULT_PAGE_SIZE, anio, outputId, busqueda } = {}) {
  const { desde, hasta } = rangoPagina(page, pageSize)
  const needsInner = outputId || busqueda
  const joinIndicador = needsInner ? 'indicadores_actividad!inner' : 'indicadores_actividad'

  let query = supabase
    .from('indicador_avance_anual')
    .select(
      `
      id,
      indicador_id,
      anio,
      anio_referencia,
      priorizado,
      estado,
      resultado,
      observaciones,
      ${joinIndicador} (
        codigo_indicador,
        descripcion_indicador,
        output_id,
        outputs (codigo, nombre),
        fondos (nombre)
      )
    `,
      { count: 'exact' }
    )
    .order('anio', { ascending: false })
    .order('indicador_id')

  if (anio) query = query.eq('anio', anio)
  if (outputId) query = query.eq('indicadores_actividad.output_id', outputId)
  if (busqueda) query = query.ilike('indicadores_actividad.descripcion_indicador', `%${busqueda}%`)

  const { data, error, count } = await query.range(desde, hasta)
  if (error) throw error
  return { data: data ?? [], total: count ?? 0 }
}

export async function upsertAvance(avance) {
  const payload = {
    indicador_id: avance.indicador_id,
    anio: avance.anio,
    anio_referencia: avance.anio_referencia ?? null,
    priorizado: avance.priorizado ?? false,
    estado: avance.estado ?? null,
    resultado: avance.resultado ?? null,
    observaciones: avance.observaciones ?? null
  }

  if (avance.id) {
    const { data, error } = await supabase
      .from('indicador_avance_anual')
      .update(payload)
      .eq('id', avance.id)
      .select()
      .single()
    if (error) throw error
    return data
  }

  const { data, error } = await supabase
    .from('indicador_avance_anual')
    .upsert(payload, { onConflict: 'indicador_id,anio' })
    .select()
    .single()
  if (error) throw error
  return data
}

export async function deleteAvance(id) {
  const { error } = await supabase.from('indicador_avance_anual').delete().eq('id', id)
  if (error) throw error
}

export async function bulkUpsertAvances(filas) {
  const { data, error } = await supabase
    .from('indicador_avance_anual')
    .upsert(filas, { onConflict: 'indicador_id,anio' })
    .select()
  if (error) throw error
  return data
}

// ─── Provisión de anticonceptivos ─────────────────────────────────────────

export async function fetchProvisionAdmin({
  page = 1,
  pageSize = DEFAULT_PAGE_SIZE,
  anio,
  riss_id,
  busqueda
} = {}) {
  const { desde, hasta } = rangoPagina(page, pageSize)

  let query = supabase
    .from('provision_consumo')
    .select(
      `
      id,
      nombre_establecimiento,
      tipo_establecimiento,
      mes,
      anio,
      consumo,
      riss_id,
      municipio_id,
      metodo_id,
      riss (nombre),
      municipios (nombre),
      metodos_anticonceptivos (codigo, nombre)
    `,
      { count: 'exact' }
    )
    .order('anio', { ascending: false })
    .order('mes_numero')
    .order('nombre_establecimiento')

  if (anio) query = query.eq('anio', anio)
  if (riss_id) query = query.eq('riss_id', riss_id)
  if (busqueda) query = query.ilike('nombre_establecimiento', `%${busqueda}%`)

  const { data, error, count } = await query.range(desde, hasta)
  if (error) throw error
  return { data: data ?? [], total: count ?? 0 }
}

export async function upsertProvision(fila) {
  const payload = {
    nombre_establecimiento: fila.nombre_establecimiento,
    tipo_establecimiento: fila.tipo_establecimiento ?? null,
    riss_id: fila.riss_id ?? null,
    municipio_id: fila.municipio_id ?? null,
    mes: fila.mes,
    anio: fila.anio,
    metodo_id: fila.metodo_id,
    consumo: fila.consumo ?? 0
  }

  if (fila.id) {
    const { data, error } = await supabase
      .from('provision_consumo')
      .update(payload)
      .eq('id', fila.id)
      .select()
      .single()
    if (error) throw error
    return data
  }

  const { data, error } = await supabase
    .from('provision_consumo')
    .upsert(payload, { onConflict: 'nombre_establecimiento,metodo_id,mes,anio' })
    .select()
    .single()
  if (error) throw error
  return data
}

export async function deleteProvision(id) {
  const { error } = await supabase.from('provision_consumo').delete().eq('id', id)
  if (error) throw error
}

export async function bulkUpsertProvision(filas) {
  const { data, error } = await supabase
    .from('provision_consumo')
    .upsert(filas, { onConflict: 'nombre_establecimiento,metodo_id,mes,anio' })
    .select()
  if (error) throw error
  return data
}

// ─── Estándares de calidad ─────────────────────────────────────────────────

export async function fetchEstandaresAdmin({
  page = 1,
  pageSize = DEFAULT_PAGE_SIZE,
  departamento,
  municipio,
  busqueda
} = {}) {
  const { desde, hasta } = rangoPagina(page, pageSize)

  let query = supabase
    .from('estandares_calidad')
    .select('*', { count: 'exact' })
    .order('departamento')
    .order('establecimiento_nombre')
    .order('cod_indicador')

  if (departamento) query = query.eq('departamento', departamento)
  if (municipio) query = query.eq('municipio', municipio)
  if (busqueda) query = query.ilike('establecimiento_nombre', `%${busqueda}%`)

  const { data, error, count } = await query.range(desde, hasta)
  if (error) throw error
  return { data: data ?? [], total: count ?? 0 }
}

export async function upsertEstandar(fila) {
  const payload = {
    nivel: fila.nivel ?? null,
    departamento: fila.departamento ?? null,
    municipio: fila.municipio ?? null,
    comunidad: fila.comunidad ?? null,
    establecimiento_nombre: fila.establecimiento_nombre,
    tipo_establecimiento: fila.tipo_establecimiento ?? null,
    cod_eje: fila.cod_eje ?? null,
    eje_nombre: fila.eje_nombre ?? null,
    cod_indicador: fila.cod_indicador,
    descripcion_indicador: fila.descripcion_indicador,
    calificacion: fila.calificacion ?? null,
    cumple: fila.cumple ?? false,
    fecha_evaluacion: fila.fecha_evaluacion ?? null
  }

  if (fila.id) {
    const { data, error } = await supabase
      .from('estandares_calidad')
      .update(payload)
      .eq('id', fila.id)
      .select()
      .single()
    if (error) throw error
    return data
  }

  const { data, error } = await supabase
    .from('estandares_calidad')
    .upsert(payload, { onConflict: 'establecimiento_nombre,cod_indicador' })
    .select()
    .single()
  if (error) throw error
  return data
}

export async function deleteEstandar(id) {
  const { error } = await supabase.from('estandares_calidad').delete().eq('id', id)
  if (error) throw error
}

export async function bulkUpsertEstandares(filas) {
  const { data, error } = await supabase
    .from('estandares_calidad')
    .upsert(filas, { onConflict: 'establecimiento_nombre,cod_indicador' })
    .select()
  if (error) throw error
  return data
}

// ─── KPI Resultados ───────────────────────────────────────────────────────

export async function fetchKpiResultados({
  page = 1,
  pageSize = DEFAULT_PAGE_SIZE,
  anio,
  outputId,
  busqueda
} = {}) {
  const { desde, hasta } = rangoPagina(page, pageSize)
  const needsInner = outputId || busqueda
  const joinKpi = needsInner ? 'indicadores_kpi!inner' : 'indicadores_kpi'

  let query = supabase
    .from('indicadores_kpi_resultados')
    .select(
      `
      id,
      indicador_kpi_id,
      anio,
      valor,
      ${joinKpi} (
        codigo,
        descripcion,
        output_id,
        outputs (codigo, nombre)
      )
    `,
      { count: 'exact' }
    )
    .order('anio', { ascending: false })
    .order('indicador_kpi_id')

  if (anio) query = query.eq('anio', anio)
  if (outputId) query = query.eq('indicadores_kpi.output_id', outputId)
  if (busqueda) query = query.ilike('indicadores_kpi.descripcion', `%${busqueda}%`)

  const { data, error, count } = await query.range(desde, hasta)
  if (error) throw error
  return { data: data ?? [], total: count ?? 0 }
}

export async function upsertKpiResultado(fila) {
  const payload = {
    indicador_kpi_id: fila.indicador_kpi_id,
    anio: fila.anio,
    valor: fila.valor ?? null
  }

  if (fila.id) {
    const { data, error } = await supabase
      .from('indicadores_kpi_resultados')
      .update(payload)
      .eq('id', fila.id)
      .select()
      .single()
    if (error) throw error
    return data
  }

  const { data, error } = await supabase
    .from('indicadores_kpi_resultados')
    .upsert(payload, { onConflict: 'indicador_kpi_id,anio' })
    .select()
    .single()
  if (error) throw error
  return data
}

export async function deleteKpiResultado(id) {
  const { error } = await supabase.from('indicadores_kpi_resultados').delete().eq('id', id)
  if (error) throw error
}
