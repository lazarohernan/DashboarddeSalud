/**
 * Migra todos los datos locales a Supabase.
 * Uso: node scripts/seed-supabase.mjs
 */

import { readFileSync } from 'fs'
import { fileURLToPath } from 'url'
import { dirname, join } from 'path'
import { createClient } from '@supabase/supabase-js'
import ws from 'ws'

const __dirname = dirname(fileURLToPath(import.meta.url))
const root = join(__dirname, '..')

function loadEnv() {
  const envPath = join(root, '.env.local')
  const content = readFileSync(envPath, 'utf8')
  for (const line of content.split('\n')) {
    const trimmed = line.trim()
    if (!trimmed || trimmed.startsWith('#')) continue
    const [key, ...rest] = trimmed.split('=')
    if (key && rest.length) process.env[key.trim()] = rest.join('=').trim()
  }
}

loadEnv()

const url = process.env.VITE_SUPABASE_URL
const key = process.env.VITE_SUPABASE_ANON_KEY
const adminEmail = process.env.SEED_ADMIN_EMAIL || 'josuesolanocerrato@gmail.com'
const adminPassword = process.env.SEED_ADMIN_PASSWORD || 'LnobProyecto2026'

const supabase = createClient(url, key, {
  auth: { persistSession: false, autoRefreshToken: false },
  realtime: { transport: ws }
})

const { outputsLNOB } = await import(join(root, 'src/data/outputs_lnob.js'))
const { provisionLNOB } = await import(join(root, 'src/data/provision_lnob.js'))
const estandares = JSON.parse(readFileSync(join(root, 'src/data/estandares.json'), 'utf8'))
const { indicadoresPorOutput } = await import(join(root, 'src/data/indicadores.js'))
const {
  departamentos,
  municipios,
  comunidades,
  establecimientos,
  ejesCalidad
} = await import(join(root, 'src/data/catalogo.js'))

const ESTADOS_VALIDOS = new Set(['Completado', 'En Proceso', 'No Completado', 'No Aplica'])

const MUNICIPIO_DEPARTAMENTO = {
  'La Ceiba': 'Atlántida',
  Iriona: 'Colón',
  'Santa Fe': 'Gracias a Dios',
  Limón: 'Islas de la Bahía',
  'José Santos Guardiola': 'Islas de la Bahía',
  'Jose Santos Guardiola': 'Islas de la Bahía',
  'Santa Rosa de Aguán': 'Colón',
  'Santa Rosa de Aguan': 'Colón',
  'Bonito Occidental': 'Colón',
  Wampusirpi: 'Gracias a Dios'
}

function chunk(arr, size) {
  const out = []
  for (let i = 0; i < arr.length; i += size) out.push(arr.slice(i, i + size))
  return out
}

function parseFecha(fecha) {
  if (!fecha) return null
  const partes = String(fecha).split('/')
  if (partes.length !== 3) return null
  const mes = partes[0].padStart(2, '0')
  const dia = partes[1].padStart(2, '0')
  let anio = partes[2]
  if (anio.length === 2) anio = `20${anio}`
  return `${anio}-${mes}-${dia}`
}

function priorizado(valor) {
  return valor === 'Si' || valor === true
}

function estado(valor) {
  if (!valor || !ESTADOS_VALIDOS.has(valor)) return null
  return valor
}

async function login() {
  const { error } = await supabase.auth.signInWithPassword({
    email: adminEmail,
    password: adminPassword
  })
  if (error) throw new Error(`Login falló: ${error.message}`)
}

async function limpiarDatos() {
  const tablas = [
    'indicadores_kpi_resultados',
    'indicadores_kpi',
    'indicador_avance_anual',
    'indicadores_actividad',
    'provision_consumo',
    'estandares_calidad',
    'establecimientos',
    'comunidades',
    'municipios',
    'metodos_anticonceptivos',
    'ejes_calidad',
    'outputs'
  ]
  for (const tabla of tablas) {
    const { error } = await supabase.from(tabla).delete().gte('id', 1)
    if (error) {
      const { error: e2 } = await supabase.from(tabla).delete().neq('id', '00000000-0000-0000-0000-000000000000')
      if (e2) console.warn(`Limpiar ${tabla}:`, e2.message)
    }
  }
}

async function getMap(tabla, cols = 'id, nombre') {
  const { data, error } = await supabase.from(tabla).select(cols)
  if (error) throw error
  return data
}

async function main() {
  console.log('Iniciando migración...')
  await login()
  console.log('Sesión admin OK')

  await limpiarDatos()
  console.log('Tablas limpiadas')

  const deptos = await getMap('departamentos')
  const deptoPorNombre = Object.fromEntries(deptos.map((d) => [d.nombre, d.id]))

  const fondos = await getMap('fondos')
  const fondoPorNombre = Object.fromEntries(fondos.map((f) => [f.nombre, f.id]))

  const rissList = await getMap('riss')
  const rissPorNombre = Object.fromEntries(rissList.map((r) => [r.nombre, r.id]))

  const tipos = await getMap('tipos_establecimiento')
  const tipoPorNombre = Object.fromEntries(tipos.map((t) => [t.nombre, t.id]))

  // Municipios
  const municipioSet = new Map()
  for (const m of municipios) {
    const depto = departamentos.find((d) => d.id === m.departamentoId)?.nombre
    municipioSet.set(m.nombre, depto)
  }
  for (const row of provisionLNOB) {
    if (!municipioSet.has(row.municipio)) {
      municipioSet.set(row.municipio, MUNICIPIO_DEPARTAMENTO[row.municipio] || 'Colón')
    }
  }

  const municipioRows = [...municipioSet.entries()].map(([nombre, deptoNombre]) => ({
    nombre,
    departamento_id: deptoPorNombre[deptoNombre]
  }))
  const municipiosUnicos = [
    ...new Map(municipioRows.map((m) => [`${m.nombre}|${m.departamento_id}`, m])).values()
  ]
  const { error: munErr } = await supabase.from('municipios').upsert(municipiosUnicos, {
    onConflict: 'nombre,departamento_id'
  })
  if (munErr) throw munErr

  const municipiosDb = await supabase.from('municipios').select('id, nombre, departamento_id')
  if (municipiosDb.error) throw municipiosDb.error
  const municipioPorNombre = Object.fromEntries(municipiosDb.data.map((m) => [m.nombre, m.id]))

  // Comunidades
  const comunidadRows = comunidades.map((c) => ({
    nombre: c.nombre,
    municipio_id: municipioPorNombre[municipios.find((m) => m.id === c.municipioId)?.nombre]
  }))
  if (comunidadRows.length) {
    const { error } = await supabase.from('comunidades').upsert(comunidadRows, {
      onConflict: 'nombre,municipio_id'
    })
    if (error) throw error
  }

  // Ejes
  const { error: ejesErr } = await supabase.from('ejes_calidad').upsert(
    ejesCalidad.map((e) => ({ codigo: e.codigo, nombre: e.nombre })),
    { onConflict: 'codigo' }
  )
  if (ejesErr) throw ejesErr

  const ejesDb = await getMap('ejes_calidad', 'id, codigo')
  const ejePorCodigo = Object.fromEntries(ejesDb.map((e) => [e.codigo, e.id]))

  // Métodos anticonceptivos (desde provisión)
  const metodosUnicos = [...new Set(provisionLNOB.map((r) => r.tipoMetodo))]
  const metodoRows = metodosUnicos.map((nombre) => ({
    nombre,
    codigo: provisionLNOB.find((r) => r.tipoMetodo === nombre)?.codigo ?? null
  }))
  const metodosDedup = [...new Map(metodoRows.map((m) => [m.nombre, m])).values()]
  for (const batch of chunk(metodosDedup, 50)) {
    const { error } = await supabase.from('metodos_anticonceptivos').upsert(batch, { onConflict: 'nombre' })
    if (error) throw error
  }

  const metodosDb = await getMap('metodos_anticonceptivos', 'id, nombre')
  const metodoPorNombre = Object.fromEntries(metodosDb.map((m) => [m.nombre, m.id]))

  // Establecimientos catálogo
  const comunidadesDb = await supabase.from('comunidades').select('id, nombre, municipio_id')
  const comunidadId = (nombre, municipioId) =>
    comunidadesDb.data?.find((c) => c.nombre === nombre && c.municipio_id === municipioId)?.id ?? null

  for (const e of establecimientos) {
    const munNombre = municipios.find((m) => m.id === e.municipioId)?.nombre
    const munId = municipioPorNombre[munNombre]
    const comNombre = comunidades.find((c) => c.id === e.comunidadId)?.nombre
    const { error } = await supabase.from('establecimientos').insert({
      nombre: e.nombre,
      tipo_establecimiento_id: tipoPorNombre[e.tipo] ?? null,
      municipio_id: munId ?? null,
      departamento_id: e.departamentoId ?? null,
      riss_id: null,
      comunidad_id: comNombre ? comunidadId(comNombre, munId) : null
    })
    if (error && !error.message.includes('duplicate')) console.warn('Establecimiento:', error.message)
  }

  // Outputs
  const outputsUnicos = new Map()
  for (const row of outputsLNOB) {
    if (!outputsUnicos.has(row.codigoOutput)) outputsUnicos.set(row.codigoOutput, row.output)
  }
  const outputRows = [...outputsUnicos.entries()].map(([codigo, nombre]) => ({ codigo, nombre }))
  const { error: outErr } = await supabase.from('outputs').upsert(outputRows, { onConflict: 'codigo' })
  if (outErr) throw outErr

  const outputsDb = await supabase.from('outputs').select('id, codigo')
  if (outputsDb.error) throw outputsDb.error
  const outputPorCodigo = Object.fromEntries(outputsDb.data.map((o) => [o.codigo, o.id]))

  // Indicadores actividad
  const indicadorRowsRaw = outputsLNOB.map((row) => ({
    output_id: outputPorCodigo[row.codigoOutput],
    fondo_id: fondoPorNombre[row.fondo],
    cod_actividad: row.codActividad || row.codigoIndicador,
    actividad_ingles: row.actividadIngles || null,
    actividad_espanol: row.actividadEspanol ?? row.actividadEspañol ?? row.actividad ?? null,
    codigo_indicador: row.codigoIndicador,
    descripcion_indicador: row.indicador
  }))
  const indicadorRows = [
    ...new Map(
      indicadorRowsRaw.map((r) => [`${r.output_id}|${r.codigo_indicador}|${r.fondo_id}`, r])
    ).values()
  ]
  for (const batch of chunk(indicadorRows, 25)) {
    const { error } = await supabase.from('indicadores_actividad').upsert(batch, {
      onConflict: 'output_id,codigo_indicador,fondo_id'
    })
    if (error) throw error
  }

  const indicadoresDb = await supabase
    .from('indicadores_actividad')
    .select('id, codigo_indicador, output_id, fondo_id, outputs(codigo), fondos(nombre)')
  if (indicadoresDb.error) throw indicadoresDb.error

  const avanceRowsRaw = []
  for (const row of outputsLNOB) {
    const indId = indicadoresDb.data.find(
      (i) =>
        i.outputs?.codigo === row.codigoOutput &&
        i.codigo_indicador === row.codigoIndicador &&
        i.fondos?.nombre === row.fondo
    )?.id
    if (!indId) continue
    for (const [anio, datos] of Object.entries(row.anos || {})) {
      avanceRowsRaw.push({
        indicador_id: indId,
        anio: Number(anio),
        anio_referencia: datos.añoReferencia ?? null,
        priorizado: priorizado(datos.priorizado),
        estado: estado(datos.estado),
        resultado: datos.resultado != null ? String(datos.resultado) : null,
        observaciones: datos.observaciones ?? null
      })
    }
  }
  const avanceRows = [
    ...new Map(avanceRowsRaw.map((r) => [`${r.indicador_id}|${r.anio}`, r])).values()
  ]
  for (const batch of chunk(avanceRows, 100)) {
    const { error } = await supabase.from('indicador_avance_anual').upsert(batch, {
      onConflict: 'indicador_id,anio'
    })
    if (error) throw error
  }

  // Provisión
  const provisionRows = provisionLNOB.map((row) => ({
    nombre_establecimiento: row.nombreES,
    tipo_establecimiento: row.tipo,
    riss_id: rissPorNombre[row.RISS] ?? null,
    municipio_id: municipioPorNombre[row.municipio] ?? null,
    mes: row.mes,
    anio: row.ano,
    metodo_id: metodoPorNombre[row.tipoMetodo],
    consumo: row.consumo
  }))
  for (const batch of chunk(provisionRows, 100)) {
    const { error } = await supabase.from('provision_consumo').insert(batch)
    if (error) throw error
  }

  // Estándares
  const estandarRows = estandares.datos.map((row) => ({
    nivel: row.nivel,
    departamento: row.departamento,
    municipio: row.municipio,
    comunidad: row.comunidad,
    establecimiento_nombre: row.establecimientoNombre,
    tipo_establecimiento: row.tipoEstablecimiento,
    eje_id: ejePorCodigo[row.codEje] ?? null,
    cod_eje: row.codEje,
    eje_nombre: row.ejeNombre,
    cod_indicador: row.codIndicador,
    descripcion_indicador: row.indicador,
    calificacion: row.calificacion,
    cumple: row.cumple,
    fecha_evaluacion: parseFecha(row.fecha)
  }))
  for (const batch of chunk(estandarRows, 50)) {
    const { error } = await supabase.from('estandares_calidad').insert(batch)
    if (error) throw error
  }

  // KPIs
  for (const [codOutput, bloque] of Object.entries(indicadoresPorOutput)) {
    const outputId = outputPorCodigo[parseInt(codOutput, 10)]
    for (const ind of bloque.indicadores) {
      const { data: kpi, error: kpiErr } = await supabase
        .from('indicadores_kpi')
        .upsert(
          { output_id: outputId, codigo: ind.codigo, descripcion: ind.nombre },
          { onConflict: 'output_id,codigo' }
        )
        .select('id')
        .single()
      if (kpiErr) throw kpiErr

      const resultadoRows = Object.entries(ind.años || {}).map(([anio, valor]) => ({
        indicador_kpi_id: kpi.id,
        anio: Number(anio),
        valor: valor ?? null
      }))
      if (resultadoRows.length) {
        const { error } = await supabase
          .from('indicadores_kpi_resultados')
          .upsert(resultadoRows, { onConflict: 'indicador_kpi_id,anio' })
        if (error) throw error
      }
    }
  }

  console.log('Migración completada:')
  console.log('  Outputs:', outputRows.length)
  console.log('  Indicadores actividad:', indicadorRows.length)
  console.log('  Avance anual:', avanceRows.length)
  console.log('  Provisión:', provisionRows.length)
  console.log('  Estándares:', estandarRows.length)
}

main().catch((err) => {
  console.error('Error en migración:', err.message)
  process.exit(1)
})
