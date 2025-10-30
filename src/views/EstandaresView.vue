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

    <div v-else>
      <div class="overflow-x-auto">
        <table class="w-full text-sm">
          <thead>
          <tr class="border-b border-gray-300">
            <th class="text-left py-3 px-4 font-medium text-gray-700">Código Eje</th>
            <th class="text-left py-3 px-4 font-medium text-gray-700">Nombre del Eje</th>
            <th class="text-left py-3 px-4 font-medium text-gray-700">Código Indicador</th>
            <th class="text-left py-3 px-4 font-medium text-gray-700">Indicador</th>
            <th class="text-center py-3 px-4 font-medium text-gray-700">Cumple</th>
            <th class="text-left py-3 px-4 font-medium text-gray-700">Fecha</th>
          </tr>
        </thead>
        <tbody>
            <tr 
              v-for="item in datosMostrados" 
              :key="item.id"
              class="border-b border-gray-200"
            >
            <td class="py-3 px-4 text-gray-900 font-medium">{{ item.codEje }}</td>
            <td class="py-3 px-4 text-gray-700">
              <div class="max-w-sm break-words leading-relaxed">
                {{ item.ejeNombre }}
              </div>
            </td>
            <td class="py-3 px-4 text-gray-700 font-mono text-xs">{{ item.codIndicador }}</td>
            <td class="py-3 px-4 text-gray-700">
              <div class="max-w-lg break-words leading-relaxed">
                {{ item.indicador }}
              </div>
            </td>
              <td class="py-3 px-4 text-center">
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
              <td class="py-3 px-4 text-gray-600 text-xs">{{ item.fecha }}</td>
            </tr>
          </tbody>
        </table>

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
import { computed } from 'vue'
import { ClipboardCheck, Check, X, MapPin } from 'lucide-vue-next'

const props = defineProps({
  datos: {
    type: Array,
    default: () => []
  }
})

// Los datos ya vienen filtrados desde el catálogo superior
const datosMostrados = computed(() => props.datos)

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

</script>
