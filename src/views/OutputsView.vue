<template>
  <!-- Sección de Resultados de Indicadores (Fuera del contenedor de la tabla) -->
  <div class="border border-gray-200 p-6 rounded-lg bg-white mb-6">
    <h3 class="text-base font-semibold text-gray-900 mb-4">Resultados de Indicadores</h3>
    <ResultadosIndicadoresOuts 
      @ano-seleccionado="handleAnoSeleccionado"
      @limpiar-seleccion="handleLimpiarSeleccion"
    />
    
    <!-- Cuadros de Outputs — datos reales desde datosPorOutput -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mt-6">
      <div
        v-for="(grupo, codOutput) in datosPorOutput"
        :key="codOutput"
        @click="outputSeleccionado = outputSeleccionado === codOutput ? null : codOutput"
        :class="[
          'border rounded-lg p-4 bg-white hover:shadow-md transition-all cursor-pointer',
          outputSeleccionado === codOutput ? 'border-orange-500 shadow-md' : 'border-gray-300'
        ]"
      >
        <div class="flex items-center justify-between mb-2">
          <h4 class="text-sm font-semibold text-gray-900">Output {{ codOutput }}</h4>
        </div>
        <p :class="[
          'text-xs text-gray-600 mt-2 leading-relaxed',
          outputSeleccionado === codOutput ? '' : 'line-clamp-2'
        ]">
          {{ grupo.nombre }}
        </p>
        <div class="mt-3 flex items-center gap-2">
          <span class="text-xs text-gray-500">Indicadores:</span>
          <span class="text-xs font-medium text-orange-600">{{ grupo.items.length }}</span>
        </div>
        <div v-if="anoSeleccionado" class="mt-2">
          <span class="text-xs text-gray-500">{{ anoSeleccionado }}:</span>
          <span class="text-xs font-medium text-gray-900 ml-1">
            {{ grupo.items.filter(i => i.anos?.[anoSeleccionado]?.resultado).length }}/{{ grupo.items.length }} con resultado
          </span>
        </div>
      </div>
    </div>

    <!-- Indicadores del Output seleccionado — datos reales -->
    <div
      v-if="outputSeleccionado"
      class="mt-6 pt-6 border-t border-gray-300"
    >
      <h4 class="text-sm font-semibold text-gray-900 mb-4">
        Indicadores del Output {{ outputSeleccionado }}
        <span v-if="anoSeleccionado" class="text-orange-600 ml-1">— {{ anoSeleccionado }}</span>
      </h4>
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        <div
          v-for="(item, index) in datosPorOutput[outputSeleccionado]?.items ?? []"
          :key="item.id"
          :style="{ animationDelay: `${index * 0.05}s` }"
          class="tarjeta-indicador border border-gray-200 rounded-lg p-4 bg-white hover:shadow-md transition-shadow"
        >
          <div class="flex items-start justify-between mb-2">
            <div class="flex items-center gap-2">
              <component
                :is="getIconoIndicador(item.codigoIndicador)"
                class="w-7 h-7 text-orange-600 flex-shrink-0"
              />
              <span class="text-xs font-mono font-medium text-orange-600">
                {{ item.codigoIndicador }}
              </span>
            </div>
            <!-- Resultado del año seleccionado o sin año -->
            <div class="text-right flex items-center gap-1">
              <span v-if="anoSeleccionado && item.anos?.[anoSeleccionado]?.resultado" class="text-xs text-gray-500">Resultado:</span>
              <span v-if="anoSeleccionado && item.anos?.[anoSeleccionado]?.resultado" class="text-sm font-bold text-gray-900">
                {{ item.anos[anoSeleccionado].resultado }}
              </span>
              <span v-else-if="!anoSeleccionado" class="text-xs text-gray-400">Seleccione año</span>
              <span v-else class="text-sm text-gray-400">-</span>
            </div>
          </div>
          <p class="text-xs text-gray-700 leading-relaxed mt-2">{{ item.indicador }}</p>
          <!-- Estado y Priorizado si hay año seleccionado -->
          <div v-if="anoSeleccionado" class="mt-3 flex items-center gap-2 flex-wrap">
            <span :class="[
              'px-2 py-0.5 rounded-full text-xs font-medium',
              item.anos?.[anoSeleccionado]?.priorizado === 'Si' ? 'bg-green-100 text-green-800' : 'bg-gray-100 text-gray-500'
            ]">
              {{ item.anos?.[anoSeleccionado]?.priorizado === 'Si' ? 'Priorizado' : 'No priorizado' }}
            </span>
            <span v-if="item.anos?.[anoSeleccionado]?.estado" :class="[
              'px-2 py-0.5 rounded-full text-xs font-medium',
              item.anos[anoSeleccionado].estado === 'Completado' ? 'bg-green-100 text-green-800' :
              item.anos[anoSeleccionado].estado === 'No Completado' ? 'bg-red-100 text-red-800' :
              item.anos[anoSeleccionado].estado === 'No Aplica' ? 'bg-gray-100 text-gray-500' :
              'bg-yellow-100 text-yellow-800'
            ]">
              {{ item.anos[anoSeleccionado].estado }}
            </span>
          </div>
          <div v-if="anoSeleccionado && item.anos?.[anoSeleccionado]?.observaciones" class="mt-2 text-xs text-gray-500 italic">
            {{ item.anos[anoSeleccionado].observaciones }}
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Contenedor principal con tabla -->
  <section class="border border-gray-200 p-6 rounded-lg bg-white">
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
        <div class="grid grid-cols-2 md:grid-cols-3 gap-4 text-sm">
          <div>
            <span class="font-medium text-gray-700">Total de indicadores:</span>
            <div class="text-gray-900">{{ datos.length }}</div>
          </div>
          <div>
            <span class="font-medium text-gray-700">Outputs:</span>
            <div class="text-gray-900">{{ Object.keys(datosPorOutput).length }}</div>
          </div>
          <div>
            <span class="font-medium text-gray-700">Fondos:</span>
            <div class="text-gray-900">Irlanda · Luxemburgo</div>
          </div>
        </div>
      </div>

      <!-- Un bloque por cada Output: título fuera + tabla propia -->
      <div
        v-for="(outputGrupo, codOutputTabla) in datosPorOutput"
        :key="codOutputTabla"
        v-show="!outputSeleccionado || outputSeleccionado === codOutputTabla"
        class="space-y-2"
      >
        <!-- Título del Output — fuera de la tabla -->
        <div class="flex items-center gap-3 px-1 pt-2">
          <span class="inline-flex items-center justify-center w-7 h-7 rounded-full bg-orange-500 text-white text-xs font-bold flex-shrink-0">
            {{ codOutputTabla }}
          </span>
          <p class="text-sm font-semibold text-gray-800 leading-snug">
            {{ outputGrupo.nombre }}
          </p>
        </div>

        <!-- Tabla de indicadores de este Output -->
        <div class="overflow-x-auto">
          <table class="text-sm border-collapse border border-gray-300" :style="{ minWidth: anoSeleccionado ? '2200px' : '1400px', width: '100%' }">
            <colgroup>
              <col style="width: 80px" />
              <col style="width: 110px" />
              <col style="width: 90px" />
              <col style="width: 320px" />
              <col style="width: 280px" />
              <col style="width: 110px" />
              <col style="width: 300px" />
              <template v-if="anoSeleccionado">
                <col style="width: 90px" />
                <col style="width: 100px" />
                <col style="width: 120px" />
                <col style="width: 100px" />
                <col style="width: 320px" />
              </template>
            </colgroup>
            <thead>
              <tr class="bg-gray-50">
                <th class="border border-gray-300 text-center py-3 px-4 font-medium text-gray-700">Cód. Output</th>
                <th class="border border-gray-300 text-center py-3 px-4 font-medium text-gray-700">Fondo</th>
                <th class="border border-gray-300 text-center py-3 px-4 font-medium text-gray-700">Cód. Act.</th>
                <th class="border border-gray-300 text-left py-3 px-4 font-medium text-gray-700">Actividad (EN)</th>
                <th class="border border-gray-300 text-left py-3 px-4 font-medium text-gray-700">Actividad (ES)</th>
                <th class="border border-gray-300 text-center py-3 px-4 font-medium text-gray-700">Cód. Indicador</th>
                <th class="border border-gray-300 text-left py-3 px-4 font-medium text-gray-700">Indicador</th>
                <template v-if="anoSeleccionado">
                  <th class="border border-gray-300 text-center py-3 px-4 font-medium text-orange-700 bg-orange-50">Año Ref.</th>
                  <th class="border border-gray-300 text-center py-3 px-4 font-medium text-orange-700 bg-orange-50">Priorizado</th>
                  <th class="border border-gray-300 text-center py-3 px-4 font-medium text-orange-700 bg-orange-50">Estado</th>
                  <th class="border border-gray-300 text-center py-3 px-4 font-medium text-orange-700 bg-orange-50">Resultado</th>
                  <th class="border border-gray-300 text-left py-3 px-4 font-medium text-orange-700 bg-orange-50">Observaciones</th>
                </template>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="item in outputGrupo.items"
                :key="item.id"
                class="hover:bg-gray-50 border-b border-gray-100"
              >
                <td class="border border-gray-300 py-3 px-4 text-center text-gray-900 font-medium">{{ item.codOutput }}</td>
                <td class="border border-gray-300 py-3 px-4 text-center">
                  <span :class="[
                    'px-2 py-1 rounded-full text-xs font-medium whitespace-nowrap',
                    item.fondo === 'Irlanda' ? 'bg-emerald-600 text-white' : 'bg-orange-500 text-white'
                  ]">
                    {{ item.fondo }}
                  </span>
                </td>
                <td class="border border-gray-300 py-3 px-4 text-center text-gray-900 font-medium">{{ item.codActividad }}</td>
                <td class="border border-gray-300 py-3 px-4 text-gray-900">
                  <div class="break-words leading-relaxed text-xs">{{ item.actividadIngles || '-' }}</div>
                </td>
                <td class="border border-gray-300 py-3 px-4 text-gray-900">
                  <div class="break-words leading-relaxed text-xs">{{ item.actividad || '-' }}</div>
                </td>
                <td class="border border-gray-300 py-3 px-4 text-center text-gray-900 font-medium">{{ item.codigoIndicador }}</td>
                <td class="border border-gray-300 py-3 px-4 text-gray-700">
                  <div class="break-words leading-relaxed text-xs">{{ item.indicador }}</div>
                </td>
                <template v-if="anoSeleccionado">
                  <td class="border border-gray-300 py-3 px-4 text-center text-gray-900 font-medium">
                    {{ item.anos[anoSeleccionado]?.añoReferencia ?? '-' }}
                  </td>
                  <td class="border border-gray-300 py-3 px-4 text-center">
                    <span v-if="item.anos[anoSeleccionado]?.priorizado" :class="[
                      'px-2 py-1 rounded-full text-xs font-medium',
                      item.anos[anoSeleccionado].priorizado === 'Si' ? 'bg-green-100 text-green-800' : 'bg-gray-100 text-gray-600'
                    ]">
                      {{ item.anos[anoSeleccionado].priorizado }}
                    </span>
                    <span v-else class="text-gray-400 text-xs">-</span>
                  </td>
                  <td class="border border-gray-300 py-3 px-4 text-center">
                    <span v-if="item.anos[anoSeleccionado]?.estado" :class="[
                      'px-2 py-1 rounded-full text-xs font-medium',
                      item.anos[anoSeleccionado].estado === 'Completado' ? 'bg-green-100 text-green-800' :
                      item.anos[anoSeleccionado].estado === 'No Completado' ? 'bg-red-100 text-red-800' :
                      item.anos[anoSeleccionado].estado === 'No Aplica' ? 'bg-gray-100 text-gray-500' :
                      'bg-yellow-100 text-yellow-800'
                    ]">
                      {{ item.anos[anoSeleccionado].estado }}
                    </span>
                    <span v-else class="text-gray-400 text-xs">-</span>
                  </td>
                  <td class="border border-gray-300 py-3 px-4 text-center text-gray-900 font-medium">
                    {{ item.anos[anoSeleccionado]?.resultado ?? '-' }}
                  </td>
                  <td class="border border-gray-300 py-3 px-4 text-gray-600 text-xs">
                    {{ item.anos[anoSeleccionado]?.observaciones || '—' }}
                  </td>
                </template>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- Resumen por estado -->
      <div>
        <p class="text-xs text-gray-500 mb-3">
          Resumen de actividades priorizadas — {{ anoResumen }}
          <span v-if="!anoSeleccionado" class="italic">(año por defecto; seleccioná un año arriba para cambiar)</span>
        </p>
        <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
          <div class="bg-gray-50 border border-gray-200 p-4 rounded-lg">
            <div class="flex items-center gap-2 mb-2">
              <Target class="w-5 h-5 text-gray-400" />
              <span class="font-medium text-gray-700">Priorizadas</span>
            </div>
            <div class="text-2xl font-bold text-gray-800">{{ totalPriorizados }}</div>
            <div class="text-sm text-gray-500 mt-1">de {{ datos.length }} indicadores</div>
          </div>

          <div class="bg-gray-50 border border-gray-200 p-4 rounded-lg">
            <div class="flex items-center gap-2 mb-2">
              <Check class="w-5 h-5 text-green-500" />
              <span class="font-medium text-gray-700">Completadas</span>
            </div>
            <div class="text-2xl font-bold text-green-700">{{ actividadesCompletadas }}</div>
            <div class="text-sm text-gray-500 mt-1">{{ porcentajePromedioAvance }}% de priorizadas</div>
          </div>

          <div class="bg-gray-50 border border-gray-200 p-4 rounded-lg">
            <div class="flex items-center gap-2 mb-2">
              <Clock class="w-5 h-5 text-yellow-500" />
              <span class="font-medium text-gray-700">En Proceso</span>
            </div>
            <div class="text-2xl font-bold text-yellow-700">{{ actividadesEnProceso }}</div>
            <div class="text-sm text-gray-500 mt-1">
              {{ totalPriorizados > 0 ? Math.round((actividadesEnProceso / totalPriorizados) * 100) : 0 }}% de priorizadas
            </div>
          </div>

          <div class="bg-gray-50 border border-gray-200 p-4 rounded-lg">
            <div class="flex items-center gap-2 mb-2">
              <AlertCircle class="w-5 h-5 text-red-400" />
              <span class="font-medium text-gray-700">No Completadas</span>
            </div>
            <div class="text-2xl font-bold text-red-700">{{ actividadesPendientes }}</div>
            <div class="text-sm text-gray-500 mt-1">
              {{ totalPriorizados > 0 ? Math.round((actividadesPendientes / totalPriorizados) * 100) : 0 }}% de priorizadas
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref, computed } from 'vue'
import {
  TrendingUp,
  BookOpen,
  BarChart3,
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
  Target,
  Check,
  Clock,
  AlertCircle
} from 'lucide-vue-next'
import ResultadosIndicadoresOuts from '../components/ResultadosIndicadoresOuts.vue'

const props = defineProps({
  datos: {
    type: Array,
    default: () => []
  }
})

// Selección de año
const anoSeleccionado = ref(null)

// Output seleccionado (para tarjetas superiores)
const outputSeleccionado = ref(null)

// Datos agrupados por Output
const datosPorOutput = computed(() => {
  const grupos = {}
  props.datos.forEach(item => {
    const cod = String(item.codOutput)
    if (!grupos[cod]) {
      grupos[cod] = { nombre: item.output, items: [] }
    }
    grupos[cod].items.push(item)
  })
  return grupos
})


const handleAnoSeleccionado = (ano) => {
  anoSeleccionado.value = ano
}

const handleLimpiarSeleccion = () => {
  anoSeleccionado.value = null
  outputSeleccionado.value = null
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


// Año actual para calcular el resumen (2025 si no hay año seleccionado)
const anoResumen = computed(() => anoSeleccionado.value || '2025')

// Cuenta indicadores priorizados en el año de resumen
const totalPriorizados = computed(() =>
  props.datos.filter(item => item.anos?.[anoResumen.value]?.priorizado === 'Si').length
)

const actividadesCompletadas = computed(() =>
  props.datos.filter(item =>
    item.anos?.[anoResumen.value]?.priorizado === 'Si' &&
    item.anos?.[anoResumen.value]?.estado === 'Completado'
  ).length
)

const actividadesEnProceso = computed(() =>
  props.datos.filter(item =>
    item.anos?.[anoResumen.value]?.priorizado === 'Si' &&
    item.anos?.[anoResumen.value]?.estado === 'En Proceso'
  ).length
)

const actividadesPendientes = computed(() =>
  props.datos.filter(item =>
    item.anos?.[anoResumen.value]?.priorizado === 'Si' &&
    (!item.anos?.[anoResumen.value]?.estado || item.anos?.[anoResumen.value]?.estado === 'No Completado')
  ).length
)

const porcentajePromedioAvance = computed(() => {
  if (totalPriorizados.value === 0) return 0
  return Math.round((actividadesCompletadas.value / totalPriorizados.value) * 100)
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
