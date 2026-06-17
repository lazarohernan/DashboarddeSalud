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
          placeholder="Buscar indicador KPI..."
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
      <select v-model="filtroOutput" class="select-field w-52" @change="reiniciarYCargar">
        <option value="">Todos los outputs</option>
        <option v-for="o in props.catalogos.outputs" :key="o.id" :value="o.codigo">
          Output {{ o.codigo }}
        </option>
      </select>
      <button @click="abrirFormulario(null)" class="btn-primary ml-auto">
        <PlusCircle class="w-4 h-4 mr-1.5" /> Nuevo resultado
      </button>
    </div>

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
            <th class="th">
              <div>Cód. KPI</div>
              <div class="text-[10px] font-normal opacity-60">Indicador Clave</div>
            </th>
            <th class="th">Descripción</th>
            <th class="th">Año</th>
            <th class="th text-right">Valor</th>
            <th class="th w-20">Acciones</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="fila in filas" :key="fila.id" class="border-t border-gray-100 hover:bg-gray-50">
            <td class="td text-xs text-gray-500">{{ fila.indicadores_kpi?.outputs?.codigo }}</td>
            <td class="td font-mono text-xs font-medium">{{ fila.indicadores_kpi?.codigo }}</td>
            <td class="td text-xs max-w-xs truncate" :title="fila.indicadores_kpi?.descripcion">
              {{ fila.indicadores_kpi?.descripcion }}
            </td>
            <td class="td font-medium">{{ fila.anio }}</td>
            <td class="td text-right font-semibold text-slate-700">
              {{ fila.valor != null ? Number(fila.valor).toLocaleString() : '—' }}
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
            <td colspan="6" class="td text-center text-gray-400 py-6">No hay registros</td>
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
      :titulo="form.id ? 'Editar resultado KPI' : 'Nuevo resultado KPI'"
      @cerrar="mostrarModal = false"
      @guardar="guardar"
      :guardando="guardando"
    >
      <div class="space-y-4">
        <div>
          <label class="label">Indicador KPI <span class="font-normal text-gray-400">(Indicador Clave de Desempeño)</span> *</label>
          <select v-model.number="form.indicador_kpi_id" class="select-field" required>
            <option value="">Selecciona un indicador KPI</option>
            <option
              v-for="ind in props.catalogos.indicadoresKpi"
              :key="ind.id"
              :value="ind.id"
            >
              [Output {{ ind.outputs?.codigo }}] {{ ind.codigo }} — {{ ind.descripcion?.substring(0, 80) }}
            </option>
          </select>
        </div>
        <div class="grid grid-cols-2 gap-4">
          <div>
            <label class="label">Año *</label>
            <select v-model.number="form.anio" class="select-field" required>
              <option v-for="a in anios" :key="a" :value="a">{{ a }}</option>
            </select>
          </div>
          <div>
            <label class="label">Valor *</label>
            <input
              v-model.number="form.valor"
              type="number"
              step="0.01"
              class="input-field"
              placeholder="Ej. 1250"
              required
            />
          </div>
        </div>
      </div>
    </ModalFormulario>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { PlusCircle, Pencil, Trash2, Search, X } from 'lucide-vue-next'
import ModalFormulario from '../../components/admin/ModalFormulario.vue'
import Pagination from '../../components/Pagination.vue'
import { fetchKpiResultados, upsertKpiResultado, deleteKpiResultado } from '../../services/adminService'
import { parsearError } from '../../utils/importUtils'
import { useToast } from '../../composables/useToast'
import { useConfirm } from '../../composables/useConfirm'

const toast = useToast()
const { confirmar } = useConfirm()

const props = defineProps({
  catalogos: { type: Object, default: () => ({ outputs: [], indicadoresKpi: [] }) }
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
const filtroOutput = ref('')
const filtroBusqueda = ref('')

const anios = [2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030]

const formVacio = () => ({
  indicador_kpi_id: '',
  anio: 2025,
  valor: null
})

const form = ref(formVacio())

const outputIdSeleccionado = computed(() => {
  if (!filtroOutput.value) return undefined
  const output = props.catalogos.outputs?.find(
    (o) => String(o.codigo) === String(filtroOutput.value)
  )
  return output?.id
})

function reiniciarYCargar() {
  pagina.value = 1
  cargar()
}

async function cargar() {
  loading.value = true
  error.value = null
  try {
    const resultado = await fetchKpiResultados({
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
  form.value = fila
    ? { id: fila.id, indicador_kpi_id: fila.indicador_kpi_id, anio: fila.anio, valor: fila.valor }
    : formVacio()
  mostrarModal.value = true
}

async function guardar() {
  if (!form.value.indicador_kpi_id || !form.value.anio) return
  guardando.value = true
  try {
    await upsertKpiResultado(form.value)
    mostrarModal.value = false
    await cargar()
    toast.success('Resultado KPI guardado correctamente.')
  } catch (e) {
    toast.error('Error al guardar: ' + parsearError(e.message))
  } finally {
    guardando.value = false
  }
}

async function confirmarEliminar(id) {
  const ok = await confirmar({
    titulo: 'Eliminar resultado KPI',
    mensaje: 'Esta acción no se puede deshacer.',
    textoConfirmar: 'Eliminar'
  })
  if (!ok) return
  try {
    await deleteKpiResultado(id)
    await cargar()
    toast.success('Resultado eliminado.')
  } catch (e) {
    toast.error('Error al eliminar: ' + parsearError(e.message))
  }
}

onMounted(cargar)
</script>
