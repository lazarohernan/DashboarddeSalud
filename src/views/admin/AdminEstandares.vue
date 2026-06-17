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
          class="input-field pl-8 pr-7 w-56"
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
      <select v-model="filtroDpto" class="select-field w-48" @change="reiniciarYCargar">
        <option value="">Todos los departamentos</option>
        <option v-for="d in props.catalogos.departamentos" :key="d.id" :value="d.nombre">
          {{ d.nombre }}
        </option>
      </select>
      <button @click="abrirFormulario(null)" class="btn-primary ml-auto">
        <PlusCircle class="w-4 h-4 mr-1.5" /> Nuevo registro
      </button>
    </div>

    <!-- Carga Excel -->
    <ExcelUpload
      titulo="Estándares de calidad desde Excel"
      :columnas="columnasExcel"
      :importando="importandoExcel"
      :resultado-import="resultadoImportExcel"
      :validar-fila="validarFilaEstandar"
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
            <th class="th">Departamento / Municipio</th>
            <th class="th">
              <div>Eje</div>
              <div class="text-[10px] font-normal opacity-60">ECA</div>
            </th>
            <th class="th">Cód. Indicador</th>
            <th class="th">Cumple</th>
            <th class="th">Fecha</th>
            <th class="th w-20">Acciones</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="fila in filas" :key="fila.id" class="border-t border-gray-100 hover:bg-gray-50">
            <td class="td text-xs">
              <p class="font-medium">{{ fila.establecimiento_nombre }}</p>
              <p class="text-gray-400">{{ fila.tipo_establecimiento }}</p>
            </td>
            <td class="td text-xs text-gray-600">
              {{ fila.departamento }}<br />
              <span class="text-gray-400">{{ fila.municipio }}</span>
            </td>
            <td class="td text-xs">{{ fila.cod_eje }} — {{ fila.eje_nombre }}</td>
            <td class="td font-mono text-xs">{{ fila.cod_indicador }}</td>
            <td class="td text-center">
              <span :class="fila.cumple ? 'badge-verde' : 'badge-rojo'">
                {{ fila.cumple ? 'Sí' : 'No' }}
              </span>
            </td>
            <td class="td text-xs text-gray-500">{{ fila.fecha_evaluacion ?? '—' }}</td>
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
      :titulo="form.id ? 'Editar estándar' : 'Nuevo estándar'"
      @cerrar="mostrarModal = false"
      @guardar="guardar"
      :guardando="guardando"
    >
      <div class="space-y-4">
        <div class="grid grid-cols-2 gap-4">
          <div>
            <label class="label">Departamento</label>
            <input v-model="form.departamento" type="text" class="input-field" />
          </div>
          <div>
            <label class="label">Municipio</label>
            <input v-model="form.municipio" type="text" class="input-field" />
          </div>
        </div>
        <div class="grid grid-cols-2 gap-4">
          <div>
            <label class="label">Comunidad</label>
            <input v-model="form.comunidad" type="text" class="input-field" />
          </div>
          <div>
            <label class="label">Nivel</label>
            <input v-model="form.nivel" type="text" class="input-field" placeholder="Ej. Local, Regional..." />
          </div>
        </div>
        <div>
          <label class="label">Nombre del establecimiento *</label>
          <input v-model="form.establecimiento_nombre" type="text" class="input-field" required />
        </div>
        <div>
          <label class="label">Tipo de establecimiento <span class="font-normal text-gray-400">(CESAMO, CESAR, Hospital...)</span></label>
          <input v-model="form.tipo_establecimiento" type="text" class="input-field" placeholder="Ej. CESAMO, Hospital..." />
        </div>
        <div class="grid grid-cols-2 gap-4">
          <div>
            <label class="label">Código eje <span class="font-normal text-gray-400">(ECA)</span></label>
            <input v-model="form.cod_eje" type="text" class="input-field" placeholder="Ej. A, B, C..." />
          </div>
          <div>
            <label class="label">Nombre del eje <span class="font-normal text-gray-400">(ECA)</span></label>
            <input v-model="form.eje_nombre" type="text" class="input-field" />
          </div>
        </div>
        <div class="grid grid-cols-2 gap-4">
          <div>
            <label class="label">Código indicador *</label>
            <input v-model="form.cod_indicador" type="text" class="input-field" required placeholder="Ej. 1.1, 2.3..." />
          </div>
          <div>
            <label class="label">Calificación (0 o 1)</label>
            <select v-model.number="form.calificacion" class="select-field">
              <option :value="null">Sin calificación</option>
              <option :value="0">0</option>
              <option :value="1">1</option>
            </select>
          </div>
        </div>
        <div>
          <label class="label">Descripción del indicador *</label>
          <textarea v-model="form.descripcion_indicador" class="input-field" rows="2" required />
        </div>
        <div class="grid grid-cols-2 gap-4">
          <div class="flex items-end pb-1">
            <label class="flex items-center gap-2 cursor-pointer">
              <input v-model="form.cumple" type="checkbox" class="w-4 h-4 accent-orange-500" />
              <span class="text-sm font-medium text-gray-700">Cumple el estándar</span>
            </label>
          </div>
          <div>
            <label class="label">Fecha de evaluación</label>
            <input v-model="form.fecha_evaluacion" type="date" class="input-field" />
          </div>
        </div>
      </div>
    </ModalFormulario>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { PlusCircle, Pencil, Trash2, Search, X } from 'lucide-vue-next'
import ExcelUpload from '../../components/admin/ExcelUpload.vue'
import ModalFormulario from '../../components/admin/ModalFormulario.vue'
import Pagination from '../../components/Pagination.vue'
import { fetchEstandaresAdmin, upsertEstandar, deleteEstandar, bulkUpsertEstandares } from '../../services/adminService'
import { parsearError, esSi, formatearFechaExcel, enLotes } from '../../utils/importUtils'
import { useToast } from '../../composables/useToast'
import { useConfirm } from '../../composables/useConfirm'

const toast = useToast()
const { confirmar } = useConfirm()

const props = defineProps({
  catalogos: { type: Object, default: () => ({ departamentos: [] }) }
})

const filas = ref([])
const total = ref(0)
const pagina = ref(1)
const tamanoPagina = ref(25)
const loading = ref(false)
const error = ref(null)
const mostrarModal = ref(false)
const guardando = ref(false)
const filtroBusqueda = ref('')
const importandoExcel = ref(false)
const resultadoImportExcel = ref(null)
const filtroDpto = ref('')

const columnasExcel = [
  { campo: 'departamento',          etiqueta: 'Departamento',              requerido: false },
  { campo: 'municipio',             etiqueta: 'Municipio',                 requerido: false },
  { campo: 'comunidad',             etiqueta: 'Comunidad',                 requerido: false },
  { campo: 'nivel',                 etiqueta: 'Nivel',                     requerido: false },
  { campo: 'establecimiento_nombre',etiqueta: 'Nombre Establecimiento',    requerido: true  },
  { campo: 'tipo_establecimiento',  etiqueta: 'Tipo Establecimiento',      requerido: false },
  { campo: 'cod_eje',               etiqueta: 'Código Eje',                requerido: false },
  { campo: 'eje_nombre',            etiqueta: 'Nombre Eje',                requerido: false },
  { campo: 'cod_indicador',         etiqueta: 'Código Indicador',          requerido: true  },
  { campo: 'descripcion_indicador', etiqueta: 'Descripción Indicador',     requerido: true  },
  { campo: 'calificacion',          etiqueta: 'Calificación (0 o 1)',       requerido: false },
  { campo: 'cumple',                etiqueta: 'Cumple (SI/NO)',             requerido: false },
  { campo: 'fecha_evaluacion',      etiqueta: 'Fecha Evaluación (AAAA-MM-DD)', requerido: false }
]

const ejemploPlantilla = {
  departamento:           'Atlántida',
  municipio:              'La Ceiba',
  comunidad:              '',
  nivel:                  'Local',
  establecimiento_nombre: 'CESAMO El Centro',
  tipo_establecimiento:   'CESAMO',
  cod_eje:                'A',
  eje_nombre:             'Gestión de Calidad',
  cod_indicador:          'A.1',
  descripcion_indicador:  'Cuenta con plan de mejora continua',
  calificacion:           1,
  cumple:                 'SI',
  fecha_evaluacion:       '2025-03-15'
}

const formVacio = () => ({
  nivel: '',
  departamento: '',
  municipio: '',
  comunidad: '',
  establecimiento_nombre: '',
  tipo_establecimiento: '',
  cod_eje: '',
  eje_nombre: '',
  cod_indicador: '',
  descripcion_indicador: '',
  calificacion: null,
  cumple: false,
  fecha_evaluacion: ''
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
    const resultado = await fetchEstandaresAdmin({
      page: pagina.value,
      pageSize: tamanoPagina.value,
      departamento: filtroDpto.value || undefined,
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
    ? { ...fila, fecha_evaluacion: fila.fecha_evaluacion ?? '' }
    : formVacio()
  mostrarModal.value = true
}

async function guardar() {
  if (!form.value.establecimiento_nombre || !form.value.cod_indicador || !form.value.descripcion_indicador) return
  guardando.value = true
  try {
    await upsertEstandar(form.value)
    mostrarModal.value = false
    await cargar()
    toast.success('Estándar guardado correctamente.')
  } catch (e) {
    toast.error('Error al guardar: ' + parsearError(e.message))
  } finally {
    guardando.value = false
  }
}

async function confirmarEliminar(id) {
  const ok = await confirmar({
    titulo: 'Eliminar estándar',
    mensaje: 'Esta acción no se puede deshacer.',
    textoConfirmar: 'Eliminar'
  })
  if (!ok) return
  try {
    await deleteEstandar(id)
    await cargar()
    toast.success('Estándar eliminado.')
  } catch (e) {
    toast.error('Error al eliminar: ' + parsearError(e.message))
  }
}

function validarFilaEstandar(row) {
  if (!String(row.establecimiento_nombre ?? '').trim())
    return 'establecimiento_nombre está vacío'
  if (!String(row.cod_indicador ?? '').trim())
    return 'cod_indicador está vacío'
  if (!String(row.descripcion_indicador ?? '').trim())
    return 'descripcion_indicador está vacía'
  if (row.calificacion !== '' && row.calificacion != null) {
    const cal = Number(row.calificacion)
    if (isNaN(cal) || (cal !== 0 && cal !== 1))
      return 'calificacion debe ser 0 o 1'
  }
  if (row.fecha_evaluacion && !/^\d{4}-\d{2}-\d{2}$/.test(String(row.fecha_evaluacion))) {
    return 'fecha_evaluacion debe tener formato AAAA-MM-DD (ej. 2025-06-15)'
  }
  return null
}

async function procesarExcel(datos) {
  if (!datos.length) {
    resultadoImportExcel.value = { ok: false, error: 'No hay filas válidas para importar.' }
    return
  }

  const filasMapeadas = datos.map(row => {
    const cal = row.calificacion !== '' && row.calificacion != null ? Number(row.calificacion) : null
    return {
      nivel:                  row.nivel || null,
      departamento:           row.departamento || null,
      municipio:              row.municipio || null,
      comunidad:              row.comunidad || null,
      establecimiento_nombre: String(row.establecimiento_nombre ?? '').trim(),
      tipo_establecimiento:   row.tipo_establecimiento || null,
      cod_eje:                row.cod_eje || null,
      eje_nombre:             row.eje_nombre || null,
      cod_indicador:          String(row.cod_indicador ?? '').trim(),
      descripcion_indicador:  String(row.descripcion_indicador ?? '').trim(),
      calificacion:           cal,
      cumple:                 esSi(row.cumple) || cal === 1,
      fecha_evaluacion:       formatearFechaExcel(row.fecha_evaluacion)
    }
  })

  importandoExcel.value = true
  resultadoImportExcel.value = null
  try {
    for (const lote of enLotes(filasMapeadas, 200)) {
      await bulkUpsertEstandares(lote)
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
