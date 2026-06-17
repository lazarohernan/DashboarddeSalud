<template>
  <transition name="fade">
    <div
      v-if="visible"
      class="fixed inset-0 z-[70] flex items-center justify-center p-4 bg-black/40"
      @click.self="cancelar"
    >
      <div class="bg-white rounded-xl shadow-2xl w-full max-w-sm">
        <div class="px-6 py-5">
          <div class="flex items-start gap-3">
            <div
              class="flex items-center justify-center w-9 h-9 rounded-lg shrink-0"
              :class="opciones.peligro ? 'bg-red-50' : 'bg-slate-100'"
            >
              <AlertTriangle
                class="w-5 h-5"
                :class="opciones.peligro ? 'text-red-500' : 'text-slate-600'"
              />
            </div>
            <div class="min-w-0">
              <h3 class="text-base font-semibold text-gray-900">{{ opciones.titulo }}</h3>
              <p v-if="opciones.mensaje" class="text-sm text-gray-500 mt-1">{{ opciones.mensaje }}</p>
            </div>
          </div>
        </div>
        <div class="px-6 py-4 border-t border-gray-100 flex justify-end gap-3 bg-gray-50 rounded-b-xl">
          <button
            type="button"
            class="px-4 py-2 text-sm font-medium text-gray-600 border border-gray-300 rounded-lg hover:bg-gray-100 transition-colors"
            @click="cancelar"
          >
            {{ opciones.textoCancelar }}
          </button>
          <button
            type="button"
            class="px-4 py-2 text-sm font-medium text-white rounded-lg transition-colors"
            :class="opciones.peligro ? 'bg-red-600 hover:bg-red-700' : 'bg-slate-700 hover:bg-slate-800'"
            @click="aceptar"
          >
            {{ opciones.textoConfirmar }}
          </button>
        </div>
      </div>
    </div>
  </transition>
</template>

<script setup>
import { AlertTriangle } from 'lucide-vue-next'
import { useConfirm } from '../../composables/useConfirm'

const { visible, opciones, aceptar, cancelar } = useConfirm()
</script>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.2s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
