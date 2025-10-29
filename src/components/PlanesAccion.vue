<template>
  <section class="border border-gray-300 p-6">
    <div class="flex items-center gap-2 mb-4">
      <ListChecks class="w-5 h-5 text-gray-700" />
      <h2 class="text-lg font-semibold text-gray-900">Planes de Acción</h2>
    </div>

    <div v-if="datos.length === 0" class="text-sm text-gray-500 py-4">
      No hay datos de planes de acción disponibles
    </div>

    <div v-else class="overflow-x-auto">
      <table class="w-full text-sm">
        <thead>
          <tr class="border-b border-gray-300">
            <th class="text-left py-3 px-4 font-medium text-gray-700">Tipo de Actividad</th>
            <th class="text-left py-3 px-4 font-medium text-gray-700">Fecha</th>
            <th class="text-center py-3 px-4 font-medium text-gray-700">
              <Users class="inline-block w-4 h-4 mr-1" />
              Mujeres
            </th>
            <th class="text-center py-3 px-4 font-medium text-gray-700">
              <Users class="inline-block w-4 h-4 mr-1" />
              Hombres
            </th>
            <th class="text-center py-3 px-4 font-medium text-gray-700">Total</th>
            <th class="text-left py-3 px-4 font-medium text-gray-700">Rango Edad</th>
          </tr>
        </thead>
        <tbody>
          <tr 
            v-for="item in datos" 
            :key="item.id"
            class="border-b border-gray-200"
          >
            <td class="py-3 px-4 text-gray-900">{{ item.tipoActividad }}</td>
            <td class="py-3 px-4 text-gray-700">{{ formatearFecha(item.fecha) }}</td>
            <td class="py-3 px-4 text-center text-gray-900">{{ item.mujeres }}</td>
            <td class="py-3 px-4 text-center text-gray-900">{{ item.hombres }}</td>
            <td class="py-3 px-4 text-center font-medium text-gray-900">
              {{ item.mujeres + item.hombres }}
            </td>
            <td class="py-3 px-4 text-gray-700">{{ item.rangoEdad }}</td>
          </tr>
        </tbody>
      </table>

      <!-- Resumen por tipo de actividad -->
      <div class="mt-4 pt-4 border-t border-gray-300">
        <h3 class="text-sm font-medium text-gray-700 mb-3">Resumen por Tipo de Actividad</h3>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          <div 
            v-for="(count, tipo) in resumenPorTipo" 
            :key="tipo"
            class="border border-gray-300 p-3"
          >
            <div class="text-xs text-gray-600">{{ tipo }}</div>
            <div class="text-lg font-semibold text-gray-900 mt-1">{{ count }}</div>
          </div>
        </div>
      </div>

      <!-- Totales -->
      <div class="mt-4 pt-4 border-t border-gray-300">
        <div class="flex gap-8 text-sm">
          <div>
            <span class="font-medium text-gray-700">Total actividades:</span>
            <span class="ml-2 text-gray-900">{{ datos.length }}</span>
          </div>
          <div>
            <span class="font-medium text-gray-700">Total mujeres:</span>
            <span class="ml-2 text-gray-900">{{ totalMujeres }}</span>
          </div>
          <div>
            <span class="font-medium text-gray-700">Total hombres:</span>
            <span class="ml-2 text-gray-900">{{ totalHombres }}</span>
          </div>
          <div>
            <span class="font-medium text-gray-700">Total participantes:</span>
            <span class="ml-2 text-gray-900">{{ totalParticipantes }}</span>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { computed } from 'vue'
import { ListChecks, Users } from 'lucide-vue-next'

const props = defineProps({
  datos: {
    type: Array,
    default: () => []
  }
})

const formatearFecha = (fecha) => {
  return new Date(fecha).toLocaleDateString('es-HN', {
    year: 'numeric',
    month: 'short',
    day: 'numeric'
  })
}

const totalMujeres = computed(() => 
  props.datos.reduce((sum, item) => sum + item.mujeres, 0)
)

const totalHombres = computed(() => 
  props.datos.reduce((sum, item) => sum + item.hombres, 0)
)

const totalParticipantes = computed(() => 
  totalMujeres.value + totalHombres.value
)

const resumenPorTipo = computed(() => {
  const resumen = {}
  props.datos.forEach(item => {
    resumen[item.tipoActividad] = (resumen[item.tipoActividad] || 0) + 1
  })
  return resumen
})
</script>
