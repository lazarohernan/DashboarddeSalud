<template>
  <div class="filtros-container border border-gray-300 p-6 rounded-lg">
    <h2 class="text-lg font-semibold text-gray-900 mb-4">Filtros</h2>
    
    <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
      <!-- Departamento -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-2">
          <MapPin class="inline-block w-4 h-4 mr-1" />
          Departamento
        </label>
        <select 
          :value="departamentoSeleccionado"
          @change="$emit('update:departamento', $event.target.value)"
          class="filtro-select w-full border border-gray-300 px-3 py-2 text-sm rounded-md bg-white transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500 hover:border-gray-400"
        >
          <option value="">Todos los departamentos</option>
          <option 
            v-for="dept in departamentosUnicos" 
            :key="dept" 
            :value="dept"
          >
            {{ dept }}
          </option>
        </select>
      </div>

      <!-- Municipio -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-2">
          <MapPin class="inline-block w-4 h-4 mr-1" />
          Municipio
        </label>
        <select 
          :value="municipioSeleccionado"
          @change="$emit('update:municipio', $event.target.value)"
          class="filtro-select w-full border border-gray-300 px-3 py-2 text-sm rounded-md bg-white transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500 hover:border-gray-400"
        >
          <option value="">Todos los municipios</option>
          <option 
            v-for="mun in municipiosFiltrados" 
            :key="mun" 
            :value="mun"
          >
            {{ mun }}
          </option>
        </select>
      </div>

      <!-- Comunidad -->
      <div v-if="mostrarComunidad">
        <label class="block text-sm font-medium text-gray-700 mb-2">
          <MapPin class="inline-block w-4 h-4 mr-1" />
          Comunidad
        </label>
        <select 
          :value="comunidadSeleccionada"
          @change="$emit('update:comunidad', $event.target.value)"
          class="filtro-select w-full border border-gray-300 px-3 py-2 text-sm rounded-md bg-white transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500 hover:border-gray-400"
        >
          <option value="">Todas las comunidades</option>
          <option 
            v-for="com in comunidadesFiltradas" 
            :key="com" 
            :value="com"
          >
            {{ com }}
          </option>
        </select>
      </div>

      <!-- Tipo de Establecimiento -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-2">
          <Building class="inline-block w-4 h-4 mr-1" />
          Tipo de Establecimiento
        </label>

        <!-- Selector para tipos de establecimiento -->
        <select
          :value="tipoEstablecimientoSeleccionado"
          @change="$emit('update:tipoEstablecimiento', $event.target.value)"
          class="filtro-select w-full border border-gray-300 px-3 py-2 text-sm rounded-md bg-white transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500 hover:border-gray-400"
        >
          <option value="">Todos los tipos</option>
          <option
            v-for="tipo in tiposEstablecimientoUnicos"
            :key="tipo"
            :value="tipo"
          >
            {{ tipo }}
          </option>
        </select>
      </div>
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import { MapPin, Building } from 'lucide-vue-next'
import { departamentos, municipios, tiposEstablecimiento } from '../data/catalogosCompletos'

const props = defineProps({
  datosCompletos: {
    type: Array,
    default: () => []
  },
  departamentoSeleccionado: String,
  municipioSeleccionado: String,
  comunidadSeleccionada: String,
  tipoEstablecimientoSeleccionado: String,
  mostrarComunidad: {
    type: Boolean,
    default: true
  },
  soloTiposEstandares: {
    type: Boolean,
    default: false
  }
})

defineEmits(['update:departamento', 'update:municipio', 'update:comunidad', 'update:tipoEstablecimiento'])

// Usar catálogos como fuente de verdad para departamentos
const departamentosUnicos = computed(() => {
  return departamentos.sort()
})

// Usar catálogos como fuente de verdad para municipios (filtrados por departamento)
const municipiosFiltrados = computed(() => {
  if (!props.departamentoSeleccionado) {
    return municipios.map(m => m.nombre).sort()
  }
  
  return municipios
    .filter(m => m.departamento === props.departamentoSeleccionado)
    .map(m => m.nombre)
    .sort()
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
  if (props.soloTiposEstandares) {
    // Solo mostrar CIS y UAPS para la vista de estándares
    return tiposEstablecimiento.filter(tipo => tipo === 'CIS' || tipo === 'UAPS').sort()
  }
  return tiposEstablecimiento.sort()
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
  background: #fafafa;
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
