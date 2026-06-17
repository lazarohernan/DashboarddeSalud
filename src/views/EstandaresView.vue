<template>
  <section class="border border-gray-200 p-6 rounded-lg bg-white">
    <div class="flex items-center gap-2 mb-4">
      <ClipboardCheck class="w-5 h-5 text-gray-700" />
      <h2 class="text-lg font-semibold text-gray-900">Autodiagnóstico <span class="font-normal text-gray-500">(ECA)</span></h2>
      <span class="text-xs text-gray-500">(Solo Establecimientos de Salud)</span>
    </div>

    <!-- Descripción del Autodiagnóstico -->
    <div class="bg-gray-50 border border-gray-200 rounded-lg p-5 mb-6">
      <p class="text-sm text-gray-700 leading-relaxed">
        El autodiagnóstico es una herramienta práctica que permite al establecimiento de salud evaluar, de manera estructurada, qué tan alineados están sus servicios con los estándares de calidad para la atención de adolescentes.
        Su objetivo no es "calificar" al equipo, sino identificar fortalezas, brechas y prioridades de mejora en ocho áreas clave: información, apoyo comunitario, oferta de servicios, competencias del personal, condiciones del establecimiento, equidad, uso de datos y participación adolescente.
        Es el primer paso para ordenar el trabajo y avanzar de forma progresiva hacia servicios más accesibles, respetuosos y de calidad.
      </p>
    </div>

    <!-- Procedimiento para realizar el Autodiagnóstico -->
    <div class="bg-orange-50 border border-orange-200 rounded-lg p-5 mb-6">
      <h3 class="text-sm font-semibold text-orange-900 mb-3">Procedimiento para realizar el autodiagnóstico:</h3>
      <ol class="space-y-2 text-sm text-gray-700">
        <li class="flex gap-2">
          <span class="font-semibold text-orange-700 shrink-0">1.</span>
          <span><strong>Formar un equipo pequeño:</strong> Incluir al responsable del establecimiento y al menos un proveedor/a de salud.</span>
        </li>
        <li class="flex gap-2">
          <span class="font-semibold text-orange-700 shrink-0">2.</span>
          <span><strong>Leer y responder el cuestionario completo:</strong> Marcar cada pregunta según la situación real del establecimiento.</span>
        </li>
        <li class="flex gap-2">
          <span class="font-semibold text-orange-700 shrink-0">3.</span>
          <span><strong>Responder con objetividad:</strong> Basarse en evidencia concreta (no en supuestos).</span>
        </li>
        <li class="flex gap-2">
          <span class="font-semibold text-orange-700 shrink-0">4.</span>
          <span><strong>Identificar brechas:</strong> Tomar nota breve de los aspectos que requieren mejora.</span>
        </li>
        <li class="flex gap-2">
          <span class="font-semibold text-orange-700 shrink-0">5.</span>
          <span><strong>Definir acciones inmediatas:</strong> Seleccionar pocas acciones concretas y asignar responsable.</span>
        </li>
      </ol>
    </div>

    <div v-if="datos.length === 0" class="text-sm text-gray-500 py-4">
      No hay datos de autodiagnóstico disponibles
    </div>

    <div v-else>
      <!-- Tarjetas de Ejes -->
      <TarjetasEjes 
        :datos="datos" 
        @eje-seleccionado="handleEjeSeleccionado"
      />

      <!-- Tarjeta de Detalle del Eje (Modal) -->
      <div 
        v-if="filaSeleccionada"
        class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4"
        @click.self="cerrarTarjeta"
      >
        <div class="bg-white rounded-lg shadow-xl max-w-4xl w-full max-h-[90vh] overflow-y-auto">
          <div class="sticky top-0 bg-white border-b border-gray-200 p-4 flex items-center justify-between">
            <h3 class="text-xl font-light text-gray-800">
              Detalle del Eje {{ filaSeleccionada.codEje }}: {{ filaSeleccionada.ejeNombre }}
            </h3>
            <button
              @click="cerrarTarjeta"
              class="text-gray-500 hover:text-gray-700 transition-colors"
            >
              <X class="w-6 h-6" />
            </button>
          </div>
          
          <div class="p-6">
            <!-- Resumen del Eje -->
            <div class="mb-6 bg-orange-50 border border-orange-200 rounded-lg p-4">
              <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                <div>
                  <div class="text-sm text-gray-600">Código Eje</div>
                  <div class="text-lg font-medium text-orange-900">{{ filaSeleccionada.codEje }}</div>
                </div>
                <div>
                  <div class="text-sm text-gray-600">Total Indicadores</div>
                  <div class="text-lg font-medium text-gray-900">{{ indicadoresDelEje.length }}</div>
                </div>
                <div>
                  <div class="text-sm text-gray-600">Cumplen</div>
                  <div class="text-lg font-medium text-green-700">{{ indicadoresDelEje.filter(i => i.cumple).length }}</div>
                </div>
                <div>
                  <div class="text-sm text-gray-600">% Cumplimiento</div>
                  <div class="text-lg font-medium" :class="getColorPorcentajeTexto(getEjePorcentaje(filaSeleccionada.codEje))">
                    {{ getEjePorcentaje(filaSeleccionada.codEje) }}%
                  </div>
                </div>
              </div>
            </div>

            <!-- Lista de Indicadores -->
            <div class="space-y-3">
              <h4 class="font-semibold text-gray-800 mb-3">Indicadores del Eje:</h4>
              <div
                v-for="indicador in indicadoresDelEje"
                :key="indicador.id"
                class="border border-gray-200 rounded-lg p-4 hover:bg-gray-50 transition-colors"
              >
                <div class="flex items-start justify-between mb-2">
                  <div class="flex-1">
                    <div class="flex items-center gap-2 mb-1">
                      <span class="text-xs font-mono text-gray-500">{{ indicador.codIndicador }}</span>
                      <span 
                        v-if="indicador.cumple"
                        class="inline-flex items-center gap-1 text-xs text-green-700 bg-green-50 px-2 py-1 rounded"
                      >
                        <Check class="w-3 h-3" />
                        Cumple
                      </span>
                      <span 
                        v-else
                        class="inline-flex items-center gap-1 text-xs text-red-700 bg-red-50 px-2 py-1 rounded"
                      >
                        <X class="w-3 h-3" />
                        No Cumple
                      </span>
                    </div>
                    <div class="text-sm text-gray-800 font-medium mt-2">
                      {{ indicador.indicador }}
                    </div>
                  </div>
                </div>
                <div class="text-xs text-gray-500 mt-2">
                  Fecha: {{ indicador.fecha }}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Tabla de Estándares -->
      <div class="overflow-x-auto">
        <table class="w-full text-sm border-collapse border border-gray-300">
          <thead>
          <tr class="bg-orange-50">
            <th class="border border-gray-300 text-left py-3 px-4 font-medium text-orange-900">Código Eje</th>
            <th class="border border-gray-300 text-left py-3 px-4 font-medium text-orange-900">Nombre del Eje</th>
            <th class="border border-gray-300 text-left py-3 px-4 font-medium text-orange-900">Código Indicador</th>
            <th class="border border-gray-300 text-left py-3 px-4 font-medium text-orange-900">Indicador</th>
            <th class="border border-gray-300 text-center py-3 px-4 font-medium text-orange-900">Cumple</th>
            <th class="border border-gray-300 text-left py-3 px-4 font-medium text-orange-900">Fecha</th>
          </tr>
        </thead>
        <tbody>
            <tr
              v-for="item in datosTablaPaginados"
              :key="item.id"
              @click="mostrarDetalleEje(item)"
              class="hover:bg-gray-50 transition-colors duration-150 cursor-pointer"
            >
            <td class="border border-gray-300 py-3 px-4 text-gray-900 font-medium">{{ item.codEje }}</td>
            <td class="border border-gray-300 py-3 px-4 text-gray-700">
              <div class="max-w-sm break-words leading-relaxed">
                {{ item.ejeNombre }}
              </div>
            </td>
            <td class="border border-gray-300 py-3 px-4 text-gray-700 font-mono text-xs">{{ item.codIndicador }}</td>
            <td class="border border-gray-300 py-3 px-4 text-gray-700">
              <div class="max-w-lg break-words leading-relaxed">
                {{ item.indicador }}
              </div>
            </td>
              <td class="border border-gray-300 py-3 px-4 text-center">
                <div class="flex flex-col items-center gap-1">
                  <span v-if="item.cumple" class="inline-flex items-center gap-1 text-green-700">
                    <Check class="w-4 h-4" />
                    Sí
                  </span>
                  <span v-else class="inline-flex items-center gap-1 text-red-700">
                    <X class="w-4 h-4" />
                    No
                  </span>
                  <span class="text-xs text-gray-500">
                    Eje {{ item.codEje }}: {{ getEjePorcentaje(item.codEje) }}%
                  </span>
                </div>
              </td>
              <td class="border border-gray-300 py-3 px-4 text-gray-600 text-xs">{{ item.fecha }}</td>
            </tr>
          </tbody>
        </table>

        <Pagination
          v-if="datosMostrados.length > 0"
          v-model:page="page"
          v-model:page-size="pageSize"
          :total="total"
        />

        <!-- Resumen General -->
        <div class="mt-4 pt-4 border-t border-gray-300">
          <div class="flex gap-8 text-sm">
            <div>
              <span class="font-medium text-gray-700">Total indicadores:</span>
              <span class="ml-2 text-gray-900">{{ datosMostrados.length }}</span>
            </div>
            <div>
              <span class="font-medium text-gray-700">Cumplen:</span>
              <span class="ml-2 text-green-700 font-semibold">{{ indicadoresCumplen }}</span>
            </div>
            <div>
              <span class="font-medium text-gray-700">No cumplen:</span>
              <span class="ml-2 text-red-700 font-semibold">{{ indicadoresNoCumplen }}</span>
            </div>
            <div>
              <span class="font-medium text-gray-700">% Cumplimiento:</span>
              <span class="ml-2 font-semibold" :class="porcentajeCumplimiento >= 70 ? 'text-green-700' : porcentajeCumplimiento >= 50 ? 'text-yellow-700' : 'text-red-700'">
                {{ porcentajeCumplimiento }}%
              </span>
            </div>
          </div>
        </div>


      </div>
    </div>
  </section>
</template>

<script setup>
import { computed, ref, watch } from 'vue'
import { ClipboardCheck, Check, X, MapPin } from 'lucide-vue-next'
import TarjetasEjes from '../components/TarjetasEjes.vue'
import Pagination from '../components/Pagination.vue'
import { usePagination } from '../composables/usePagination'

const props = defineProps({
  datos: {
    type: Array,
    default: () => []
  }
})

// Eje seleccionado para filtrar
const ejeSeleccionado = ref(null)

// Fila seleccionada para mostrar detalle
const filaSeleccionada = ref(null)

// Filtrar datos por eje seleccionado
const datosMostrados = computed(() => {
  if (ejeSeleccionado.value === null) {
    return props.datos
  }
  return props.datos.filter(item => String(item.codEje) === String(ejeSeleccionado.value))
})

const {
  page,
  pageSize,
  total,
  paginatedItems: datosTablaPaginados,
  reiniciar: reiniciarPaginacion
} = usePagination(datosMostrados, { pageSize: 25 })

watch(ejeSeleccionado, () => {
  reiniciarPaginacion()
})

// Manejador para cuando se selecciona un eje
const handleEjeSeleccionado = (codigoEje) => {
  ejeSeleccionado.value = codigoEje
}

const indicadoresCumplen = computed(() => 
  datosMostrados.value.filter(d => d.cumple).length
)

const indicadoresNoCumplen = computed(() => 
  datosMostrados.value.filter(d => !d.cumple).length
)

const porcentajeCumplimiento = computed(() => {
  if (datosMostrados.value.length === 0) return 0
  return Math.round((indicadoresCumplen.value / datosMostrados.value.length) * 100)
})

const cumplimientoPorEje = computed(() => {
  const ejes = {}

  datosMostrados.value.forEach(item => {
    if (!ejes[item.codEje]) {
      ejes[item.codEje] = {
        codigo: item.codEje,
        nombre: item.ejeNombre,
        total: 0,
        cumplen: 0
      }
    }
    ejes[item.codEje].total++
    if (item.cumple) {
      ejes[item.codEje].cumplen++
    }
  })

  return Object.values(ejes).map(eje => ({
    ...eje,
    porcentaje: Math.round((eje.cumplen / eje.total) * 100)
  })).sort((a, b) => parseInt(a.codigo) - parseInt(b.codigo))
})

// Función para obtener porcentaje de un eje específico
const getEjePorcentaje = (codEje) => {
  const eje = cumplimientoPorEje.value.find(e => e.codigo === codEje.toString())
  return eje ? eje.porcentaje : 0
}

// Función para mostrar detalle del eje
const mostrarDetalleEje = (item) => {
  filaSeleccionada.value = item
}

// Función para cerrar la tarjeta de detalle
const cerrarTarjeta = () => {
  filaSeleccionada.value = null
}

// Obtener todos los indicadores del eje seleccionado
const indicadoresDelEje = computed(() => {
  if (!filaSeleccionada.value) return []
  return props.datos.filter(item => String(item.codEje) === String(filaSeleccionada.value.codEje))
})

// Función para obtener color del porcentaje en texto
const getColorPorcentajeTexto = (porcentaje) => {
  if (porcentaje >= 70) return 'text-green-700'
  if (porcentaje >= 50) return 'text-orange-700'
  return 'text-red-700'
}

</script>
