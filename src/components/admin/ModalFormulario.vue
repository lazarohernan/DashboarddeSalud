<template>
  <!-- Backdrop -->
  <div class="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/40" @click.self="$emit('cerrar')">
    <div class="bg-white rounded-xl shadow-2xl w-full max-w-xl max-h-[90vh] flex flex-col">
      <!-- Header -->
      <div class="flex items-center justify-between px-6 py-4 border-b border-gray-200">
        <h3 class="text-lg font-semibold text-gray-900">{{ titulo }}</h3>
        <button @click="$emit('cerrar')" class="text-gray-400 hover:text-gray-600 transition-colors">
          <X class="w-5 h-5" />
        </button>
      </div>

      <!-- Body con scroll -->
      <div class="flex-1 overflow-y-auto px-6 py-5">
        <slot />
      </div>

      <!-- Footer -->
      <div class="px-6 py-4 border-t border-gray-200 flex justify-end gap-3 bg-gray-50 rounded-b-xl">
        <button @click="$emit('cerrar')" class="btn-secondary" :disabled="guardando">
          Cancelar
        </button>
        <button @click="$emit('guardar')" class="btn-primary" :disabled="guardando">
          <span v-if="guardando" class="inline-block w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin mr-1" />
          {{ guardando ? 'Guardando...' : 'Guardar' }}
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { X } from 'lucide-vue-next'
defineProps({
  titulo: { type: String, default: 'Formulario' },
  guardando: { type: Boolean, default: false }
})
defineEmits(['cerrar', 'guardar'])
</script>
