<template>
  <div class="min-h-screen bg-white">
    <header class="border-b border-gray-300 py-4 px-6">
      <h1 class="text-2xl font-bold text-gray-900">Dashboard de Salud Reproductiva</h1>
      <p class="text-sm text-gray-600 mt-1">Sistema de Monitoreo y Seguimiento</p>
    </header>

    <main class="p-6">
      <Navegacion @opcion-seleccionada="handleOpcionSeleccionada" />
      
      <!-- Filtros para Estándares de Calidad -->
      <Filtros
        v-if="opcionActiva === 'estandares'"
        :datos-completos="estandaresCalidad"
        :departamento-seleccionado="departamentoSeleccionado"
        :municipio-seleccionado="municipioSeleccionado"
        :comunidad-seleccionada="comunidadSeleccionada"
        :tipo-establecimiento-seleccionado="tipoEstablecimientoSeleccionado"
        :mostrar-comunidad="true"
        :solo-tipos-estandares="true"
        @update:departamento="handleDepartamentoChange"
        @update:municipio="handleMunicipioChange"
        @update:comunidad="handleComunidadChange"
        @update:tipoEstablecimiento="handleTipoEstablecimientoChange"
      />

      <!-- Filtros para Outputs y Provision (con comunidad) -->
      <Filtros
        v-if="opcionActiva === 'outputs' || opcionActiva === 'provision'"
        :datos-completos="datosCompletosSeccion"
        :departamento-seleccionado="departamentoSeleccionado"
        :municipio-seleccionado="municipioSeleccionado"
        :comunidad-seleccionada="comunidadSeleccionada"
        :tipo-establecimiento-seleccionado="tipoEstablecimientoSeleccionado"
        :mostrar-comunidad="true"
        @update:departamento="handleDepartamentoChange"
        @update:municipio="handleMunicipioChange"
        @update:comunidad="handleComunidadChange"
        @update:tipoEstablecimiento="handleTipoEstablecimientoChange"
      />

      <!-- Filtros para otras secciones (sin comunidad) -->
      <Filtros
        v-if="opcionActiva !== 'inicio' && opcionActiva !== 'estandares' && opcionActiva !== 'outputs' && opcionActiva !== 'provision'"
        :datos-completos="datosCompletosSeccion"
        :departamento-seleccionado="departamentoSeleccionado"
        :municipio-seleccionado="municipioSeleccionado"
        :tipo-establecimiento-seleccionado="tipoEstablecimientoSeleccionado"
        :mostrar-comunidad="false"
        @update:departamento="handleDepartamentoChange"
        @update:municipio="handleMunicipioChange"
        @update:tipoEstablecimiento="handleTipoEstablecimientoChange"
      />

      <!-- Indicador de filtros activos -->
      <div v-if="opcionActiva !== 'inicio' && (departamentoSeleccionado || municipioSeleccionado || comunidadSeleccionada || metodoSeleccionado || tipoEstablecimientoSeleccionado)" 
           class="bg-orange-50 border border-orange-200 rounded-lg p-4 mb-6">
        <div class="flex items-center justify-between">
          <div class="flex items-center gap-2">
            <Filter class="w-4 h-4 text-orange-600" />
            <span class="text-sm font-medium text-orange-800">Filtros activos:</span>
            <div class="flex gap-2 flex-wrap">
              <span v-if="departamentoSeleccionado" class="px-2 py-1 bg-orange-100 text-orange-800 rounded-full text-xs">
                {{ departamentoSeleccionado }}
              </span>
              <span v-if="municipioSeleccionado" class="px-2 py-1 bg-orange-100 text-orange-800 rounded-full text-xs">
                {{ municipioSeleccionado }}
              </span>
              <span v-if="comunidadSeleccionada" class="px-2 py-1 bg-orange-100 text-orange-800 rounded-full text-xs">
                {{ comunidadSeleccionada }}
              </span>
              <span v-if="metodoSeleccionado" class="px-2 py-1 bg-orange-100 text-orange-800 rounded-full text-xs">
                {{ metodosAnticonceptivos.find(m => m.id === metodoSeleccionado)?.nombre }}
              </span>
              <span v-if="tipoEstablecimientoSeleccionado" class="px-2 py-1 bg-orange-100 text-orange-800 rounded-full text-xs">
                {{ tipoEstablecimientoSeleccionado }}
              </span>
            </div>
          </div>
          <button @click="limpiarFiltros" class="text-xs text-orange-600 hover:text-orange-800 font-medium">
            Limpiar todos
          </button>
        </div>
      </div>

      <div class="mt-8 space-y-8">
        <!-- Inicio -->
        <Inicio v-if="opcionActiva === 'inicio'" />

        <!-- Estándares de Calidad -->
        <EstandaresView 
          v-if="opcionActiva === 'estandares'"
          :datos="estandaresCalidadFiltrados"
        />
        
        <!-- Outputs (Resultados) -->
        <OutputsView
          v-if="opcionActiva === 'outputs'"
          :datos="resultadosFiltrados"
        />
        
        <!-- Provisión de Anticonceptivos -->
        <ProvisionView 
          v-if="opcionActiva === 'provision'"
          :datos="provisionAnticonceptivosFiltrados"
        />
      </div>
    </main>

    <!-- Footer con logos -->
    <footer class="bg-white border-t border-gray-200 py-6 mt-12">
      <div class="max-w-7xl mx-auto px-3">
        <div class="flex justify-center items-center gap-8">
          <!-- Logo UNFPA -->
          <div class="flex items-center">
            <img 
              src="/logo-unfpa-blue.png" 
              alt="UNFPA - Fondo de Población de las Naciones Unidas"
              class="h-12 w-auto object-contain"
            />
          </div>
          
          <!-- Logo SESAL -->
          <div class="flex items-center">
            <img 
              src="/Logo_de_SESAL.svg.png" 
              alt="SESAL - Secretaría de Salud"
              class="h-12 w-auto object-contain"
            />
          </div>
        </div>
        
        <!-- Texto opcional -->
        <div class="text-center mt-4 text-sm text-gray-600">
          <p>Proyecto de Monitoreo - Salud Sexual y Reproductiva</p>
        </div>
      </div>
    </footer>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import { Filter } from 'lucide-vue-next'
import Navegacion from './components/Navegacion.vue'
import Filtros from './components/Filtros.vue'
import Inicio from './views/Inicio.vue'
import EstandaresView from './views/EstandaresView.vue'
import OutputsView from './views/OutputsView.vue'
import ProvisionView from './views/ProvisionView.vue'
import {
  departamentos,
  municipios,
  establecimientos,
  estandaresCalidad,
  provisionAnticonceptivos,
  tiposEstablecimiento,
  metodosAnticonceptivos
} from './data/mockData'
import { resultados } from './data/resultados'
import { provisionAnticonceptivos as provisionReal } from './data/provisionAnticonceptivos'

const opcionActiva = ref('inicio')
const departamentoSeleccionado = ref('')
const municipioSeleccionado = ref('')
const comunidadSeleccionada = ref('')
const metodoSeleccionado = ref(null)
const tipoEstablecimientoSeleccionado = ref('')

const handleOpcionSeleccionada = (opcion) => {
  opcionActiva.value = opcion
}

// Datos completos para la sección actual
const datosCompletosSeccion = computed(() => {
  if (opcionActiva.value === 'outputs') return resultados
  if (opcionActiva.value === 'provision') return provisionReal
  return []
})

// Filtrado de estándares de calidad directamente desde los datos del CSV
const estandaresCalidadFiltrados = computed(() => {
  let filtrados = estandaresCalidad
  
  // Filtro por departamento
  if (departamentoSeleccionado.value) {
    filtrados = filtrados.filter(e => e.departamento === departamentoSeleccionado.value)
  }
  
  // Filtro por municipio
  if (municipioSeleccionado.value) {
    filtrados = filtrados.filter(e => e.municipio === municipioSeleccionado.value)
  }
  
  // Filtro por comunidad
  if (comunidadSeleccionada.value) {
    filtrados = filtrados.filter(e => e.comunidad === comunidadSeleccionada.value)
  }
  
  // Filtro por tipo de establecimiento
  if (tipoEstablecimientoSeleccionado.value) {
    filtrados = filtrados.filter(e => e.tipoEstablecimiento === tipoEstablecimientoSeleccionado.value)
  }
  
  return filtrados
})

const resultadosFiltrados = computed(() => {
  let filtrados = resultados

  if (departamentoSeleccionado.value) {
    filtrados = filtrados.filter(r => r.departamento === departamentoSeleccionado.value)
  }

  if (municipioSeleccionado.value) {
    filtrados = filtrados.filter(r => r.municipio === municipioSeleccionado.value)
  }

  if (comunidadSeleccionada.value) {
    filtrados = filtrados.filter(r => r.comunidad === comunidadSeleccionada.value)
  }

  if (tipoEstablecimientoSeleccionado.value) {
    filtrados = filtrados.filter(r => r.tipoEstablecimiento === tipoEstablecimientoSeleccionado.value)
  }

  return filtrados
})

const provisionAnticonceptivosFiltrados = computed(() => {
  let filtrados = provisionReal

  if (departamentoSeleccionado.value) {
    filtrados = filtrados.filter(p => p.departamento === departamentoSeleccionado.value)
  }

  if (municipioSeleccionado.value) {
    filtrados = filtrados.filter(p => p.municipio === municipioSeleccionado.value)
  }

  if (comunidadSeleccionada.value) {
    filtrados = filtrados.filter(p => p.comunidad === comunidadSeleccionada.value)
  }

  if (tipoEstablecimientoSeleccionado.value) {
    filtrados = filtrados.filter(p => p.tipoEstablecimiento === tipoEstablecimientoSeleccionado.value)
  }

  if (metodoSeleccionado.value) {
    filtrados = filtrados.filter(p => p.metodo === metodoSeleccionado.value)
  }

  return filtrados
})

const handleDepartamentoChange = (valor) => {
  departamentoSeleccionado.value = valor || ''
  municipioSeleccionado.value = ''
  comunidadSeleccionada.value = ''
  metodoSeleccionado.value = null
  tipoEstablecimientoSeleccionado.value = ''
}

const handleMunicipioChange = (valor) => {
  municipioSeleccionado.value = valor || ''
  comunidadSeleccionada.value = ''
  metodoSeleccionado.value = null
  tipoEstablecimientoSeleccionado.value = ''
}

const handleComunidadChange = (valor) => {
  comunidadSeleccionada.value = valor || ''
}

const handleMetodoChange = (id) => {
  metodoSeleccionado.value = id
}

const handleTipoEstablecimientoChange = (tipo) => {
  tipoEstablecimientoSeleccionado.value = tipo || ''
  metodoSeleccionado.value = null
}

const limpiarFiltros = () => {
  departamentoSeleccionado.value = ''
  municipioSeleccionado.value = ''
  comunidadSeleccionada.value = ''
  metodoSeleccionado.value = null
  tipoEstablecimientoSeleccionado.value = ''
}
</script>
