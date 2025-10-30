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
      <!-- Información del Contexto Relacional -->
      <div class="bg-blue-50 border border-blue-200 rounded-lg p-4 mb-6">
        <h3 class="text-sm font-semibold text-blue-900 mb-3">Información de Contexto</h3>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3 text-sm">
          <div v-if="contextoRelacional.departamento" class="flex items-start gap-2">
            <span class="font-medium text-gray-700 min-w-[100px]">Departamento:</span>
            <span class="text-gray-900">{{ contextoRelacional.departamento }}</span>
          </div>
          <div v-if="contextoRelacional.municipio" class="flex items-start gap-2">
            <span class="font-medium text-gray-700 min-w-[100px]">Municipio:</span>
            <span class="text-gray-900">{{ contextoRelacional.municipio }}</span>
          </div>
          <div v-if="contextoRelacional.comunidad" class="flex items-start gap-2">
            <span class="font-medium text-gray-700 min-w-[100px]">Comunidad:</span>
            <span class="text-gray-900">{{ contextoRelacional.comunidad }}</span>
          </div>
          <div v-if="contextoRelacional.establecimientoNombre" class="flex items-start gap-2">
            <span class="font-medium text-gray-700 min-w-[100px]">Establecimiento:</span>
            <span class="text-gray-900">{{ contextoRelacional.establecimientoNombre }}</span>
          </div>
          <div v-if="contextoRelacional.tipoEstablecimiento" class="flex items-start gap-2">
            <span class="font-medium text-gray-700 min-w-[100px]">Tipo:</span>
            <span class="text-gray-900">{{ contextoRelacional.tipoEstablecimiento }}</span>
          </div>
          <div v-if="contextoRelacional.nivel" class="flex items-start gap-2">
            <span class="font-medium text-gray-700 min-w-[100px]">Nivel:</span>
            <span class="text-gray-900">{{ contextoRelacional.nivel }}</span>
          </div>
        </div>
      </div>

      <div class="overflow-x-auto">
      <table class="w-full text-sm">
        <thead>
          <tr class="border-b border-gray-300">
            <th class="text-left py-3 px-4 font-medium text-gray-700">Código Eje</th>
            <th class="text-left py-3 px-4 font-medium text-gray-700">Eje</th>
            <th class="text-left py-3 px-4 font-medium text-gray-700">Código Indicador</th>
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
            <td class="py-3 px-4 text-gray-900 font-medium">{{ item.codEje }}</td>
            <td class="py-3 px-4 text-gray-700">{{ item.ejeNombre }}</td>
            <td class="py-3 px-4 text-gray-900 font-medium">{{ item.codIndicador }}</td>
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

// Extraer contexto relacional de los datos filtrados
const contextoRelacional = computed(() => {
  if (props.datos.length === 0) {
    return {}
  }
  
  // Tomar el primer elemento que tenga todos los datos
  const firstItem = props.datos[0]
  
  return {
    nivel: firstItem.nivel || '',
    departamento: firstItem.departamento || '',
    municipio: firstItem.municipio || '',
    comunidad: firstItem.comunidad || '',
    establecimientoNombre: firstItem.establecimientoNombre || '',
    tipoEstablecimiento: firstItem.tipoEstablecimiento || ''
  }
})

const indicadoresCumplen = computed(() => 
  props.datos.filter(d => d.cumple).length
)

const indicadoresNoCumplen = computed(() => 
  props.datos.filter(d => !d.cumple).length
)
</script>
