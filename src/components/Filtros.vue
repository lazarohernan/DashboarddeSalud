<template>
  <div class="border border-gray-300 p-6">
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
          class="w-full border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:border-gray-500"
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
          class="w-full border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:border-gray-500"
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
          class="w-full border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:border-gray-500"
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
          class="w-full border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:border-gray-500"
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
