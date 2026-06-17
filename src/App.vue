<template>
  <div class="min-h-screen">
    <header class="bg-white border-b border-gray-200 py-4 px-6">
      <div class="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <div>
          <h1 class="text-2xl font-bold text-gray-900">Proyecto No Dejar A Nadie Atrás</h1>
          <p class="text-sm text-gray-600 mt-1">Sistema de Monitoreo y Seguimiento</p>
        </div>

        <div class="flex items-center gap-3 shrink-0">
          <template v-if="authLoading">
            <span class="text-sm text-gray-500">Cargando...</span>
          </template>
          <template v-else-if="isAuthenticated">
            <div class="flex items-center gap-2 px-3 py-1.5 bg-orange-50 border border-orange-200 rounded-full">
              <ShieldCheck class="w-4 h-4 text-orange-600" />
              <span class="text-sm font-medium text-gray-800">{{ displayName }}</span>
            </div>
            <button
              type="button"
              class="px-4 py-2 text-sm font-medium text-gray-700 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors"
              @click="handleCerrarSesion"
            >
              Cerrar sesión
            </button>
          </template>
          <button
            v-else
            type="button"
            class="px-4 py-2 text-sm font-medium text-white bg-slate-700 rounded-lg hover:bg-slate-800 transition-colors"
            @click="mostrarLogin = true"
          >
            Ingresar
          </button>
        </div>
      </div>
    </header>

    <main class="p-6 space-y-4">
      <LoginView
        v-if="mostrarLogin"
        @login-exitoso="handleLoginExitoso"
        @volver="mostrarLogin = false"
      />

      <template v-else>
      <div
        v-if="datosLoading"
        class="flex items-center justify-center gap-3 py-16 text-gray-600"
      >
        <span class="inline-block w-5 h-5 border-2 border-orange-500 border-t-transparent rounded-full animate-spin" />
        <span>Cargando datos del proyecto...</span>
      </div>

      <div
        v-else-if="datosError"
        class="rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-red-800"
      >
        <p>{{ datosError }}</p>
        <button
          type="button"
          class="mt-2 text-sm font-medium text-red-700 underline hover:text-red-900"
          @click="recargarDatos"
        >
          Reintentar
        </button>
      </div>

      <template v-else>
      <Navegacion :is-admin="isAdmin" @opcion-seleccionada="handleOpcionSeleccionada" />
      
      <!-- Filtros para Estándares de Calidad -->
      <Filtros
        v-if="opcionActiva === 'estandares'"
        :datos-completos="estandaresCalidad"
        :catalogos="catalogos"
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
        :catalogos="catalogos"
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
        :catalogos="catalogos"
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
        :catalogos="catalogos"
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
        <Inicio v-if="opcionActiva === 'inicio'" :outputs="outputs" />

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
          :indicadores-kpi="indicadoresKpi"
          :provision="provisionAnticonceptivos"
          :estandares="estandaresCalidadFiltrados"
        />

        <!-- Panel de Administración (solo admin) -->
        <AdminView v-if="opcionActiva === 'admin' && isAdmin" />
        <div
          v-else-if="opcionActiva === 'admin' && !isAdmin"
          class="rounded-lg border border-red-200 bg-red-50 px-6 py-10 text-center text-red-700"
        >
          <p class="font-semibold">Acceso restringido</p>
          <p class="text-sm mt-1">Debes iniciar sesión como administrador para acceder a este panel.</p>
        </div>
      </div>
      </template>
      </template>
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
import { ref, computed, onMounted } from 'vue'
import { ShieldCheck } from 'lucide-vue-next'
import Navegacion from './components/Navegacion.vue'
import Filtros from './components/Filtros.vue'
import Inicio from './views/Inicio.vue'
import EstandaresView from './views/EstandaresView.vue'
import OutputsView from './views/OutputsView.vue'
import ProvisionView from './views/ProvisionView.vue'
import IndicadoresView from './views/IndicadoresView.vue'
import LoginView from './views/LoginView.vue'
import AdminView from './views/admin/AdminView.vue'
import { useAuth } from './composables/useAuth'
import { useDashboardData } from './composables/useDashboardData'

const { initAuth, signOut, loading: authLoading, isAuthenticated, isAdmin, displayName } = useAuth()
const {
  resultados,
  provision: provisionAnticonceptivos,
  estandares: estandaresCalidad,
  indicadoresKpi,
  catalogos,
  outputs,
  loading: datosLoading,
  error: datosError,
  recargar: recargarDatos
} = useDashboardData()

const mostrarLogin = ref(false)
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
  if (opcionActiva.value === 'outputs') return resultados.value
  if (opcionActiva.value === 'provision') return provisionAnticonceptivos.value
  return []
})

const estandaresCalidadFiltrados = computed(() => {
  let filtrados = estandaresCalidad.value
  
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
  let filtrados = resultados.value

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

const provisionAnticonceptivosFiltrados = computed(() => provisionAnticonceptivos.value)

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

onMounted(() => {
  initAuth()
})

const handleLoginExitoso = () => {
  mostrarLogin.value = false
  opcionActiva.value = 'inicio'
}

const handleCerrarSesion = async () => {
  await signOut()
  mostrarLogin.value = false
  opcionActiva.value = 'inicio'
}
</script>
