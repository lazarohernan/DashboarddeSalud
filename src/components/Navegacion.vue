<template>
  <div class="flex flex-wrap gap-2 mb-6 justify-center">
    <button
      v-for="opcion in opciones"
      :key="opcion.id"
      @click="seleccionarOpcion(opcion.id)"
      :class="[
        'px-4 py-2 rounded-full text-sm font-medium transition-all duration-200',
        'border-2 cursor-pointer',
        opcionActiva === opcion.id
          ? 'bg-orange-500 text-white border-orange-500 shadow-md'
          : 'bg-transparent text-orange-600 border-orange-300 hover:bg-orange-50 hover:border-orange-400'
      ]"
    >
      {{ opcion.nombre }}
    </button>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const opcionActiva = ref('inicio')

const emit = defineEmits(['opcion-seleccionada'])

const opciones = [
  { id: 'inicio', nombre: 'Inicio' },
  { id: 'estandares', nombre: 'Estándares de Calidad' },
  { id: 'outputs', nombre: 'Outputs' },
  { id: 'provision', nombre: 'Provisión de Anticonceptivos' }
]

const seleccionarOpcion = (id) => {
  opcionActiva.value = id
  emit('opcion-seleccionada', id)
}
</script>
