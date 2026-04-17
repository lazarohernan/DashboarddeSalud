<template>
  <div class="my-6">
    <div class="flex flex-col gap-3">
      <label class="block text-sm font-medium text-gray-700">
        Seleccione el año:
      </label>
      <div class="flex flex-wrap items-center gap-3">
        <button
          v-for="ano in [2023, 2024, 2025, 2026, 2027]"
          :key="ano"
          @click="seleccionarAno(ano)"
          :class="[
            'px-5 py-2.5 rounded-lg text-sm font-medium transition-all duration-200',
            'border-2 cursor-pointer',
            anoSeleccionado === ano
              ? 'bg-orange-500 text-white border-orange-500 shadow-md'
              : 'bg-transparent text-orange-600 border-orange-300 hover:bg-orange-50 hover:border-orange-400'
          ]"
        >
          {{ ano }}
        </button>
        <button
          @click="limpiarSeleccion"
          :class="[
            'px-5 py-2.5 rounded-lg text-sm font-medium transition-all duration-200',
            'border-2 cursor-pointer bg-transparent text-gray-600 border-gray-300',
            'hover:bg-gray-50 hover:border-gray-400'
          ]"
        >
          Limpiar
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const anoSeleccionado = ref(null)

const emit = defineEmits(['ano-seleccionado', 'limpiar-seleccion'])

const seleccionarAno = (ano) => {
  anoSeleccionado.value = ano
  emit('ano-seleccionado', ano)
}

const limpiarSeleccion = () => {
  anoSeleccionado.value = null
  emit('limpiar-seleccion')
}
</script>

