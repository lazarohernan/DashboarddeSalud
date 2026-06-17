<template>
  <div class="filtros-container border border-gray-200 px-6 py-4 rounded-lg bg-white">
    <div class="flex items-end gap-4 flex-wrap">

      <!-- Departamento -->
      <div v-if="!ocultarEstablecimiento" class="flex-1 min-w-[150px]">
        <label class="block text-xs font-medium text-gray-500 mb-1.5">
          <MapPin class="inline-block w-3.5 h-3.5 mr-1" />
          Departamento
        </label>
        <select
          :value="departamentoSeleccionado"
          @change="$emit('update:departamento', $event.target.value)"
          class="filtro-select w-full border border-gray-300 px-3 py-2 text-sm rounded-md bg-white transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500 hover:border-gray-400"
        >
          <option value="">Todos</option>
          <option v-for="dept in departamentosUnicos" :key="dept" :value="dept">{{ dept }}</option>
        </select>
      </div>

      <!-- Municipio -->
      <div v-if="!ocultarEstablecimiento" class="flex-1 min-w-[150px]">
        <label class="block text-xs font-medium text-gray-500 mb-1.5">
          <MapPin class="inline-block w-3.5 h-3.5 mr-1" />
          Municipio
        </label>
        <select
          :value="municipioSeleccionado"
          @change="$emit('update:municipio', $event.target.value)"
          class="filtro-select w-full border border-gray-300 px-3 py-2 text-sm rounded-md bg-white transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500 hover:border-gray-400"
        >
          <option value="">Todos</option>
          <option v-for="mun in municipiosFiltrados" :key="mun" :value="mun">{{ mun }}</option>
        </select>
      </div>

      <!-- Comunidad -->
      <div v-if="mostrarComunidad" class="flex-1 min-w-[150px]">
        <label class="block text-xs font-medium text-gray-500 mb-1.5">
          <MapPin class="inline-block w-3.5 h-3.5 mr-1" />
          Comunidad
        </label>
        <select
          :value="comunidadSeleccionada"
          @change="$emit('update:comunidad', $event.target.value)"
          class="filtro-select w-full border border-gray-300 px-3 py-2 text-sm rounded-md bg-white transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500 hover:border-gray-400"
        >
          <option value="">Todas</option>
          <option v-for="com in comunidadesFiltradas" :key="com" :value="com">{{ com }}</option>
        </select>
      </div>

      <!-- Fondo -->
      <div v-if="mostrarFondo" class="flex-1 min-w-[140px]">
        <label class="block text-xs font-medium text-gray-500 mb-1.5">
          <Building class="inline-block w-3.5 h-3.5 mr-1" />
          Fondo
        </label>
        <select
          :value="fondoSeleccionado"
          @change="$emit('update:fondo', $event.target.value)"
          class="filtro-select w-full border border-gray-300 px-3 py-2 text-sm rounded-md bg-white transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500 hover:border-gray-400"
        >
          <option value="">Todos</option>
          <option v-for="fondo in fondosDisponibles" :key="fondo" :value="fondo">{{ fondo }}</option>
        </select>
      </div>

      <!-- Tipo de Establecimiento -->
      <div v-if="!soloDepartamentoMunicipio && !ocultarEstablecimiento" class="flex-1 min-w-[160px]">
        <label class="block text-xs font-medium text-gray-500 mb-1.5">
          <Building class="inline-block w-3.5 h-3.5 mr-1" />
          Tipo de Establecimiento
        </label>
        <select
          :value="tipoEstablecimientoSeleccionado"
          @change="$emit('update:tipoEstablecimiento', $event.target.value)"
          class="filtro-select w-full border border-gray-300 px-3 py-2 text-sm rounded-md bg-white transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500 hover:border-gray-400"
        >
          <option value="">Todos</option>
          <option v-for="tipo in tiposEstablecimientoUnicos" :key="tipo" :value="tipo">{{ tipo }}</option>
        </select>
      </div>

      <!-- Botón reset -->
      <div class="flex items-end pb-0.5">
        <button
          @click="$emit('reset')"
          title="Limpiar filtros"
          class="p-2 rounded-md border border-gray-300 bg-white text-gray-500 hover:text-orange-600 hover:border-orange-400 transition-all duration-200"
        >
          <RotateCcw class="w-4 h-4" />
        </button>
      </div>

    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import { MapPin, Building, RotateCcw } from 'lucide-vue-next'

const props = defineProps({
  datosCompletos: {
    type: Array,
    default: () => []
  },
  catalogos: {
    type: Object,
    default: () => ({
      departamentos: [],
      municipios: [],
      tiposEstablecimiento: [],
      fondos: []
    })
  },
  departamentoSeleccionado: String,
  municipioSeleccionado: String,
  comunidadSeleccionada: String,
  tipoEstablecimientoSeleccionado: String,
  fondoSeleccionado: String,
  mostrarComunidad: {
    type: Boolean,
    default: true
  },
  mostrarFondo: {
    type: Boolean,
    default: false
  },
  soloTiposEstandares: {
    type: Boolean,
    default: false
  },
  soloDepartamentoMunicipio: {
    type: Boolean,
    default: false
  },
  ocultarEstablecimiento: {
    type: Boolean,
    default: false
  }
})

defineEmits(['update:departamento', 'update:municipio', 'update:comunidad', 'update:tipoEstablecimiento', 'update:fondo', 'reset'])

// Usar catálogos como fuente de verdad para departamentos
const departamentosUnicos = computed(() => {
  return [...(props.catalogos.departamentos ?? [])].sort()
})

const municipiosFiltrados = computed(() => {
  const lista = props.catalogos.municipios ?? []
  if (!props.departamentoSeleccionado) {
    return lista.map((m) => m.nombre).sort()
  }

  return lista
    .filter((m) => m.departamento === props.departamentoSeleccionado)
    .map((m) => m.nombre)
    .sort()
})

const fondosDisponibles = computed(() => {
  return [...(props.catalogos.fondos ?? [])].sort()
})

// Para comunidades, extraer de datos de estándares ya que no están en el catálogo
const comunidadesFiltradas = computed(() => {
  const coms = new Set()

  props.datosCompletos.forEach(d => {
    if (d.comunidad && d.comunidad.trim()) {
      const matchDept = !props.departamentoSeleccionado || d.departamento === props.departamentoSeleccionado
      const matchMun = !props.municipioSeleccionado || d.municipio === props.municipioSeleccionado
      if (matchDept && matchMun) {
        coms.add(d.comunidad)
      }
    }
  })

  return Array.from(coms).sort()
})

// Usar catálogos como fuente de verdad para tipos de establecimiento
const tiposEstablecimientoUnicos = computed(() => {
  const tipos = props.catalogos.tiposEstablecimiento ?? []
  if (props.soloTiposEstandares) {
    return tipos.filter((tipo) => tipo === 'CIS' || tipo === 'UAPS').sort()
  }
  return [...tipos].sort()
})
</script>

<style scoped>
/* Estilos mejorados para los selects */
.filtro-select {
  cursor: pointer;
  appearance: none;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%239ca3af' stroke-width='2'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' d='M19 9l-7 7-7-7'/%3E%3C/svg%3E");
  background-repeat: no-repeat;
  background-position: right 0.75rem center;
  background-size: 1rem 1rem;
  padding-right: 2.5rem;
}

.filtro-select:hover {
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%2378719a' stroke-width='2'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' d='M19 9l-7 7-7-7'/%3E%3C/svg%3E");
}

.filtro-select:focus {
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%23ea580c' stroke-width='2'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' d='M19 9l-7 7-7-7'/%3E%3C/svg%3E");
}

/* Estilizar las opciones dentro del select usando :deep() */
.filtro-select :deep(option) {
  padding: 0.5rem;
  background: white;
  color: #1f2937;
  font-size: 0.875rem;
}

.filtro-select :deep(option:hover) {
  background: #fef3c7;
}

.filtro-select :deep(option:checked),
.filtro-select :deep(option:focus) {
  background: #fed7aa;
  color: #ea580c;
  font-weight: 500;
}

/* Mejorar apariencia del contenedor de filtros */
.filtros-container {
  border-radius: 0.5rem;
}

/* Mejorar labels */
label {
  color: #374151;
  font-weight: 500;
}

label svg {
  color: #ea580c;
}
</style>
