import { ref, onMounted } from 'vue'
import {
  fetchResultados,
  fetchProvision,
  fetchEstandares,
  fetchIndicadoresKpi,
  fetchCatalogos,
  fetchOutputs
} from '../services/dashboardData'

const TIMEOUT_MS = 25000
const REINTENTOS = 2
const BACKOFF_MS = 1200

const resultados = ref([])
const provision = ref([])
const estandares = ref([])
const indicadoresKpi = ref({})
const catalogos = ref({
  departamentos: [],
  municipios: [],
  tiposEstablecimiento: [],
  fondos: []
})
const outputs = ref([])
const loading = ref(true)
const error = ref(null)

let loaded = false
let cargandoPromise = null

const espera = (ms) => new Promise((r) => setTimeout(r, ms))

function conTimeout(promesa, etiqueta) {
  return Promise.race([
    promesa,
    new Promise((_, reject) => {
      setTimeout(() => reject(new Error(`Tiempo agotado al cargar ${etiqueta}`)), TIMEOUT_MS)
    })
  ])
}

// Ejecuta una tarea con timeout + reintentos automáticos con backoff.
async function cargarConReintentos(etiqueta, generarPromesa) {
  let ultimoError
  for (let intento = 0; intento <= REINTENTOS; intento++) {
    try {
      // Importante: generarPromesa() crea una NUEVA petición en cada intento
      return await conTimeout(generarPromesa(), etiqueta)
    } catch (err) {
      ultimoError = err
      if (intento < REINTENTOS) {
        await espera(BACKOFF_MS * (intento + 1))
      }
    }
  }
  throw ultimoError ?? new Error(`Error al cargar ${etiqueta}`)
}

async function cargarDatos(force = false) {
  if (loaded && !force) {
    loading.value = false
    return
  }

  if (cargandoPromise && !force) {
    return cargandoPromise
  }

  loading.value = true
  error.value = null

  cargandoPromise = (async () => {
    try {
      const tareas = [
        ['resultados', fetchResultados, (v) => (resultados.value = v)],
        ['provisión', fetchProvision, (v) => (provision.value = v)],
        ['estándares', fetchEstandares, (v) => (estandares.value = v)],
        ['indicadores KPI', fetchIndicadoresKpi, (v) => (indicadoresKpi.value = v)],
        ['catálogos', fetchCatalogos, (v) => (catalogos.value = v)],
        ['outputs', fetchOutputs, (v) => (outputs.value = v)]
      ]

      const resultadosCarga = await Promise.allSettled(
        tareas.map(async ([etiqueta, fn, asignar]) => {
          const datos = await cargarConReintentos(etiqueta, fn)
          asignar(datos)
          return etiqueta
        })
      )

      const fallidas = resultadosCarga
        .map((r, i) => ({ r, etiqueta: tareas[i][0] }))
        .filter(({ r }) => r.status === 'rejected')

      if (fallidas.length === tareas.length) {
        // Falló todo: muestra error con detalle del primero
        const primera = fallidas[0].r.reason
        throw primera ?? new Error('No se pudo conectar con el servidor')
      }

      if (fallidas.length > 0) {
        // Falla parcial: registra pero deja ver lo que sí cargó
        console.warn(
          'Algunas secciones no cargaron:',
          fallidas.map((f) => f.etiqueta).join(', ')
        )
      }

      loaded = true
    } catch (err) {
      const mensaje = err?.message ?? 'Error desconocido'
      error.value = `No se pudieron cargar los datos (${mensaje}). Intenta recargar la página.`
      console.error('Error cargando datos del dashboard:', err)
    } finally {
      loading.value = false
      cargandoPromise = null
    }
  })()

  return cargandoPromise
}

function iniciarCargaSiHaceFalta() {
  if (loaded) {
    loading.value = false
    return
  }
  if (!cargandoPromise) {
    cargarDatos()
  }
}

export function useDashboardData() {
  // También en setup, no solo en onMounted: tras HMR el componente no se
  // vuelve a montar y onMounted no corre otra vez.
  iniciarCargaSiHaceFalta()

  onMounted(() => {
    iniciarCargaSiHaceFalta()
  })

  if (import.meta.hot) {
    import.meta.hot.accept(() => {
      loaded = false
      cargarDatos(true)
    })
  }

  return {
    resultados,
    provision,
    estandares,
    indicadoresKpi,
    catalogos,
    outputs,
    loading,
    error,
    recargar: () => cargarDatos(true)
  }
}
