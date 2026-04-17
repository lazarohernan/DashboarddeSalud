<template>
  <section class="space-y-6">

    <!-- Filtros -->
    <div class="border border-gray-200 px-6 py-4 rounded-lg bg-white">
      <div class="flex items-end gap-4 flex-wrap">

        <!-- RISS -->
        <div class="flex-1 min-w-[140px]">
          <label class="block text-xs font-medium text-gray-500 mb-1.5">RISS</label>
          <select v-model="filtroRISS" class="filtro-select w-full border border-gray-300 px-3 py-2 text-sm rounded-md bg-white focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500">
            <option value="">Todas</option>
            <option v-for="r in rissDisponibles" :key="r" :value="r">{{ r }}</option>
          </select>
        </div>

        <!-- Municipio -->
        <div class="flex-1 min-w-[140px]">
          <label class="block text-xs font-medium text-gray-500 mb-1.5">Municipio</label>
          <select v-model="filtroMunicipio" class="filtro-select w-full border border-gray-300 px-3 py-2 text-sm rounded-md bg-white focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500">
            <option value="">Todos</option>
            <option v-for="m in municipiosDisponibles" :key="m" :value="m">{{ m }}</option>
          </select>
        </div>

        <!-- Año -->
        <div class="flex-1 min-w-[100px]">
          <label class="block text-xs font-medium text-gray-500 mb-1.5">Año</label>
          <select v-model="filtroAno" class="filtro-select w-full border border-gray-300 px-3 py-2 text-sm rounded-md bg-white focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500">
            <option value="">Todos</option>
            <option v-for="a in anosDisponibles" :key="a" :value="a">{{ a }}</option>
          </select>
        </div>

        <!-- Mes -->
        <div class="flex-1 min-w-[120px]">
          <label class="block text-xs font-medium text-gray-500 mb-1.5">Mes</label>
          <select v-model="filtroMes" class="filtro-select w-full border border-gray-300 px-3 py-2 text-sm rounded-md bg-white focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500">
            <option value="">Todos</option>
            <option v-for="m in mesesOrdenados" :key="m" :value="m">{{ m }}</option>
          </select>
        </div>

        <!-- Tipo de Método -->
        <div class="flex-1 min-w-[180px]">
          <label class="block text-xs font-medium text-gray-500 mb-1.5">Tipo de Método</label>
          <select v-model="filtroMetodo" class="filtro-select w-full border border-gray-300 px-3 py-2 text-sm rounded-md bg-white focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500">
            <option value="">Todos</option>
            <option v-for="m in metodosDisponibles" :key="m" :value="m">{{ m }}</option>
          </select>
        </div>

        <!-- Switch Lista / Tarjetas -->
        <div class="flex items-end gap-2 pb-0.5">
          <button
            @click="vistaActiva = 'tarjetas'"
            :class="[
              'px-3 py-2 rounded-md text-sm font-medium border transition-all duration-200',
              vistaActiva === 'tarjetas'
                ? 'bg-slate-700 text-orange-400 border-slate-700'
                : 'bg-white text-gray-500 border-gray-300 hover:border-gray-400'
            ]"
          >
            <LayoutGrid class="w-4 h-4" />
          </button>
          <button
            @click="vistaActiva = 'lista'"
            :class="[
              'px-3 py-2 rounded-md text-sm font-medium border transition-all duration-200',
              vistaActiva === 'lista'
                ? 'bg-slate-700 text-orange-400 border-slate-700'
                : 'bg-white text-gray-500 border-gray-300 hover:border-gray-400'
            ]"
          >
            <List class="w-4 h-4" />
          </button>

          <!-- Reset -->
          <button
            @click="resetFiltros"
            title="Limpiar filtros"
            class="p-2 rounded-md border border-gray-300 bg-white text-gray-500 hover:text-orange-600 hover:border-orange-400 transition-all duration-200"
          >
            <RotateCcw class="w-4 h-4" />
          </button>
        </div>

      </div>
    </div>

    <!-- Resumen -->
    <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
      <div class="bg-white border border-gray-200 rounded-lg p-4">
        <div class="text-xs text-gray-500 mb-1">Total consumo</div>
        <div class="text-2xl font-bold text-gray-900">{{ totalConsumo.toLocaleString() }}</div>
        <div class="text-xs text-gray-400 mt-1">unidades</div>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg p-4">
        <div class="text-xs text-gray-500 mb-1">Métodos</div>
        <div class="text-2xl font-bold text-gray-900">{{ metodosConConsumo.length }}</div>
        <div class="text-xs text-gray-400 mt-1">con consumo registrado</div>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg p-4">
        <div class="text-xs text-gray-500 mb-1">Establecimientos</div>
        <div class="text-2xl font-bold text-gray-900">{{ establecimientosUnicos }}</div>
        <div class="text-xs text-gray-400 mt-1">en los filtros actuales</div>
      </div>
      <div class="bg-white border border-gray-200 rounded-lg p-4">
        <div class="text-xs text-gray-500 mb-1">Registros</div>
        <div class="text-2xl font-bold text-gray-900">{{ datosFiltrados.length }}</div>
        <div class="text-xs text-gray-400 mt-1">de {{ datos.length }} totales</div>
      </div>
    </div>

    <!-- Vista Tarjetas -->
    <div v-if="vistaActiva === 'tarjetas'" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
      <div
        v-for="metodo in consumoPorMetodo"
        :key="metodo.nombre"
        class="bg-white border border-gray-200 rounded-lg p-5 hover:shadow-md transition-shadow"
      >
        <div class="flex items-start justify-between mb-3">
          <div class="flex items-center gap-2">
            <Package class="w-5 h-5 text-orange-500 flex-shrink-0" />
            <span class="text-xs font-mono text-orange-600 font-medium">Cód. {{ metodo.codigo }}</span>
          </div>
          <span class="text-2xl font-bold text-gray-900">{{ metodo.consumo.toLocaleString() }}</span>
        </div>
        <p class="text-sm font-medium text-gray-800 leading-snug mb-3">{{ metodo.nombre }}</p>
        <!-- Barra de progreso relativa al método con más consumo -->
        <div class="w-full bg-gray-100 rounded-full h-1.5">
          <div
            class="bg-orange-500 h-1.5 rounded-full transition-all duration-500"
            :style="{ width: maxConsumo > 0 ? (metodo.consumo / maxConsumo * 100) + '%' : '0%' }"
          ></div>
        </div>
        <div class="text-xs text-gray-400 mt-1">
          {{ maxConsumo > 0 ? Math.round(metodo.consumo / maxConsumo * 100) : 0 }}% del método con mayor consumo
        </div>
      </div>

      <div v-if="consumoPorMetodo.length === 0" class="col-span-full text-sm text-gray-500 py-8 text-center">
        No hay registros con consumo para los filtros seleccionados.
      </div>
    </div>

    <!-- Vista Lista -->
    <div v-if="vistaActiva === 'lista'" class="bg-white border border-gray-200 rounded-lg overflow-hidden">
      <div class="overflow-x-auto">
        <table class="w-full text-sm border-collapse border border-gray-300">
          <thead>
            <tr class="bg-gray-50">
              <th class="border border-gray-300 text-left py-3 px-4 font-medium text-gray-700">Tipo de Método</th>
              <th class="border border-gray-300 text-center py-3 px-4 font-medium text-gray-700">RISS</th>
              <th class="border border-gray-300 text-center py-3 px-4 font-medium text-gray-700">Municipio</th>
              <th class="border border-gray-300 text-center py-3 px-4 font-medium text-gray-700">Mes</th>
              <th class="border border-gray-300 text-center py-3 px-4 font-medium text-gray-700">Año</th>
              <th class="border border-gray-300 text-center py-3 px-4 font-medium text-orange-700">Consumo</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="item in datosFiltrados"
              :key="item.id"
              class="hover:bg-gray-50"
            >
              <td class="border border-gray-300 py-3 px-4 text-gray-900 font-medium">{{ item.tipoMetodo }}</td>
              <td class="border border-gray-300 py-3 px-4 text-center text-gray-600 text-xs">{{ item.RISS }}</td>
              <td class="border border-gray-300 py-3 px-4 text-center text-gray-600 text-xs">{{ item.municipio }}</td>
              <td class="border border-gray-300 py-3 px-4 text-center text-gray-600 text-xs">{{ item.mes }}</td>
              <td class="border border-gray-300 py-3 px-4 text-center text-gray-600 text-xs">{{ item.ano }}</td>
              <td class="border border-gray-300 py-3 px-4 text-center font-bold text-gray-900">{{ item.consumo }}</td>
            </tr>
            <tr v-if="datosFiltrados.length === 0">
              <td colspan="6" class="py-8 text-center text-sm text-gray-500">
                No hay registros para los filtros seleccionados.
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

  </section>
</template>

<script setup>
import { ref, computed } from 'vue'
import { Package, LayoutGrid, List, RotateCcw } from 'lucide-vue-next'

const props = defineProps({
  datos: {
    type: Array,
    default: () => []
  }
})

// Vista activa: tarjetas o lista
const vistaActiva = ref('tarjetas')

// Filtros
const filtroRISS = ref('')
const filtroMunicipio = ref('')
const filtroAno = ref('')
const filtroMes = ref('')
const filtroMetodo = ref('')

const resetFiltros = () => {
  filtroRISS.value = ''
  filtroMunicipio.value = ''
  filtroAno.value = ''
  filtroMes.value = ''
  filtroMetodo.value = ''
}

// Opciones de filtros — derivan de los datos completos
const rissDisponibles = computed(() =>
  [...new Set(props.datos.map(d => d.RISS).filter(Boolean))].sort()
)

const municipiosDisponibles = computed(() => {
  const base = filtroRISS.value
    ? props.datos.filter(d => d.RISS === filtroRISS.value)
    : props.datos
  return [...new Set(base.map(d => d.municipio).filter(Boolean))].sort()
})

const anosDisponibles = computed(() =>
  [...new Set(props.datos.map(d => d.ano).filter(Boolean))].sort()
)

const metodosDisponibles = computed(() =>
  [...new Set(props.datos.map(d => d.tipoMetodo).filter(Boolean))].sort()
)

const ordenMeses = ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']
const mesesOrdenados = computed(() => {
  const presentes = new Set(props.datos.map(d => d.mes).filter(Boolean))
  return ordenMeses.filter(m => presentes.has(m))
})

// Datos filtrados
const datosFiltrados = computed(() => {
  return props.datos.filter(item => {
    if (filtroRISS.value && item.RISS !== filtroRISS.value) return false
    if (filtroMunicipio.value && item.municipio !== filtroMunicipio.value) return false
    if (filtroAno.value && item.ano !== Number(filtroAno.value)) return false
    if (filtroMes.value && item.mes !== filtroMes.value) return false
    if (filtroMetodo.value && item.tipoMetodo !== filtroMetodo.value) return false
    return true
  })
})

// Resumen
const totalConsumo = computed(() =>
  datosFiltrados.value.reduce((sum, d) => sum + (d.consumo || 0), 0)
)

const establecimientosUnicos = computed(() =>
  new Set(datosFiltrados.value.map(d => d.nombreES)).size
)

// Consumo agrupado por método (solo con consumo > 0), ordenado de mayor a menor
const consumoPorMetodo = computed(() => {
  const grupos = {}
  datosFiltrados.value.forEach(item => {
    if (!grupos[item.tipoMetodo]) {
      grupos[item.tipoMetodo] = { nombre: item.tipoMetodo, codigo: item.codigo, consumo: 0 }
    }
    grupos[item.tipoMetodo].consumo += item.consumo || 0
  })
  return Object.values(grupos)
    .filter(m => m.consumo > 0)
    .sort((a, b) => b.consumo - a.consumo)
})

const metodosConConsumo = computed(() => consumoPorMetodo.value)

const maxConsumo = computed(() =>
  consumoPorMetodo.value.length > 0 ? consumoPorMetodo.value[0].consumo : 0
)
</script>

<style scoped>
.filtro-select {
  cursor: pointer;
  appearance: none;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%239ca3af' stroke-width='2'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' d='M19 9l-7 7-7-7'/%3E%3C/svg%3E");
  background-repeat: no-repeat;
  background-position: right 0.75rem center;
  background-size: 1rem 1rem;
  padding-right: 2.5rem;
}
</style>
