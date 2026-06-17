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
          placeholder="Buscar establecimiento..."
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
        <option v-for="a in anios" :key="a" :value="a">{{ a }}</option>
      </select>
      <select v-model="filtroRiss" class="select-field w-48" @change="reiniciarYCargar" title="Red Integrada de Servicios de Salud">
        <option value="">Todas las RISS</option>
        <option v-for="r in props.catalogos.riss" :key="r.id" :value="r.id">{{ r.nombre }}</option>
      </select>
      <button
        type="button"
        @click="cargar"
        class="inline-flex items-center gap-1.5 px-3 py-2 text-sm font-medium text-gray-600 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors"
      >
        <RefreshCw class="w-4 h-4 shrink-0" />
        Actualizar
      </button>
      <button @click="abrirFormulario(null)" class="btn-primary ml-auto">
        <PlusCircle class="w-4 h-4 mr-1.5" /> Nuevo registro
      </button>
    </div>

    <!-- Carga Excel -->
    <ExcelUpload
      titulo="Provisión anticonceptivos desde Excel"
      :columnas="columnasExcel"
      :importando="importandoExcel"
      :resultado-import="resultadoImportExcel"
      :validar-fila="validarFilaProvision"
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
            <th class="th">Establecimiento</th>
            <th class="th">
              <div>RISS</div>
              <div class="text-[10px] font-normal opacity-60 whitespace-nowrap">Red Integrada de Servicios de Salud</div>
            </th>
            <th class="th">Municipio</th>
            <th class="th">Periodo</th>
            <th class="th">
              <div>Método</div>
              <div class="text-[10px] font-normal opacity-60">MAC</div>
            </th>
            <th class="th text-right">Consumo</th>
            <th class="th w-20">Acciones</th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="fila in filas"
            :key="fila.id"
            class="border-t border-gray-100 hover:bg-gray-50"
          >
            <td class="td text-xs">
              <p class="font-medium">{{ fila.nombre_establecimiento }}</p>
              <p class="text-gray-400">{{ fila.tipo_establecimiento }}</p>
            </td>
            <td class="td text-xs text-gray-600">{{ fila.riss?.nombre ?? '—' }}</td>
            <td class="td text-xs text-gray-600">{{ fila.municipios?.nombre ?? '—' }}</td>
            <td class="td text-xs font-mono">{{ fila.mes }} {{ fila.anio }}</td>
            <td class="td text-xs">{{ fila.metodos_anticonceptivos?.nombre ?? '—' }}</td>
            <td class="td text-right font-medium">{{ Number(fila.consumo).toLocaleString() }}</td>
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
            <td colspan="7" class="td text-center text-gray-400 py-6">No hay registros</td>
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

    <!-- Modal -->
    <ModalFormulario
      v-if="mostrarModal"
      :titulo="form.id ? 'Editar registro' : 'Nuevo registro'"
      @cerrar="mostrarModal = false"
      @guardar="guardar"
      :guardando="guardando"
    >
      <div class="space-y-4">
        <div>
          <label class="label">Nombre del establecimiento *</label>
          <input v-model="form.nombre_establecimiento" type="text" class="input-field" required />
        </div>
        <div>
          <label class="label">Tipo de establecimiento</label>
          <input v-model="form.tipo_establecimiento" type="text" class="input-field" placeholder="Ej. CESAMO, CESAR..." />
        </div>
        <div class="grid grid-cols-2 gap-4">
          <div>
            <label class="label">RISS <span class="font-normal text-gray-400">(Red Integrada de Servicios de Salud)</span></label>
            <select v-model.number="form.riss_id" class="select-field">
              <option value="">Sin RISS</option>
              <option v-for="r in props.catalogos.riss" :key="r.id" :value="r.id">{{ r.nombre }}</option>
            </select>
          </div>
          <div>
            <label class="label">Municipio</label>
            <select v-model.number="form.municipio_id" class="select-field">
              <option value="">Sin municipio</option>
              <option v-for="m in props.catalogos.municipios" :key="m.id" :value="m.id">
                {{ m.nombre }} ({{ m.departamentos?.nombre }})
              </option>
            </select>
          </div>
        </div>
        <div class="grid grid-cols-2 gap-4">
          <div>
            <label class="label">Mes *</label>
            <select v-model="form.mes" class="select-field" required>
              <option v-for="m in meses" :key="m" :value="m">{{ m }}</option>
            </select>
          </div>
          <div>
            <label class="label">Año *</label>
            <select v-model.number="form.anio" class="select-field" required>
              <option v-for="a in anios" :key="a" :value="a">{{ a }}</option>
            </select>
          </div>
        </div>
        <div class="grid grid-cols-2 gap-4">
          <div>
            <label class="label">Método anticonceptivo *</label>
            <select v-model.number="form.metodo_id" class="select-field" required>
              <option value="">Selecciona</option>
              <option v-for="m in props.catalogos.metodos" :key="m.id" :value="m.id">
                {{ m.nombre }}
              </option>
            </select>
          </div>
          <div>
            <label class="label">Consumo (unidades) *</label>
            <input v-model.number="form.consumo" type="number" min="0" step="0.01" class="input-field" required />
          </div>
        </div>
      </div>
    </ModalFormulario>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { PlusCircle, Pencil, Trash2, RefreshCw, Search, X } from 'lucide-vue-next'
import ExcelUpload from '../../components/admin/ExcelUpload.vue'
import ModalFormulario from '../../components/admin/ModalFormulario.vue'
import Pagination from '../../components/Pagination.vue'
import { fetchProvisionAdmin, upsertProvision, deleteProvision, bulkUpsertProvision } from '../../services/adminService'
import { parsearError, esAnioValido, esSi, enLotes } from '../../utils/importUtils'
import { useToast } from '../../composables/useToast'
import { useConfirm } from '../../composables/useConfirm'

const toast = useToast()
const { confirmar } = useConfirm()

const props = defineProps({
  catalogos: { type: Object, default: () => ({ riss: [], municipios: [], metodos: [] }) }
})

const filas = ref([])
const total = ref(0)
const pagina = ref(1)
const tamanoPagina = ref(25)
const loading = ref(false)
const error = ref(null)
const mostrarModal = ref(false)
const guardando = ref(false)
const filtroAnio = ref('')
const filtroRiss = ref('')
const filtroBusqueda = ref('')
const importandoExcel = ref(false)
const resultadoImportExcel = ref(null)

const anios = [2020, 2021, 2022, 2023, 2024, 2025, 2026, 2027, 2028]
const meses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']

const columnasExcel = [
  { campo: 'nombre_establecimiento', etiqueta: 'Nombre Establecimiento',     requerido: true  },
  { campo: 'tipo_establecimiento',   etiqueta: 'Tipo Establecimiento',        requerido: false },
  { campo: 'riss_nombre',            etiqueta: 'RISS (nombre)',               requerido: false },
  { campo: 'municipio_nombre',       etiqueta: 'Municipio (nombre)',          requerido: false },
  { campo: 'mes',                    etiqueta: 'Mes (ej. Enero)',             requerido: true  },
  { campo: 'anio',                   etiqueta: 'Año (ej. 2025)',              requerido: true  },
  { campo: 'metodo_codigo',          etiqueta: 'Código Método MAC (ej. DIU)', requerido: true  },
  { campo: 'consumo',                etiqueta: 'Consumo (unidades)',          requerido: true  }
]

const ejemploPlantilla = {
  nombre_establecimiento: 'CESAMO El Centro',
  tipo_establecimiento:   'CESAMO',
  riss_nombre:            'Atlántida',
  municipio_nombre:       'La Ceiba',
  mes:                    'Enero',
  anio:                   2025,
  metodo_codigo:          'DIU',
  consumo:                42
}

const formVacio = () => ({
  nombre_establecimiento: '',
  tipo_establecimiento: '',
  riss_id: '',
  municipio_id: '',
  mes: 'Enero',
  anio: 2025,
  metodo_id: '',
  consumo: 0
})

const form = ref(formVacio())

function reiniciarYCargar() {
  pagina.value = 1
  cargar()
}

async function cargar() {
  loading.value = true
  error.value = null
  try {
    const resultado = await fetchProvisionAdmin({
      page: pagina.value,
      pageSize: tamanoPagina.value,
      anio: filtroAnio.value ? Number(filtroAnio.value) : undefined,
      riss_id: filtroRiss.value ? Number(filtroRiss.value) : undefined,
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
  form.value = fila
    ? {
        id: fila.id,
        nombre_establecimiento: fila.nombre_establecimiento,
        tipo_establecimiento: fila.tipo_establecimiento ?? '',
        riss_id: fila.riss_id ?? '',
        municipio_id: fila.municipio_id ?? '',
        mes: fila.mes,
        anio: fila.anio,
        metodo_id: fila.metodo_id,
        consumo: fila.consumo
      }
    : formVacio()
  mostrarModal.value = true
}

async function guardar() {
  if (!form.value.nombre_establecimiento || !form.value.mes || !form.value.anio || !form.value.metodo_id) return
  guardando.value = true
  try {
    await upsertProvision(form.value)
    mostrarModal.value = false
    await cargar()
    toast.success('Registro de provisión guardado correctamente.')
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
    await deleteProvision(id)
    await cargar()
    toast.success('Registro eliminado.')
  } catch (e) {
    toast.error('Error al eliminar: ' + parsearError(e.message))
  }
}

function resolverRissId(nombre) {
  if (!nombre) return null
  return props.catalogos.riss.find(
    r => r.nombre.toLowerCase().trim() === String(nombre).toLowerCase().trim()
  )?.id ?? null
}

function resolverMunicipioId(nombre) {
  if (!nombre) return null
  return props.catalogos.municipios.find(
    m => m.nombre.toLowerCase().trim() === String(nombre).toLowerCase().trim()
  )?.id ?? null
}

function resolverMetodoId(codigo) {
  if (!codigo) return null
  return props.catalogos.metodos.find(
    m => String(m.codigo).toLowerCase().trim() === String(codigo).toLowerCase().trim()
      || m.nombre.toLowerCase().trim() === String(codigo).toLowerCase().trim()
  )?.id ?? null
}

function validarFilaProvision(row) {
  if (!String(row.nombre_establecimiento ?? '').trim())
    return 'nombre_establecimiento está vacío'
  if (!String(row.mes ?? '').trim())
    return 'mes está vacío'
  if (!esAnioValido(row.anio))
    return 'anio debe ser un número entre 2000 y 2100'
  if (!String(row.metodo_codigo ?? '').trim())
    return 'metodo_codigo está vacío'
  if (!resolverMetodoId(row.metodo_codigo))
    return `Método "${row.metodo_codigo}" no existe en el catálogo MAC`
  if (row.riss_nombre && !resolverRissId(row.riss_nombre))
    return `RISS "${row.riss_nombre}" no encontrada en el catálogo`
  if (row.municipio_nombre && !resolverMunicipioId(row.municipio_nombre))
    return `Municipio "${row.municipio_nombre}" no encontrado en el catálogo`
  return null
}

async function procesarExcel(datos) {
  if (!datos.length) {
    resultadoImportExcel.value = { ok: false, error: 'No hay filas válidas para importar.' }
    return
  }

  const filasMapeadas = datos.map(row => ({
    nombre_establecimiento: String(row.nombre_establecimiento ?? '').trim(),
    tipo_establecimiento:   row.tipo_establecimiento || null,
    riss_id:     resolverRissId(row.riss_nombre),
    municipio_id: resolverMunicipioId(row.municipio_nombre),
    mes:     String(row.mes ?? '').trim(),
    anio:    Number(row.anio),
    metodo_id: resolverMetodoId(row.metodo_codigo),
    consumo:   Number(row.consumo) || 0
  }))

  importandoExcel.value = true
  resultadoImportExcel.value = null
  try {
    for (const lote of enLotes(filasMapeadas, 200)) {
      await bulkUpsertProvision(lote)
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
