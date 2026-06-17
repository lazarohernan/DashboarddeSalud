<template>
  <div class="fixed top-4 right-4 z-[60] flex flex-col gap-2 w-80 max-w-[calc(100vw-2rem)]">
    <transition-group name="toast">
      <div
        v-for="t in toasts"
        :key="t.id"
        class="flex items-start gap-3 rounded-lg border bg-white shadow-lg px-4 py-3"
        :class="{
          'border-emerald-200': t.tipo === 'success',
          'border-red-200': t.tipo === 'error',
          'border-gray-200': t.tipo === 'info'
        }"
      >
        <div
          class="flex items-center justify-center w-7 h-7 rounded-lg shrink-0 mt-0.5"
          :class="{
            'bg-emerald-50': t.tipo === 'success',
            'bg-red-50': t.tipo === 'error',
            'bg-gray-50': t.tipo === 'info'
          }"
        >
          <Check v-if="t.tipo === 'success'" class="w-4 h-4 text-emerald-600" />
          <AlertCircle v-else-if="t.tipo === 'error'" class="w-4 h-4 text-red-500" />
          <Info v-else class="w-4 h-4 text-gray-500" />
        </div>
        <p class="flex-1 text-sm text-gray-700 leading-snug">{{ t.mensaje }}</p>
        <button
          type="button"
          class="text-gray-400 hover:text-gray-600 shrink-0"
          @click="quitar(t.id)"
        >
          <X class="w-4 h-4" />
        </button>
      </div>
    </transition-group>
  </div>
</template>

<script setup>
import { Check, AlertCircle, Info, X } from 'lucide-vue-next'
import { useToast } from '../../composables/useToast'

const { toasts, quitar } = useToast()
</script>

<style scoped>
.toast-enter-active,
.toast-leave-active {
  transition: all 0.25s ease;
}
.toast-enter-from {
  opacity: 0;
  transform: translateX(20px);
}
.toast-leave-to {
  opacity: 0;
  transform: translateX(20px);
}
</style>
