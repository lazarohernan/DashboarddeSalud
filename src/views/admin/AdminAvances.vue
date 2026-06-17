<template>
  <div class="space-y-6">
    <!-- Toolbar -->
    <div class="flex flex-wrap items-center gap-3">
      <!-- Búsqueda -->
      <div class="relative">
        <Search class="absolute left-2.5 top-1/2 -translate-y-1/2 w-3.5 h-3.5 text-gray-400 pointer-events-none" />
        <input
          v-model="filtroBusqueda"
          type="text"
          placeholder="Buscar indicador..."
          class="input-field pl-8 pr-7 w-52"
          @keyup.enter="reiniciarYCargar"
        />
        <button
          v-if="filtroBusqueda"
          type="button"
          class="absolute right-2 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
          @click="filtroBusqueda = ''; reiniciarYCargar()"
        >
          <X class="w-3.5 h-3.5" />
        </button>
      </div>
      <select v-model="filtroAnio" class="select-field w-32" @change="reiniciarYCargar">
        <option value="">Todos los años</option>
        <option v-for="a in aniosDisponibles" :key="a" :value="a">{{ a }}</option>
      </select>
      <select v-model="filtroOutput" class="select-field w-56" @change="reiniciarYCargar">
        <option value="">Todos los outputs</option>
        <option v-for="o in props.catalogos.outputs" :key="o.id" :value="o.codigo">
          Output {{ o.codigo }}
        </option>
      </select>
      <button @click="abrirFormulario(null)" class="btn-primary ml-auto">
        <PlusCircle class="w-4 h-4 mr-1.5" /> Nuevo registro
      </button>
    </div>

    <!-- Carga Excel -->
    <ExcelUpload
      titulo="Avances anuales desde Excel"
      :columnas="columnasExcel"
      :importando="importandoExcel"
      :resultado-import="resultadoImportExcel"
      :validar-fila="validarFilaAvance"
      :ejemplo-plantilla="ejemploPlantilla"
      @datos-parseados="procesarExcel"
      @limpiar-resultado="resultadoImportExcel = null"
    />

    <!-- Estado -->
    <div v-if="loading" class="text-center py-8 text-gray-500">
      <span class="inline-block w-5 h-5 border-2 border-orange-500 border-t-transparent rounded-full animate-spin mr-2" />
      Cargando...
    </div>
    <div v-else-if="error" class="alert-error">{{ error }}</div>

    <!-- Tabla -->
    <div v-else class="overflow-x-auto rounded-lg border border-gray-200">
      <table class="w-full text-sm text-left">
        <thead class="bg-slate-700 text-white">
          <tr>
            <th class="th">
              <div>Output</div>
              <div class="text-[10px] font-normal opacity-60">LNOB</div>
            </th>
            <th class="th">Cód. Indicador</th>
            <th class="th">Descripción</th>
            <th class="th">Año</th>
            <th class="th">Estado</th>
            <th class="th">
              <div>Priorizado</div>
              <div class="text-[10px] font-normal opacity-60">LNOB</div>
            </th>
            <th class="th">Resultado</th>
            <th class="th w-20">Acciones</th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="fila in filas"
            :key="fila.id"
            class="border-t border-gray-100 hover:bg-gray-50"
          >
            <td class="td text-xs text-gray-500">{{ fila.indicadores_actividad?.outputs?.codigo }}</td>
            <td class="td font-mono text-xs">{{ fila.indicadores_actividad?.codigo_indicador }}</td>
            <td class="td text-xs max-w-xs truncate" :title="fila.indicadores_actividad?.descripcion_indicador">
              {{ fila.indicadores_actividad?.descripcion_indicador }}
            </td>
            <td class="td font-medium">{{ fila.anio }}</td>
            <td class="td">
              <span :class="badgeEstado(fila.estado)">{{ fila.estado ?? '—' }}</span>
            </td>
            <td class="td text-center">
              <CheckCircle v-if="fila.priorizado" class="w-4 h-4 text-green-500 mx-auto" />
              <span v-else class="text-gray-300">—</span>
            </td>
            <td class="td text-xs max-w-xs truncate text-gray-600" :title="fila.resultado">
              {{ fila.resultado ?? '—' }}
            </td>
            <td class="td">
              <div class="flex gap-1">
                <button @click="abrirFormulario(fila)" class="icon-btn text-blue-600 hover:text-blue-800">
                  <Pencil class="w-4 h-4" />
                </button>
                <button @click="confirmarEliminar(fila.id)" class="icon-btn text-red-500 hover:text-red-700">
                  <Trash2 class="w-4 h-4" />
                </button>
              </div>
            </td>
          </tr>
          <tr v-if="filas.length === 0">
            <td colspan="8" class="td text-center text-gray-400 py-6">No hay registros para mostrar</td>
          </tr>
        </tbody>
      </table>
    </div>

    <Pagination
      v-if="!loading && !error"
      v-model:page="pagina"
      v-model:page-size="tamanoPagina"
      :total="total"
      @update:page="cargar"
      @update:page-size="reiniciarYCargar"
    />

    <!-- Modal formulario -->
    <ModalFormulario
      v-if="mostrarModal"
      :titulo="editando?.id ? 'Editar avance' : 'Nuevo avance'"
      @cerrar="mostrarModal = false"
      @guardar="guardar"
      :guardando="guardando"
    >
      <div class="space-y-4">
        <div>
          <label class="label">Indicador <span class="font-normal text-gray-400">(LNOB)</span> *</label>
          <select v-model="form.indicador_id" class="select-field" required>
            <option value="">Selecciona un indicador</option>
            <option v-for="ind in props.catalogos.indicadores" :key="ind.id" :value="ind.id">
              [Output {{ ind.outputs?.codigo }}] {{ ind.codigo_indicador }} — {{ ind.descripcion_indicador?.substring(0, 70) }}...
            </option>
          </select>
        </div>
        <div class="grid grid-cols-2 gap-4">
          <div>
            <label class="label">Año *</label>
            <select v-model.number="form.anio" class="select-field" required>
              <option v-for="a in aniosFormulario" :key="a" :value="a">{{ a }}</option>
            </select>
          </div>
          <div>
            <label class="label">Año de referencia</label>
            <input v-model.number="form.anio_referencia" type="number" class="input-field" placeholder="Ej. 50" />
          </div>
        </div>
        <div class="grid grid-cols-2 gap-4">
          <div>
            <label class="label">Estado</label>
            <select v-model="form.estado" class="select-field">
              <option value="">Sin estado</option>
              <option>Completado</option>
              <option>En Proceso</option>
              <option>No Completado</option>
              <option>No Aplica</option>
            </select>
          </div>
          <div class="flex items-end pb-1">
            <label class="flex items-center gap-2 cursor-pointer">
              <input v-model="form.priorizado" type="checkbox" class="w-4 h-4 accent-orange-500" />
              <span class="text-sm font-medium text-gray-700">Priorizado LNOB</span>
            </label>
          </div>
        </div>
        <div>
          <label class="label">Resultado</label>
          <textarea v-model="form.resultado" class="input-field" rows="2" placeholder="Describe el resultado logrado..." />
        </div>
        <div>
          <label class="label">Observaciones</label>
          <textarea v-model="form.observaciones" class="input-field" rows="2" placeholder="Notas adicionales..." />
        </div>
      </div>
    </ModalFormulario>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { PlusCircle, Pencil, Trash2, CheckCircle, Search, X } from 'lucide-vue-next'
import ExcelUpload from '../../components/admin/ExcelUpload.vue'
import ModalFormulario from '../../components/admin/ModalFormulario.vue'
import Pagination from '../../components/Pagination.vue'
import { fetchAvances, upsertAvance, deleteAvance, bulkUpsertAvances } from '../../services/adminService'
import { parsearError, esAnioValido, esSi, enLotes } from '../../utils/importUtils'
import { useToast } from '../../composables/useToast'
import { useConfirm } from '../../composables/useConfirm'

const toast = useToast()
const { confirmar } = useConfirm()

const props = defineProps({
  catalogos: { type: Object, default: () => ({ outputs: [], indicadores: [] }) }
})

const filas = ref([])
const total = ref(0)
const pagina = ref(1)
const tamanoPagina = ref(25)
const loading = ref(false)
const error = ref(null)
const mostrarModal = ref(false)
const guardando = ref(false)
const editando = ref(null)
const filtroAnio = ref('')
const filtroOutput = ref('')
const filtroBusqueda = ref('')
const importandoExcel = ref(false)
const resultadoImportExcel = ref(null)

const outputIdSeleccionado = computed(() => {
  if (!filtroOutput.value) return undefined
  const output = props.catalogos.outputs?.find(
    (o) => String(o.codigo) === String(filtroOutput.value)
  )
  return output?.id
})

const aniosDisponibles = [2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030]
const aniosFormulario = [2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030]

const formVacio = () => ({
  indicador_id: '',
  anio: 2025,
  anio_referencia: null,
  priorizado: false,
  estado: '',
  resultado: '',
  observaciones: ''
})

const form = ref(formVacio())

const columnasExcel = [
  { campo: 'indicador_codigo', etiqueta: 'Código Indicador (ej. 1.1.2)', requerido: true },
  { campo: 'anio',             etiqueta: 'Año (ej. 2025)',               requerido: true },
  { campo: 'anio_referencia',  etiqueta: 'Año Referencia',               requerido: false },
  { campo: 'priorizado',       etiqueta: 'Priorizado (SI/NO)',            requerido: false },
  { campo: 'estado',           etiqueta: 'Estado',                       requerido: false },
  { campo: 'resultado',        etiqueta: 'Resultado',                    requerido: false },
  { campo: 'observaciones',    etiqueta: 'Observaciones',                requerido: false }
]

const ejemploPlantilla = {
  indicador_codigo: '1.1.2',
  anio: 2025,
  anio_referencia: '',
  priorizado: 'SI',
  estado: 'En Proceso',
  resultado: 'Se alcanzó el 80% de la meta',
  observaciones: 'Pendiente revisión final'
}

function reiniciarYCargar() {
  pagina.value = 1
  cargar()
}

function badgeEstado(estado) {
  const base = 'px-2 py-0.5 rounded-full text-xs font-medium'
  if (estado === 'Completado') return `${base} bg-green-100 text-green-700`
  if (estado === 'En Proceso') return `${base} bg-blue-100 text-blue-700`
  if (estado === 'No Completado') return `${base} bg-red-100 text-red-700`
  if (estado === 'No Aplica') return `${base} bg-gray-100 text-gray-500`
  return `${base} bg-gray-100 text-gray-400`
}

async function cargar() {
  loading.value = true
  error.value = null
  try {
    const resultado = await fetchAvances({
      page: pagina.value,
      pageSize: tamanoPagina.value,
      anio: filtroAnio.value ? Number(filtroAnio.value) : undefined,
      outputId: outputIdSeleccionado.value,
      busqueda: filtroBusqueda.value.trim() || undefined
    })
    filas.value = resultado.data
    total.value = resultado.total
  } catch (e) {
    error.value = e.message
  } finally {
    loading.value = false
  }
}

function abrirFormulario(fila) {
  editando.value = fila
  form.value = fila
    ? {
        id: fila.id,
        indicador_id: fila.indicador_id,
        anio: fila.anio,
        anio_referencia: fila.anio_referencia,
        priorizado: fila.priorizado,
        estado: fila.estado ?? '',
        resultado: fila.resultado ?? '',
        observaciones: fila.observaciones ?? ''
      }
    : formVacio()
  mostrarModal.value = true
}

async function guardar() {
  if (!form.value.indicador_id || !form.value.anio) return
  guardando.value = true
  try {
    await upsertAvance(form.value)
    mostrarModal.value = false
    await cargar()
    toast.success('Avance guardado correctamente.')
  } catch (e) {
    toast.error('Error al guardar: ' + parsearError(e.message))
  } finally {
    guardando.value = false
  }
}

async function confirmarEliminar(id) {
  const ok = await confirmar({
    titulo: 'Eliminar registro',
    mensaje: 'Esta acción no se puede deshacer.',
    textoConfirmar: 'Eliminar'
  })
  if (!ok) return
  try {
    await deleteAvance(id)
    await cargar()
    toast.success('Registro eliminado.')
  } catch (e) {
    toast.error('Error al eliminar: ' + parsearError(e.message))
  }
}

function resolverIndicadorId(codigo) {
  const ind = props.catalogos.indicadores.find(
    i => String(i.codigo_indicador).trim() === String(codigo ?? '').trim()
  )
  return ind?.id ?? null
}

function validarFilaAvance(row) {
  if (!String(row.indicador_codigo ?? '').trim())
    return 'indicador_codigo está vacío'
  if (!resolverIndicadorId(row.indicador_codigo))
    return `Código "${row.indicador_codigo}" no existe en el catálogo de indicadores`
  if (!esAnioValido(row.anio))
    return 'anio debe ser un número entre 2000 y 2100'
  if (row.anio_referencia && !esAnioValido(row.anio_referencia))
    return 'anio_referencia no es un año válido'
  return null
}

async function procesarExcel(datos) {
  if (!datos.length) {
    resultadoImportExcel.value = { ok: false, error: 'No hay filas válidas para importar.' }
    return
  }

  const filasMapeadas = datos.map(row => ({
    indicador_id:    resolverIndicadorId(row.indicador_codigo),
    anio:            Number(row.anio),
    anio_referencia: row.anio_referencia ? Number(row.anio_referencia) : null,
    priorizado:      esSi(row.priorizado),
    estado:          row.estado || null,
    resultado:       row.resultado || null,
    observaciones:   row.observaciones || null
  }))

  importandoExcel.value = true
  resultadoImportExcel.value = null
  try {
    for (const lote of enLotes(filasMapeadas, 200)) {
      await bulkUpsertAvances(lote)
    }
    await cargar()
    resultadoImportExcel.value = { ok: true, total: filasMapeadas.length }
  } catch (e) {
    resultadoImportExcel.value = { ok: false, error: parsearError(e.message) }
  } finally {
    importandoExcel.value = false
  }
}

onMounted(cargar)
</script>
