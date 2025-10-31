<template>
  <!-- Sección de Resultados de Indicadores (Fuera del contenedor de la tabla) -->
  <div class="border border-gray-300 p-6 rounded-lg bg-gray-50 mb-6">
    <h3 class="text-base font-semibold text-gray-900 mb-4">Resultados de Indicadores</h3>
    <ResultadosIndicadoresOuts 
      @ano-seleccionado="handleAnoSeleccionado"
      @limpiar-seleccion="handleLimpiarSeleccion"
    />
    
    <!-- Cuadros de Outputs -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mt-6">
      <div
        v-for="outputNum in [1, 2, 3, 4]"
        :key="outputNum"
        @click="outputSeleccionado = outputSeleccionado === outputNum ? null : outputNum"
        :class="[
          'border rounded-lg p-4 bg-white hover:shadow-md transition-all cursor-pointer',
          outputSeleccionado === outputNum ? 'border-orange-500 shadow-md' : 'border-gray-300'
        ]"
      >
        <div class="flex items-center justify-between mb-2">
          <h4 class="text-sm font-semibold text-gray-900">Output {{ outputNum }}</h4>
        </div>
        <p 
          :class="[
            'text-xs text-gray-600 mt-2 leading-relaxed',
            outputSeleccionado === outputNum ? '' : 'line-clamp-2'
          ]"
        >
          {{ getOutputNombre(outputNum) }}
        </p>
        <div class="mt-3 flex items-center gap-2">
          <span class="text-xs text-gray-500">Indicadores:</span>
          <span class="text-xs font-medium text-orange-600">
            {{ getTotalIndicadores(outputNum) }}
          </span>
        </div>
        <div v-if="anoSeleccionado" class="mt-2">
          <span class="text-xs text-gray-500">Año {{ anoSeleccionado }}:</span>
          <span class="text-xs font-medium text-gray-900 ml-1">
            {{ getResumenPorAño(outputNum, anoSeleccionado) }}
          </span>
        </div>
      </div>
    </div>
    
    <!-- Tarjetas de Indicadores cuando se selecciona un output -->
    <div 
      v-if="outputSeleccionado && anoSeleccionado" 
      class="mt-6 pt-6 border-t border-gray-300"
    >
      <h4 class="text-sm font-semibold text-gray-900 mb-4">
        Indicadores del Output {{ outputSeleccionado }}
      </h4>
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        <div
          v-for="(indicador, index) in getIndicadoresPorOutput(outputSeleccionado, anoSeleccionado)"
          :key="indicador.codigo"
          :style="{ animationDelay: `${index * 0.05}s` }"
          class="tarjeta-indicador border border-gray-200 rounded-lg p-4 bg-white hover:shadow-md transition-shadow"
        >
          <div class="flex items-start justify-between mb-2">
            <div class="flex items-center gap-2">
              <component 
                :is="getIconoIndicador(indicador.codigo)" 
                class="w-7 h-7 text-orange-600 flex-shrink-0"
              />
              <span class="text-xs font-mono font-medium text-orange-600">
                {{ indicador.codigo }}
              </span>
            </div>
            <div class="text-right flex items-center gap-1">
              <span 
                v-if="indicador.resultado !== null && indicador.resultado !== undefined"
                class="text-xs text-gray-500"
              >
                Resultado:
              </span>
              <span 
                v-if="indicador.resultado !== null && indicador.resultado !== undefined"
                class="text-sm font-bold text-gray-900"
              >
                {{ indicador.resultado }}
              </span>
              <span v-else class="text-sm text-gray-400">-</span>
            </div>
          </div>
          <p class="text-xs text-gray-700 leading-relaxed mt-2">
            {{ indicador.nombre }}
          </p>
          <div class="mt-3 flex items-center gap-2 text-xs text-gray-500">
            <span>Año {{ anoSeleccionado }}</span>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Contenedor principal con tabla -->
  <section class="border border-gray-300 p-6">
    <div class="flex items-center gap-2 mb-4">
      <TrendingUp class="w-5 h-5 text-gray-700" />
      <h2 class="text-lg font-semibold text-gray-900">Resultados y Avances</h2>
      <span class="text-xs text-gray-500">(Actividades del Proyecto)</span>
    </div>

    <div v-if="datos.length === 0" class="text-sm text-gray-500 py-4">
      No hay datos de resultados disponibles
    </div>

    <div v-else class="space-y-6">

      <!-- Información del contexto -->
      <div class="bg-gray-50 p-4 rounded-lg">
        <div class="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm">
          <div>
            <span class="font-medium text-gray-700">Actividades totales:</span>
            <div class="text-gray-900">{{ datos.length }}</div>
          </div>
          <div>
            <span class="font-medium text-gray-700">Completadas:</span>
            <div class="text-green-900">{{ actividadesCompletadas }}</div>
          </div>
          <div>
            <span class="font-medium text-gray-700">En proceso:</span>
            <div class="text-yellow-900">{{ actividadesEnProceso }}</div>
          </div>
          <div>
            <span class="font-medium text-gray-700">Avance promedio:</span>
            <div class="text-blue-900">{{ porcentajePromedioAvance }}%</div>
          </div>
        </div>
      </div>

      <div class="overflow-x-auto">
        <table class="w-full text-sm">
          <thead>
            <tr class="border-b border-gray-300">
              <th class="text-center py-3 px-4 font-medium text-gray-700">Cód. Output</th>
              <th class="text-left py-3 px-4 font-medium text-gray-700 max-w-lg">Output</th>
              <th class="text-center py-3 px-4 font-medium text-gray-700">Cód. Act.</th>
              <th class="text-left py-3 px-4 font-medium text-gray-700 max-w-xl">Actividad</th>
              <th class="text-center py-3 px-4 font-medium text-gray-700">Estado</th>
              <th class="text-center py-3 px-4 font-medium text-gray-700">
                <BarChart3 class="inline-block w-4 h-4 mr-1" />
                Avance
              </th>
              <th class="text-center py-3 px-4 font-medium text-gray-700">Fecha Inicio</th>
              <th class="text-center py-3 px-4 font-medium text-gray-700">Fecha Fin</th>
              <th class="text-left py-3 px-4 font-medium text-gray-700">Establecimiento</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="item in datos"
              :key="item.id"
              class="border-b border-gray-200"
            >
              <td class="py-3 px-4 text-center text-gray-900 font-medium">{{ item.codOutput }}</td>
              <td class="py-3 px-4 text-gray-900 max-w-lg">
                <div class="break-words leading-relaxed">{{ item.output }}</div>
              </td>
              <td class="py-3 px-4 text-center text-gray-900 font-medium">{{ item.codActividad }}</td>
              <td class="py-3 px-4 text-gray-900 max-w-xl">
                <div class="break-words leading-relaxed">{{ item.actividad }}</div>
              </td>
              <td class="py-3 px-4 text-center">
                <span
                  :class="{
                    'px-2 py-1 rounded-full text-xs font-medium': true,
                    'bg-green-100 text-green-800': item.estado === 'Completado',
                    'bg-yellow-100 text-yellow-800': item.estado === 'En Proceso',
                    'bg-gray-100 text-gray-800': item.estado === 'Pendiente'
                  }"
                >
                  {{ item.estado }}
                </span>
              </td>
              <td class="py-3 px-4 text-center">
                <div class="flex items-center gap-2">
                  <div class="w-16 bg-gray-200 rounded-full h-2">
                    <div
                      class="h-2 rounded-full transition-all duration-300"
                      :class="{
                        'bg-green-600': item.porcentajeAvance === 100,
                        'bg-yellow-600': item.porcentajeAvance >= 50 && item.porcentajeAvance < 100,
                        'bg-red-600': item.porcentajeAvance < 50
                      }"
                      :style="{ width: item.porcentajeAvance + '%' }"
                    ></div>
                  </div>
                  <span class="text-sm font-medium text-gray-900">{{ item.porcentajeAvance }}%</span>
                </div>
              </td>
              <td class="py-3 px-4 text-center text-gray-600 text-xs">{{ formatearFecha(item.fechaInicio) }}</td>
              <td class="py-3 px-4 text-center text-gray-600 text-xs">{{ formatearFecha(item.fechaFin) }}</td>
              <td class="py-3 px-4 text-gray-700 max-w-xs">
                <div class="truncate" :title="item.establecimientoNombre">{{ item.establecimientoNombre }}</div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- Resumen por estado -->
      <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div class="bg-orange-50 border border-orange-200 p-4 rounded-lg">
          <div class="flex items-center gap-2 mb-2">
            <Check class="w-5 h-5 text-orange-600" />
            <span class="font-medium text-orange-800">Completadas</span>
          </div>
          <div class="text-2xl font-bold text-orange-900">{{ actividadesCompletadas }}</div>
          <div class="text-sm text-orange-600 mt-1">{{ Math.round((actividadesCompletadas / datos.length) * 100) }}% del total</div>
        </div>

        <div class="bg-orange-50 border border-orange-200 p-4 rounded-lg">
          <div class="flex items-center gap-2 mb-2">
            <Clock class="w-5 h-5 text-orange-600" />
            <span class="font-medium text-orange-800">En Proceso</span>
          </div>
          <div class="text-2xl font-bold text-orange-900">{{ actividadesEnProceso }}</div>
          <div class="text-sm text-orange-600 mt-1">{{ Math.round((actividadesEnProceso / datos.length) * 100) }}% del total</div>
        </div>

        <div class="bg-orange-50 border border-orange-200 p-4 rounded-lg">
          <div class="flex items-center gap-2 mb-2">
            <AlertCircle class="w-5 h-5 text-orange-600" />
            <span class="font-medium text-orange-800">Pendientes</span>
          </div>
          <div class="text-2xl font-bold text-orange-900">{{ actividadesPendientes }}</div>
          <div class="text-sm text-orange-600 mt-1">{{ Math.round((actividadesPendientes / datos.length) * 100) }}% del total</div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, computed } from 'vue'
import { 
  TrendingUp, 
  BarChart3, 
  Check, 
  Clock, 
  AlertCircle,
  BookOpen,
  FileText,
  Users,
  GraduationCap,
  School,
  UserCheck,
  Award,
  UserCog,
  Heart,
  HeartHandshake,
  Megaphone,
  Radio,
  UserCircle,
  Briefcase,
  FileCheck,
  Shield,
  Activity,
  Key,
  Stethoscope,
  Package,
  Building,
  UsersRound,
  MessageSquare,
  FileSearch,
  Clipboard,
  ClipboardCheck,
  Flag,
  Calendar,
  Eye,
  MapPin,
  Globe,
  Target
} from 'lucide-vue-next'
import ResultadosIndicadoresOuts from '../components/ResultadosIndicadoresOuts.vue'
import { indicadoresPorOutput, getResumenOutput, getIndicadoresPorOutputYAño } from '../data/indicadores'

const props = defineProps({
  datos: {
    type: Array,
    default: () => []
  }
})

// Selección de año (obligatorio)
const anoSeleccionado = ref(null)

// Output seleccionado (opcional)
const outputSeleccionado = ref(null)

const handleAnoSeleccionado = (ano) => {
  anoSeleccionado.value = ano
}

const handleLimpiarSeleccion = () => {
  anoSeleccionado.value = null
  outputSeleccionado.value = null
}

// Función helper para obtener el nombre del output
const getOutputNombre = (codOutput) => {
  const output = indicadoresPorOutput[String(codOutput)]
  if (!output) return 'Output no encontrado'
  return output.nombre
}

// Función para obtener total de indicadores de un output
const getTotalIndicadores = (codOutput) => {
  const output = indicadoresPorOutput[String(codOutput)]
  if (!output) return 0
  return output.indicadores.length
}

// Función para obtener resumen por año
const getResumenPorAño = (codOutput, año) => {
  const resumen = getResumenOutput(String(codOutput), año)
  return `${resumen.indicadoresConResultado}/${resumen.totalIndicadores} con resultado`
}

// Función para obtener indicadores de un output para mostrar en tarjetas
const getIndicadoresPorOutput = (codOutput, año) => {
  return getIndicadoresPorOutputYAño(String(codOutput), año)
}

// Función para obtener el icono apropiado según el código del indicador
const getIconoIndicador = (codigo) => {
  const iconos = {
    // OUTPUT 1 - Educación Sexual Integral
    '1.1': BookOpen,
    '1.2': BarChart3,
    '1.3': FileText,
    '1.4': Users,
    '1.5': School,
    '1.6': Award,
    '1.7': Heart,
    '1.8': Heart,
    '1.9': Megaphone,
    '1.10': HeartHandshake,
    '1.11': UserCircle,
    
    // OUTPUT 2 - Servicios de Salud
    '2.1': FileCheck,
    '2.2': Activity,
    '2.3': Activity,
    '2.4': FileText,
    '2.5': Stethoscope,
    '2.6': Stethoscope,
    '2.7': Award,
    '2.8': Stethoscope,
    '2.9': Stethoscope,
    '2.10': Package,
    '2.11': Package,
    '2.12': Megaphone,
    '2.13': Key,
    '2.14': UserCircle,
    
    // OUTPUT 3 - Liderazgo y Empoderamiento
    '3.1': GraduationCap,
    '3.2': Users,
    '3.3': Users,
    '3.4': UsersRound,
    '3.5': UsersRound,
    '3.6': Building,
    '3.7': Shield,
    '3.8': MessageSquare,
    '3.9': UserCircle,
    
    // OUTPUT 4 - Seguimiento y Evaluación
    '4.1': FileSearch,
    '4.2': FileText,
    '4.3': ClipboardCheck,
    '4.4': BarChart3,
    '4.5': Flag,
    '4.6': Calendar,
    '4.7': FileText,
    '4.8': Eye,
    '4.9': MapPin,
    '4.10': Users,
    '4.11': Briefcase
  }
  
  return iconos[codigo] || Target
}

const formatearFecha = (fecha) => {
  if (!fecha) return '-'
  return new Date(fecha).toLocaleDateString('es-HN', {
    year: 'numeric',
    month: 'short',
    day: 'numeric'
  })
}

const actividadesCompletadas = computed(() =>
  props.datos.filter(item => item.estado === 'Completado').length
)

const actividadesEnProceso = computed(() =>
  props.datos.filter(item => item.estado === 'En Proceso').length
)

const actividadesPendientes = computed(() =>
  props.datos.filter(item => item.estado === 'Pendiente').length
)

const porcentajePromedioAvance = computed(() => {
  if (props.datos.length === 0) return 0
  const total = props.datos.reduce((sum, item) => sum + item.porcentajeAvance, 0)
  return Math.round(total / props.datos.length)
})
</script>

<style scoped>
@keyframes fadeInDiagonal {
  from {
    opacity: 0;
    transform: translate(-20px, -20px) scale(0.95);
  }
  to {
    opacity: 1;
    transform: translate(0, 0) scale(1);
  }
}

.tarjeta-indicador {
  animation: fadeInDiagonal 0.4s ease-out forwards;
  opacity: 0;
}
</style>
