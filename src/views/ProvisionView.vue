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

    <div v-else class="space-y-6">
      <!-- Información del establecimiento -->
      <div class="bg-gray-50 p-4 rounded-lg">
        <div class="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm">
          <div>
            <span class="font-medium text-gray-700">Establecimiento:</span>
            <div class="text-gray-900">{{ establecimientoActual }}</div>
          </div>
          <div>
            <span class="font-medium text-gray-700">Tipo:</span>
            <div class="text-gray-900">{{ tipoEstablecimientoActual }}</div>
          </div>
          <div>
            <span class="font-medium text-gray-700">Comunidad:</span>
            <div class="text-gray-900">{{ comunidadActual }}</div>
          </div>
          <div>
            <span class="font-medium text-gray-700">Registros mostrados:</span>
            <div class="text-gray-900">{{ datos.length }}</div>
          </div>
        </div>
      </div>

      <div class="overflow-x-auto">
        <table class="w-full text-sm">
          <thead>
            <tr class="border-b border-gray-300">
              <th class="text-center py-3 px-4 font-medium text-gray-700">Código Método</th>
              <th class="text-left py-3 px-4 font-medium text-gray-700">Método</th>
              <th class="text-center py-3 px-4 font-medium text-gray-700">Transacción</th>
              <th class="text-center py-3 px-4 font-medium text-gray-700">
                <Package class="inline-block w-4 h-4 mr-1" />
                Cantidad
              </th>
              <th class="text-center py-3 px-4 font-medium text-gray-700">Fecha</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(item, index) in datos"
              :key="item.id"
              class="border-b border-gray-200"
            >
              <td class="py-3 px-4 text-center text-gray-900 font-medium">{{ item.codMetodo }}</td>
              <td class="py-3 px-4 text-gray-900 font-medium">{{ item.metodo }}</td>
              <td class="py-3 px-4 text-center">
                <span
                  :class="{
                    'px-2 py-1 rounded-full text-xs font-medium': true,
                    'bg-blue-100 text-blue-800': item.transaccion === 'Inicial',
                    'bg-green-100 text-green-800': item.transaccion === 'Fin de Mes'
                  }"
                >
                  {{ item.transaccion }}
                </span>
              </td>
              <td class="py-3 px-4 text-center text-gray-900 font-medium">{{ item.cantidad }}</td>
              <td class="py-3 px-4 text-center text-gray-600 text-xs">{{ item.fecha }}</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- Resumen general -->
      <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div class="bg-orange-50 border border-orange-200 p-4 rounded-lg">
          <div class="flex items-center gap-2 mb-2">
            <Package class="w-5 h-5 text-orange-600" />
            <span class="font-medium text-orange-800">Total Registros</span>
          </div>
          <div class="text-2xl font-bold text-orange-900">{{ datos.length }}</div>
        </div>

        <div class="bg-orange-50 border border-orange-200 p-4 rounded-lg">
          <div class="flex items-center gap-2 mb-2">
            <Package class="w-5 h-5 text-orange-600" />
            <span class="font-medium text-orange-800">Total Cantidad</span>
          </div>
          <div class="text-2xl font-bold text-orange-900">{{ totalCantidad }}</div>
        </div>

        <div class="bg-orange-50 border border-orange-200 p-4 rounded-lg">
          <div class="flex items-center gap-2 mb-2">
            <Package class="w-5 h-5 text-orange-600" />
            <span class="font-medium text-orange-800">Métodos Diferentes</span>
          </div>
          <div class="text-2xl font-bold text-orange-900">{{ metodosUnicos.length }}</div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { computed } from 'vue'
import { Package, TrendingDown } from 'lucide-vue-next'

const props = defineProps({
  datos: {
    type: Array,
    default: () => []
  }
})

// Información del establecimiento actual (basado en los datos filtrados)
const establecimientoActual = computed(() => {
  const establecimientos = [...new Set(props.datos.map(d => d.establecimientoNombre))]
  return establecimientos.length === 1 ? establecimientos[0] : 'Múltiples establecimientos'
})

const tipoEstablecimientoActual = computed(() => {
  const tipos = [...new Set(props.datos.map(d => d.tipoEstablecimiento))]
  return tipos.length === 1 ? tipos[0] : 'Múltiples tipos'
})

const comunidadActual = computed(() => {
  const comunidades = [...new Set(props.datos.map(d => d.comunidad))]
  return comunidades.length === 1 ? comunidades[0] : 'Múltiples comunidades'
})

const metodosUnicos = computed(() => {
  return [...new Set(props.datos.map(d => d.metodo))]
})

// Totales generales
const totalCantidad = computed(() =>
  props.datos.reduce((sum, item) => sum + item.cantidad, 0)
)
</script>
