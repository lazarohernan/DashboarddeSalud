<template>
  <section class="border border-gray-300 p-6">
    <div class="flex items-center gap-2 mb-4">
      <ClipboardCheck class="w-5 h-5 text-gray-700" />
      <h2 class="text-lg font-semibold text-gray-900">Estándares de Calidad</h2>
      <span class="text-xs text-gray-500">(Solo Establecimientos de Salud)</span>
    </div>

    <div v-if="datos.length === 0" class="text-sm text-gray-500 py-4">
      No hay datos de estándares de calidad disponibles
    </div>

    <div v-else class="overflow-x-auto">
      <table class="w-full text-sm">
        <thead>
          <tr class="border-b border-gray-300">
            <th class="text-left py-3 px-4 font-medium text-gray-700">Eje</th>
            <th class="text-left py-3 px-4 font-medium text-gray-700">Indicador</th>
            <th class="text-center py-3 px-4 font-medium text-gray-700">Cumple</th>
          </tr>
        </thead>
        <tbody>
          <tr 
            v-for="item in datos" 
            :key="item.id"
            class="border-b border-gray-200"
          >
            <td class="py-3 px-4 text-gray-900">{{ item.eje }}</td>
            <td class="py-3 px-4 text-gray-700">{{ item.indicador }}</td>
            <td class="py-3 px-4 text-center">
              <span v-if="item.cumple" class="inline-flex items-center gap-1">
                <Check class="w-4 h-4" />
                Sí
              </span>
              <span v-else class="inline-flex items-center gap-1">
                <X class="w-4 h-4" />
                No
              </span>
            </td>
          </tr>
        </tbody>
      </table>

      <!-- Resumen -->
      <div class="mt-4 pt-4 border-t border-gray-300">
        <div class="flex gap-8 text-sm">
          <div>
            <span class="font-medium text-gray-700">Total indicadores:</span>
            <span class="ml-2 text-gray-900">{{ datos.length }}</span>
          </div>
          <div>
            <span class="font-medium text-gray-700">Cumplen:</span>
            <span class="ml-2 text-gray-900">{{ indicadoresCumplen }}</span>
          </div>
          <div>
            <span class="font-medium text-gray-700">No cumplen:</span>
            <span class="ml-2 text-gray-900">{{ indicadoresNoCumplen }}</span>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { computed } from 'vue'
import { ClipboardCheck, Check, X } from 'lucide-vue-next'

const props = defineProps({
  datos: {
    type: Array,
    default: () => []
  }
})

const indicadoresCumplen = computed(() => 
  props.datos.filter(d => d.cumple).length
)

const indicadoresNoCumplen = computed(() => 
  props.datos.filter(d => !d.cumple).length
)
</script>
