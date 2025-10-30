<template>
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
import { computed } from 'vue'
import { TrendingUp, BarChart3, Check, Clock, AlertCircle } from 'lucide-vue-next'

const props = defineProps({
  datos: {
    type: Array,
    default: () => []
  }
})

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
