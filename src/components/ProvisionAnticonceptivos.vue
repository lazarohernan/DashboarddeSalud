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
            <span class="font-medium text-gray-700">Total métodos:</span>
            <div class="text-gray-900">{{ metodosUnicos.length }}</div>
          </div>
        </div>
      </div>

      <div class="overflow-x-auto">
        <table class="w-full text-sm">
          <thead>
            <tr class="border-b border-gray-300">
              <th class="text-left py-3 px-4 font-medium text-gray-700">Método Anticonceptivo</th>
              <th class="text-center py-3 px-4 font-medium text-gray-700">Stock Inicial</th>
              <th class="text-center py-3 px-4 font-medium text-gray-700">Stock Final</th>
              <th class="text-center py-3 px-4 font-medium text-gray-700">
                <TrendingDown class="inline-block w-4 h-4 mr-1" />
                Utilizados
              </th>
              <th class="text-center py-3 px-4 font-medium text-gray-700">Fecha Inicial</th>
              <th class="text-center py-3 px-4 font-medium text-gray-700">Fecha Final</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="metodo in metodosAgrupados"
              :key="metodo.codMetodo"
              class="border-b border-gray-200"
            >
              <td class="py-3 px-4 text-gray-900 font-medium">{{ metodo.metodo }}</td>
              <td class="py-3 px-4 text-center text-gray-900">
                <span class="inline-flex items-center gap-1">
                  <Package class="w-4 h-4 text-green-600" />
                  {{ metodo.stockInicial }}
                </span>
              </td>
              <td class="py-3 px-4 text-center text-gray-900">
                <span class="inline-flex items-center gap-1">
                  <Package class="w-4 h-4 text-blue-600" />
                  {{ metodo.stockFinal }}
                </span>
              </td>
              <td class="py-3 px-4 text-center text-gray-900">
                <span
                  class="inline-flex items-center gap-1"
                  :class="metodo.utilizados > 0 ? 'text-red-600' : 'text-gray-400'"
                >
                  <TrendingDown class="w-4 h-4" />
                  {{ metodo.utilizados }}
                </span>
              </td>
              <td class="py-3 px-4 text-center text-gray-600 text-xs">{{ metodo.fechaInicial }}</td>
              <td class="py-3 px-4 text-center text-gray-600 text-xs">{{ metodo.fechaFinal }}</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- Resumen general -->
      <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
        <div class="bg-green-50 border border-green-200 p-4 rounded-lg">
          <div class="flex items-center gap-2 mb-2">
            <Package class="w-5 h-5 text-green-600" />
            <span class="font-medium text-green-800">Stock Inicial Total</span>
          </div>
          <div class="text-2xl font-bold text-green-900">{{ totalStockInicial }}</div>
        </div>

        <div class="bg-blue-50 border border-blue-200 p-4 rounded-lg">
          <div class="flex items-center gap-2 mb-2">
            <Package class="w-5 h-5 text-blue-600" />
            <span class="font-medium text-blue-800">Stock Final Total</span>
          </div>
          <div class="text-2xl font-bold text-blue-900">{{ totalStockFinal }}</div>
        </div>

        <div class="bg-red-50 border border-red-200 p-4 rounded-lg">
          <div class="flex items-center gap-2 mb-2">
            <TrendingDown class="w-5 h-5 text-red-600" />
            <span class="font-medium text-red-800">Total Utilizados</span>
          </div>
          <div class="text-2xl font-bold text-red-900">{{ totalUtilizados }}</div>
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

// Agrupar métodos por código y calcular stock inicial/final
const metodosAgrupados = computed(() => {
  const agrupados = {}

  props.datos.forEach(item => {
    const key = item.codMetodo
    if (!agrupados[key]) {
      agrupados[key] = {
        codMetodo: item.codMetodo,
        metodo: item.metodo,
        stockInicial: 0,
        stockFinal: 0,
        fechaInicial: '',
        fechaFinal: ''
      }
    }

    if (item.transaccion === 'Inicial') {
      agrupados[key].stockInicial = item.cantidad
      agrupados[key].fechaInicial = item.fecha
    } else if (item.transaccion === 'Fin de Mes') {
      agrupados[key].stockFinal = item.cantidad
      agrupados[key].fechaFinal = item.fecha
    }
  })

  // Calcular utilizados y convertir a array
  return Object.values(agrupados).map(metodo => ({
    ...metodo,
    utilizados: metodo.stockInicial - metodo.stockFinal
  }))
})

const metodosUnicos = computed(() => {
  return [...new Set(props.datos.map(d => d.metodo))]
})

// Totales generales
const totalStockInicial = computed(() =>
  metodosAgrupados.value.reduce((sum, metodo) => sum + metodo.stockInicial, 0)
)

const totalStockFinal = computed(() =>
  metodosAgrupados.value.reduce((sum, metodo) => sum + metodo.stockFinal, 0)
)

const totalUtilizados = computed(() =>
  metodosAgrupados.value.reduce((sum, metodo) => sum + metodo.utilizados, 0)
)
</script>
