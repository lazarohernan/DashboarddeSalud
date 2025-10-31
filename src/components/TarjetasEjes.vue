<template>
  <div class="mb-4">
    <h3 class="text-base font-semibold text-gray-800 mb-3">
      Ejes de Estándares de Calidad
    </h3>
    
    <!-- Carrusel horizontal -->
    <div class="relative py-4 carrusel-container">
      <div class="overflow-x-auto overflow-y-visible scrollbar-hide">
        <div class="flex gap-3 py-3 px-1 carrusel-content" style="scroll-snap-type: x mandatory;">
          <!-- Tarjeta para "Todos" -->
          <div
            @click="seleccionarEje(null)"
            :class="[
              'bg-white border-2 rounded-lg p-3 cursor-pointer transition-all duration-300 transform hover:scale-[1.02] hover:shadow-lg flex-shrink-0 w-48',
              ejeSeleccionado === null 
                ? 'border-orange-500 shadow-md' 
                : 'border-gray-200 hover:border-orange-300'
            ]"
            style="scroll-snap-align: start;"
          >
            <div class="flex items-center justify-center mb-3">
              <div class="w-10 h-10 rounded-full bg-orange-100 flex items-center justify-center flex-shrink-0">
                <Layers class="w-5 h-5 text-orange-600" />
              </div>
            </div>
            <div class="text-center">
              <div class="text-2xl font-bold text-orange-900">
                {{ porcentajeGeneral }}%
              </div>
              <div class="text-sm font-semibold text-gray-700 mt-1">
                Todos los Ejes
              </div>
            </div>
          </div>

          <!-- Tarjetas de cada eje -->
          <div
            v-for="eje in ejes"
            :key="eje.codigo"
            @click="seleccionarEje(eje.codigo)"
            :class="[
              'bg-white border-2 rounded-lg p-3 cursor-pointer transition-all duration-300 transform hover:scale-[1.02] hover:shadow-lg flex-shrink-0 w-48',
              ejeSeleccionado === eje.codigo 
                ? 'border-orange-500 shadow-md' 
                : 'border-gray-200 hover:border-orange-300'
            ]"
            style="scroll-snap-align: start;"
          >
            <div class="flex items-center justify-between mb-3">
              <div class="w-10 h-10 rounded-full bg-orange-100 flex items-center justify-center flex-shrink-0">
                <Target class="w-5 h-5 text-orange-600" />
              </div>
              <div class="text-sm font-semibold text-gray-700">
                Eje {{ eje.codigo }}
              </div>
            </div>
            <div class="text-center">
              <div class="text-2xl font-bold" :class="getColorPorcentaje(eje.porcentaje)">
                {{ eje.porcentaje }}%
              </div>
            </div>
            
            <!-- Barra de progreso visual -->
            <div class="mt-3">
              <div class="w-full bg-gray-200 rounded-full h-2">
                <div
                  class="h-2 rounded-full transition-all duration-300"
                  :class="getColorBarra(eje.porcentaje)"
                  :style="{ width: eje.porcentaje + '%' }"
                ></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Mensaje cuando no hay ejes -->
    <div v-if="ejes.length === 0" class="text-center py-8 text-gray-500">
      No hay ejes disponibles
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import { Layers, Target } from 'lucide-vue-next'

const props = defineProps({
  datos: {
    type: Array,
    default: () => []
  }
})

const emit = defineEmits(['eje-seleccionado'])

const ejeSeleccionado = ref(null)

// Calcular ejes únicos con sus porcentajes
const ejes = computed(() => {
  const ejesMap = {}

  props.datos.forEach(item => {
    if (!ejesMap[item.codEje]) {
      ejesMap[item.codEje] = {
        codigo: item.codEje,
        nombre: item.ejeNombre,
        total: 0,
        cumplen: 0
      }
    }
    ejesMap[item.codEje].total++
    if (item.cumple) {
      ejesMap[item.codEje].cumplen++
    }
  })

  return Object.values(ejesMap)
    .map(eje => ({
      ...eje,
      porcentaje: Math.round((eje.cumplen / eje.total) * 100)
    }))
    .sort((a, b) => {
      // Ordenar por código numérico si es posible, sino alfabético
      const numA = parseInt(a.codigo)
      const numB = parseInt(b.codigo)
      if (!isNaN(numA) && !isNaN(numB)) {
        return numA - numB
      }
      return a.codigo.localeCompare(b.codigo)
    })
})

// Calcular porcentaje general de cumplimiento
const porcentajeGeneral = computed(() => {
  if (props.datos.length === 0) return 0
  const cumplen = props.datos.filter(d => d.cumple).length
  return Math.round((cumplen / props.datos.length) * 100)
})

// Función para seleccionar un eje
const seleccionarEje = (codigoEje) => {
  ejeSeleccionado.value = codigoEje
  emit('eje-seleccionado', codigoEje)
}

// Función para obtener color según porcentaje
const getColorPorcentaje = (porcentaje) => {
  if (porcentaje >= 70) return 'text-green-700'
  if (porcentaje >= 50) return 'text-orange-700'
  return 'text-red-700'
}

// Función para obtener color de la barra según porcentaje
const getColorBarra = (porcentaje) => {
  if (porcentaje >= 70) return 'bg-green-600'
  if (porcentaje >= 50) return 'bg-orange-600'
  return 'bg-red-600'
}

// Exponer método para resetear selección (útil desde el componente padre)
const resetearSeleccion = () => {
  ejeSeleccionado.value = null
  emit('eje-seleccionado', null)
}

defineExpose({
  resetearSeleccion
})
</script>

<style scoped>
/* Animaciones suaves para las tarjetas */
.transition-all {
  transition-property: all;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  transition-duration: 300ms;
}

/* Ocultar scrollbar pero mantener funcionalidad de scroll */
.scrollbar-hide {
  -ms-overflow-style: none;  /* IE y Edge */
  scrollbar-width: none;  /* Firefox */
}

.scrollbar-hide::-webkit-scrollbar {
  display: none;  /* Chrome, Safari y Opera */
}

/* Smooth scroll */
.scrollbar-hide {
  scroll-behavior: smooth;
}

/* Permitir que las tarjetas crezcan sin cortarse al hacer hover */
.carrusel-container {
  overflow: visible !important;
}

/* Espacio extra para las tarjetas al hacer hover */
.carrusel-content {
  padding-top: 0.5rem;
  padding-bottom: 0.5rem;
}
</style>
