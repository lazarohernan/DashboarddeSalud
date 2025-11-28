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

      <!-- Gráfica de línea: Disponibilidad por Municipio -->
      <div class="bg-white border border-gray-200 rounded-lg p-6">
        <div class="flex items-center gap-3 mb-4">
          <TrendingUp class="w-5 h-5 text-gray-700" />
          <h3 class="text-lg font-semibold text-gray-900">Disponibilidad de Métodos por Municipio</h3>
          <span class="text-xs text-gray-500">(Fin de Mes - Inicial)</span>
        </div>
        
        <!-- Gráfica de línea SVG mejorada - Más ancha y en tonos naranja -->
        <div class="w-full overflow-x-auto">
          <svg width="100%" height="320" viewBox="0 0 1100 320" preserveAspectRatio="xMidYMid meet" class="min-w-[1000px]">
            <!-- Fondo con líneas horizontales de guía -->
            <g class="grid-lines">
              <line v-for="i in 5" :key="'h'+i" 
                x1="70" :y1="40 + (i-1) * 55" 
                x2="1070" :y2="40 + (i-1) * 55" 
                stroke="#e5e7eb" stroke-width="1" stroke-dasharray="4,4"/>
            </g>
            
            <!-- Eje Y -->
            <line x1="70" y1="40" x2="70" y2="260" stroke="#d1d5db" stroke-width="1"/>
            
            <!-- Eje X -->
            <line x1="70" y1="260" x2="1070" y2="260" stroke="#d1d5db" stroke-width="1"/>
            
            <!-- Etiquetas del eje Y -->
            <text x="60" y="45" text-anchor="end" font-size="11" fill="#6b7280">{{ maxDisponible }}</text>
            <text x="60" y="100" text-anchor="end" font-size="11" fill="#6b7280">{{ Math.round(maxDisponible * 0.75) }}</text>
            <text x="60" y="155" text-anchor="end" font-size="11" fill="#6b7280">{{ Math.round(maxDisponible * 0.5) }}</text>
            <text x="60" y="210" text-anchor="end" font-size="11" fill="#6b7280">{{ Math.round(maxDisponible * 0.25) }}</text>
            <text x="60" y="265" text-anchor="end" font-size="11" fill="#6b7280">0</text>
            
            <!-- Área bajo la línea (gradiente naranja) -->
            <defs>
              <linearGradient id="areaGradientOrange" x1="0%" y1="0%" x2="0%" y2="100%">
                <stop offset="0%" style="stop-color:#f97316;stop-opacity:0.35" />
                <stop offset="100%" style="stop-color:#f97316;stop-opacity:0.05" />
              </linearGradient>
            </defs>
            
            <polygon
              :points="areaPoints"
              fill="url(#areaGradientOrange)"
            />
            
            <!-- Línea principal (naranja) -->
            <polyline
              :points="linePoints"
              fill="none"
              stroke="#f97316"
              stroke-width="2.5"
              stroke-linejoin="round"
              stroke-linecap="round"
            />
            
            <!-- Puntos y etiquetas -->
            <g v-for="(municipio, index) in chartData" :key="municipio.nombre">
              <!-- Punto (naranja) -->
              <circle
                :cx="municipio.x"
                :cy="municipio.y"
                r="6"
                fill="#f97316"
                stroke="white"
                stroke-width="2"
                class="cursor-pointer"
              />
              
              <!-- Valor sobre el punto -->
              <text 
                :x="municipio.x" 
                :y="municipio.y - 12"
                text-anchor="middle" 
                font-size="12"
                font-weight="600"
                fill="#ea580c"
              >
                {{ municipio.disponible }}
              </text>
              
              <!-- Etiqueta del municipio (eje X) -->
              <text 
                :x="municipio.x" 
                y="280" 
                text-anchor="middle" 
                font-size="11"
                fill="#4b5563"
                :transform="`rotate(-20, ${municipio.x}, 280)`"
              >
                {{ municipio.nombreCorto }}
              </text>
            </g>
          </svg>
        </div>
        
        <!-- Leyenda -->
        <div class="mt-4 flex items-center justify-center gap-6 text-xs text-gray-600">
          <div class="flex items-center gap-2">
            <div class="w-3 h-3 bg-orange-500 rounded-full"></div>
            <span>Disponibilidad (unidades)</span>
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
                      'px-3 py-1.5 rounded-full text-xs font-medium min-w-[80px] inline-block text-center': true,
                      'bg-orange-100 text-orange-800': item.transaccion === 'Inicial',
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
import { Package, TrendingUp } from 'lucide-vue-next'

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

// Datos para la gráfica de disponibilidad por municipio
const datosPorMunicipio = computed(() => {
  // Agrupar datos por municipio y tipo de transacción
  const agrupado = {}
  
  props.datos.forEach(item => {
    const key = `${item.municipio}-${item.metodo}`
    if (!agrupado[key]) {
      agrupado[key] = {
        municipio: item.municipio,
        metodo: item.metodo,
        inicial: 0,
        finMes: 0
      }
    }
    
    if (item.transaccion === 'Inicial') {
      agrupado[key].inicial += item.cantidad
    } else if (item.transaccion === 'Fin de Mes') {
      agrupado[key].finMes += item.cantidad
    }
  })
  
  // Calcular disponibilidad y agrupar por municipio
  const porMunicipio = {}
  Object.values(agrupado).forEach(item => {
    const disponible = item.finMes - item.inicial
    if (!porMunicipio[item.municipio]) {
      porMunicipio[item.municipio] = 0
    }
    porMunicipio[item.municipio] += disponible
  })
  
  // Los 7 municipios LNOB con datos mock para demostración
  const municipiosLNOB = [
    { nombre: 'La Ceiba', nombreCorto: 'La Ceiba' },
    { nombre: 'Iriona', nombreCorto: 'Iriona' },
    { nombre: 'Limón', nombreCorto: 'Limón' },
    { nombre: 'Santa Fe', nombreCorto: 'Santa Fe' },
    { nombre: 'Santa Rosa de Aguán', nombreCorto: 'Sta Rosa' },
    { nombre: 'José Santos Guardiola', nombreCorto: 'J.S. Guardiola' },
    { nombre: 'Puerto Lempira', nombreCorto: 'Pto Lempira' }
  ]
  
  // Datos mock realistas para demostración
  const mockData = {
    'La Ceiba': 180,
    'Iriona': porMunicipio['Iriona'] || 145,
    'Limón': 95,
    'Santa Fe': 160,
    'Santa Rosa de Aguán': 75,
    'José Santos Guardiola': 120,
    'Puerto Lempira': 85
  }
  
  return municipiosLNOB.map(m => ({
    nombre: m.nombre,
    nombreCorto: m.nombreCorto,
    disponible: Math.abs(porMunicipio[m.nombre] || mockData[m.nombre])
  }))
})

const maxDisponible = computed(() => 
  Math.max(...datosPorMunicipio.value.map(m => m.disponible), 200)
)

// Datos calculados para la gráfica
const chartData = computed(() => {
  const chartWidth = 980 // 1070 - 90 (margen izquierdo)
  const chartHeight = 220 // 260 - 40 (márgenes)
  const startX = 100
  const startY = 40
  const count = datosPorMunicipio.value.length
  const spacing = chartWidth / (count - 1 || 1)
  
  return datosPorMunicipio.value.map((municipio, index) => {
    const x = startX + (index * spacing)
    const y = startY + chartHeight - (municipio.disponible / maxDisponible.value * chartHeight)
    return {
      ...municipio,
      x,
      y
    }
  })
})

// Puntos para la línea
const linePoints = computed(() => {
  return chartData.value.map(d => `${d.x},${d.y}`).join(' ')
})

// Puntos para el área bajo la línea
const areaPoints = computed(() => {
  const points = chartData.value.map(d => `${d.x},${d.y}`)
  const firstX = chartData.value[0]?.x || 100
  const lastX = chartData.value[chartData.value.length - 1]?.x || 1060
  return `${firstX},260 ${points.join(' ')} ${lastX},260`
})
</script>
