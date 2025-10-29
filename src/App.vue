<template>
  <div class="min-h-screen bg-white">
    <header class="border-b border-gray-300 py-4 px-6">
      <h1 class="text-2xl font-bold text-gray-900">Dashboard de Salud Reproductiva</h1>
      <p class="text-sm text-gray-600 mt-1">Sistema de Monitoreo y Seguimiento</p>
    </header>

    <main class="p-6">
      <Filtros 
        :departamentos="departamentos"
        :municipios="municipiosFiltrados"
        :establecimientos="establecimientosFiltrados"
        @update:departamento="handleDepartamentoChange"
        @update:municipio="handleMunicipioChange"
        @update:establecimiento="handleEstablecimientoChange"
      />

      <div class="mt-8 space-y-8">
        <EstandaresCalidad 
          v-if="mostrarEstandares"
          :datos="estandaresCalidadFiltrados"
        />
        
        <PlanesAccion 
          :datos="planesAccionFiltrados"
        />
        
        <ProvisionAnticonceptivos 
          :datos="provisionAnticonceptivosFiltrados"
        />
      </div>
    </main>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import Filtros from './components/Filtros.vue'
import EstandaresCalidad from './components/EstandaresCalidad.vue'
import PlanesAccion from './components/PlanesAccion.vue'
import ProvisionAnticonceptivos from './components/ProvisionAnticonceptivos.vue'
import { 
  departamentos, 
  municipios, 
  establecimientos,
  estandaresCalidad,
  planesAccion,
  provisionAnticonceptivos
} from './data/mockData'

const departamentoSeleccionado = ref(null)
const municipioSeleccionado = ref(null)
const establecimientoSeleccionado = ref(null)

const municipiosFiltrados = computed(() => {
  if (!departamentoSeleccionado.value) return municipios
  return municipios.filter(m => m.departamentoId === departamentoSeleccionado.value)
})

const establecimientosFiltrados = computed(() => {
  if (!municipioSeleccionado.value) return establecimientos
  return establecimientos.filter(e => e.municipioId === municipioSeleccionado.value)
})

const mostrarEstandares = computed(() => {
  if (!establecimientoSeleccionado.value) return true
  const est = establecimientos.find(e => e.id === establecimientoSeleccionado.value)
  return est?.tipo === 'salud'
})

const estandaresCalidadFiltrados = computed(() => {
  if (!establecimientoSeleccionado.value) return estandaresCalidad
  return estandaresCalidad.filter(e => e.establecimientoId === establecimientoSeleccionado.value)
})

const planesAccionFiltrados = computed(() => {
  if (!establecimientoSeleccionado.value) return planesAccion
  return planesAccion.filter(p => p.establecimientoId === establecimientoSeleccionado.value)
})

const provisionAnticonceptivosFiltrados = computed(() => {
  if (!establecimientoSeleccionado.value) return provisionAnticonceptivos
  return provisionAnticonceptivos.filter(p => p.establecimientoId === establecimientoSeleccionado.value)
})

const handleDepartamentoChange = (id) => {
  departamentoSeleccionado.value = id
  municipioSeleccionado.value = null
  establecimientoSeleccionado.value = null
}

const handleMunicipioChange = (id) => {
  municipioSeleccionado.value = id
  establecimientoSeleccionado.value = null
}

const handleEstablecimientoChange = (id) => {
  establecimientoSeleccionado.value = id
}
</script>
