<template>
  <div class="min-h-screen">
    <header class="bg-white border-b border-gray-200 py-4 px-6">
      <h1 class="text-2xl font-bold text-gray-900">Proyecto No Dejar A Nadie Atrás</h1>
      <p class="text-sm text-gray-600 mt-1">Sistema de Monitoreo y Seguimiento</p>
    </header>

    <main class="p-6 space-y-4">
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
        @reset="limpiarFiltros"
      />

      <!-- Filtros para Outputs — solo Fondo (datos nacionales, no por establecimiento) -->
      <Filtros
        v-if="opcionActiva === 'outputs'"
        :datos-completos="datosCompletosSeccion"
        :fondo-seleccionado="fondoSeleccionado"
        :mostrar-comunidad="false"
        :mostrar-fondo="true"
        :solo-departamento-municipio="false"
        :ocultar-establecimiento="true"
        @reset="limpiarFiltros"
        @update:fondo="handleFondoChange"
      />


      <!-- Filtros para Indicadores -->
      <Filtros
        v-if="opcionActiva === 'indicadores'"
        :datos-completos="[]"
        :departamento-seleccionado="departamentoSeleccionado"
        :municipio-seleccionado="municipioSeleccionado"
        :mostrar-comunidad="false"
        :solo-departamento-municipio="true"
        @update:departamento="handleDepartamentoChange"
        @update:municipio="handleMunicipioChange"
      />

      <!-- Filtros para otras secciones (sin comunidad) -->
      <Filtros
        v-if="opcionActiva !== 'inicio' && opcionActiva !== 'estandares' && opcionActiva !== 'outputs' && opcionActiva !== 'provision' && opcionActiva !== 'indicadores'"
        :datos-completos="datosCompletosSeccion"
        :departamento-seleccionado="departamentoSeleccionado"
        :municipio-seleccionado="municipioSeleccionado"
        :tipo-establecimiento-seleccionado="tipoEstablecimientoSeleccionado"
        :mostrar-comunidad="false"
        @update:departamento="handleDepartamentoChange"
        @update:municipio="handleMunicipioChange"
        @update:tipoEstablecimiento="handleTipoEstablecimientoChange"
        @reset="limpiarFiltros"
      />


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

        <!-- Indicadores LNOB -->
        <IndicadoresView
          v-if="opcionActiva === 'indicadores'"
          :departamento-seleccionado="departamentoSeleccionado"
          :municipio-seleccionado="municipioSeleccionado"
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
          
        </div>
        
        <!-- Texto opcional -->
        <div class="text-center mt-4 text-sm text-gray-600">
          <p>Proyecto No Dejar A Nadie Atrás - Sistema de Monitoreo y Seguimiento</p>
        </div>
      </div>
    </footer>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import Navegacion from './components/Navegacion.vue'
import Filtros from './components/Filtros.vue'
import Inicio from './views/Inicio.vue'
import EstandaresView from './views/EstandaresView.vue'
import OutputsView from './views/OutputsView.vue'
import ProvisionView from './views/ProvisionView.vue'
import IndicadoresView from './views/IndicadoresView.vue'
import { estandaresCalidad } from './data/mockData'
import { resultados } from './data/resultados'
import { provisionAnticonceptivos as provisionReal } from './data/provisionAnticonceptivos'

const opcionActiva = ref('inicio')
const departamentoSeleccionado = ref('')
const municipioSeleccionado = ref('')
const comunidadSeleccionada = ref('')
const metodoSeleccionado = ref(null)
const tipoEstablecimientoSeleccionado = ref('')
const fondoSeleccionado = ref('')

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

  if (fondoSeleccionado.value) {
    filtrados = filtrados.filter(r => r.fondo === fondoSeleccionado.value)
  }

  return filtrados
})

const provisionAnticonceptivosFiltrados = computed(() => provisionReal)

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

const handleTipoEstablecimientoChange = (tipo) => {
  tipoEstablecimientoSeleccionado.value = tipo || ''
  metodoSeleccionado.value = null
}

const handleFondoChange = (valor) => {
  fondoSeleccionado.value = valor || ''
}

const limpiarFiltros = () => {
  departamentoSeleccionado.value = ''
  municipioSeleccionado.value = ''
  comunidadSeleccionada.value = ''
  metodoSeleccionado.value = null
  tipoEstablecimientoSeleccionado.value = ''
  fondoSeleccionado.value = ''
}
</script>
