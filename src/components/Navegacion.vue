<template>
  <div class="flex flex-wrap gap-2 mb-6 justify-center">
    <button
      v-for="opcion in opcionesVisibles"
      :key="opcion.id"
      @click="seleccionarOpcion(opcion.id)"
      :class="[
        'px-4 py-2 rounded-full text-sm font-medium transition-all duration-200',
        'border-2 cursor-pointer flex items-center gap-1.5',
        opcionActiva === opcion.id
          ? 'bg-slate-700 text-orange-400 border-slate-700 shadow-md'
          : 'bg-slate-700 text-white border-slate-700 hover:text-orange-400',
        opcion.id === 'admin' ? 'border-orange-500' : ''
      ]"
    >
      <component v-if="opcion.id === 'admin'" :is="ShieldCheck" class="w-3.5 h-3.5" />
      {{ opcion.nombre }}
    </button>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import { ShieldCheck } from 'lucide-vue-next'

const props = defineProps({
  isAdmin: { type: Boolean, default: false }
})

const opcionActiva = ref('inicio')

const emit = defineEmits(['opcion-seleccionada'])

const opciones = [
  { id: 'inicio', nombre: 'Inicio' },
  { id: 'estandares', nombre: 'Autodiagnóstico (ECA)' },
  { id: 'outputs', nombre: 'Outputs (LNOB)' },
  { id: 'indicadores', nombre: 'Indicadores (LNOB)' },
  { id: 'provision', nombre: 'Provisión (MAC)' },
  { id: 'admin', nombre: 'Administración', soloAdmin: true }
]

const opcionesVisibles = computed(() =>
  opciones.filter(o => !o.soloAdmin || props.isAdmin)
)

const seleccionarOpcion = (id) => {
  opcionActiva.value = id
  emit('opcion-seleccionada', id)
}
</script>
