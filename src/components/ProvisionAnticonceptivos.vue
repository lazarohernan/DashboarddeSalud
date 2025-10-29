<template>
  <section class="border border-gray-300 p-6">
    <div class="flex items-center gap-2 mb-4">
      <Package class="w-5 h-5 text-gray-700" />
      <h2 class="text-lg font-semibold text-gray-900">Provisión de Anticonceptivos</h2>
      <span class="text-xs text-gray-500">(Sistema Cardex - Inventario)</span>
    </div>

    <div v-if="datos.length === 0" class="text-sm text-gray-500 py-4">
      No hay datos de provisión de anticonceptivos disponibles
    </div>

    <div v-else class="overflow-x-auto">
      <table class="w-full text-sm">
        <thead>
          <tr class="border-b border-gray-300">
            <th class="text-left py-3 px-4 font-medium text-gray-700">Tipo</th>
            <th class="text-left py-3 px-4 font-medium text-gray-700">Mes</th>
            <th class="text-center py-3 px-4 font-medium text-gray-700">
              <ArrowDown class="inline-block w-4 h-4 mr-1" />
              Entran
            </th>
            <th class="text-center py-3 px-4 font-medium text-gray-700">
              <ArrowUp class="inline-block w-4 h-4 mr-1" />
              Salen
            </th>
            <th class="text-center py-3 px-4 font-medium text-gray-700">
              <Package class="inline-block w-4 h-4 mr-1" />
              Disponibles
            </th>
          </tr>
        </thead>
        <tbody>
          <tr 
            v-for="item in datos" 
            :key="item.id"
            class="border-b border-gray-200"
          >
            <td class="py-3 px-4 text-gray-900 font-medium">{{ item.tipo }}</td>
            <td class="py-3 px-4 text-gray-700">{{ formatearMes(item.mes) }}</td>
            <td class="py-3 px-4 text-center text-gray-900">{{ item.entran }}</td>
            <td class="py-3 px-4 text-center text-gray-900">{{ item.salen }}</td>
            <td class="py-3 px-4 text-center font-medium text-gray-900">
              {{ item.disponibles }}
            </td>
          </tr>
        </tbody>
      </table>

      <!-- Resumen por tipo -->
      <div class="mt-4 pt-4 border-t border-gray-300">
        <h3 class="text-sm font-medium text-gray-700 mb-3">Resumen por Tipo de Anticonceptivo</h3>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
          <div 
            v-for="(totales, tipo) in resumenPorTipo" 
            :key="tipo"
            class="border border-gray-300 p-4"
          >
            <div class="text-xs text-gray-600 mb-2">{{ tipo }}</div>
            <div class="space-y-1">
              <div class="flex justify-between text-xs">
                <span class="text-gray-600">Entran:</span>
                <span class="text-gray-900">{{ totales.entran }}</span>
              </div>
              <div class="flex justify-between text-xs">
                <span class="text-gray-600">Salen:</span>
                <span class="text-gray-900">{{ totales.salen }}</span>
              </div>
              <div class="flex justify-between text-xs font-medium pt-1 border-t border-gray-200">
                <span class="text-gray-700">Disponibles:</span>
                <span class="text-gray-900">{{ totales.disponibles }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Totales generales -->
      <div class="mt-4 pt-4 border-t border-gray-300">
        <div class="flex gap-8 text-sm">
          <div>
            <span class="font-medium text-gray-700">Total entran:</span>
            <span class="ml-2 text-gray-900">{{ totalEntran }}</span>
          </div>
          <div>
            <span class="font-medium text-gray-700">Total salen:</span>
            <span class="ml-2 text-gray-900">{{ totalSalen }}</span>
          </div>
          <div>
            <span class="font-medium text-gray-700">Total disponibles:</span>
            <span class="ml-2 text-gray-900">{{ totalDisponibles }}</span>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { computed } from 'vue'
import { Package, ArrowDown, ArrowUp } from 'lucide-vue-next'

const props = defineProps({
  datos: {
    type: Array,
    default: () => []
  }
})

const formatearMes = (mes) => {
  const [year, month] = mes.split('-')
  const fecha = new Date(year, month - 1)
  return fecha.toLocaleDateString('es-HN', {
    year: 'numeric',
    month: 'long'
  })
}

const totalEntran = computed(() => 
  props.datos.reduce((sum, item) => sum + item.entran, 0)
)

const totalSalen = computed(() => 
  props.datos.reduce((sum, item) => sum + item.salen, 0)
)

const totalDisponibles = computed(() => 
  props.datos.reduce((sum, item) => sum + item.disponibles, 0)
)

const resumenPorTipo = computed(() => {
  const resumen = {}
  props.datos.forEach(item => {
    if (!resumen[item.tipo]) {
      resumen[item.tipo] = { entran: 0, salen: 0, disponibles: 0 }
    }
    resumen[item.tipo].entran += item.entran
    resumen[item.tipo].salen += item.salen
    resumen[item.tipo].disponibles += item.disponibles
  })
  return resumen
})
</script>
