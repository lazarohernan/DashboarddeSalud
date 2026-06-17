<template>
  <div class="space-y-6">
    <!-- Header del panel admin -->
    <div class="bg-slate-800 rounded-xl p-5 flex items-center gap-4">
      <div class="flex items-center justify-center w-11 h-11 rounded-lg bg-orange-500">
        <DatabaseIcon class="w-6 h-6 text-white" />
      </div>
      <div>
        <h2 class="text-xl font-bold text-white">Panel de Administración</h2>
        <p class="text-sm text-slate-300">Gestión de datos del sistema de monitoreo</p>
      </div>
    </div>

    <!-- Tabs de secciones -->
    <div class="flex flex-wrap gap-2 border-b border-gray-200 pb-0">
      <button
        v-for="tab in tabs"
        :key="tab.id"
        @click="tabActivo = tab.id"
        :class="[
          'px-4 py-2.5 text-sm font-medium rounded-t-lg border-b-2 transition-all',
          tabActivo === tab.id
            ? 'border-orange-500 text-orange-600 bg-orange-50'
            : 'border-transparent text-gray-600 hover:text-gray-900 hover:bg-gray-50'
        ]"
      >
        <component :is="tab.icon" class="w-4 h-4 inline mr-1.5 -mt-0.5" />
        {{ tab.nombre }}
      </button>
    </div>

    <!-- Contenido por tab -->
    <AdminAvances v-if="tabActivo === 'avances'" :catalogos="catalogos" />
    <AdminProvision v-if="tabActivo === 'provision'" :catalogos="catalogos" />
    <AdminEstandares v-if="tabActivo === 'estandares'" :catalogos="catalogos" />
    <AdminKpi v-if="tabActivo === 'kpi'" :catalogos="catalogos" />

    <!-- Feedback global del panel admin -->
    <ToastContainer />
    <ConfirmDialog />
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { Database as DatabaseIcon, TrendingUp, Pill, CheckSquare, BarChart2 } from 'lucide-vue-next'
import AdminAvances from './AdminAvances.vue'
import AdminProvision from './AdminProvision.vue'
import AdminEstandares from './AdminEstandares.vue'
import AdminKpi from './AdminKpi.vue'
import ToastContainer from '../../components/admin/ToastContainer.vue'
import ConfirmDialog from '../../components/admin/ConfirmDialog.vue'
import { fetchCatalogosAdmin } from '../../services/adminService'

const tabActivo = ref('avances')
const catalogos = ref({
  departamentos: [],
  riss: [],
  municipios: [],
  metodos: [],
  outputs: [],
  indicadores: [],
  indicadoresKpi: []
})

const tabs = [
  { id: 'avances', nombre: 'Avances (LNOB)', icon: TrendingUp },
  { id: 'provision', nombre: 'Provisión (MAC)', icon: Pill },
  { id: 'estandares', nombre: 'Estándares (ECA)', icon: CheckSquare },
  { id: 'kpi', nombre: 'Resultados (KPI)', icon: BarChart2 }
]

onMounted(async () => {
  try {
    catalogos.value = await fetchCatalogosAdmin()
  } catch (e) {
    console.error('Error cargando catálogos admin:', e.message)
  }
})
</script>
