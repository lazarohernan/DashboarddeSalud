<template>
  <div
    v-if="total > 0"
    class="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between px-1 py-3"
  >
    <p class="text-xs text-gray-500">
      Mostrando <span class="font-medium text-gray-700">{{ desde }}</span>–<span class="font-medium text-gray-700">{{ hasta }}</span>
      de <span class="font-medium text-gray-700">{{ total }}</span> registros
    </p>

    <div class="flex flex-wrap items-center gap-3">
      <label v-if="mostrarTamano" class="flex items-center gap-2 text-xs text-gray-600">
        Por página
        <select
          :value="pageSize"
          class="select-field w-20 py-1 text-xs"
          @change="$emit('update:pageSize', Number($event.target.value))"
        >
          <option v-for="opcion in opcionesTamano" :key="opcion" :value="opcion">
            {{ opcion }}
          </option>
        </select>
      </label>

      <div class="flex items-center gap-1">
        <button
          type="button"
          class="pagination-btn"
          :disabled="page <= 1"
          @click="$emit('update:page', page - 1)"
        >
          <ChevronLeft class="w-4 h-4" />
        </button>

        <template v-for="(item, index) in paginasVisibles" :key="`${item}-${index}`">
          <span v-if="item === '...'" class="px-2 text-gray-400 text-sm">…</span>
          <button
            v-else
            type="button"
            :class="[
              'pagination-btn min-w-[2rem]',
              item === page ? 'bg-slate-700 text-white border-slate-700' : ''
            ]"
            @click="$emit('update:page', item)"
          >
            {{ item }}
          </button>
        </template>

        <button
          type="button"
          class="pagination-btn"
          :disabled="page >= totalPages"
          @click="$emit('update:page', page + 1)"
        >
          <ChevronRight class="w-4 h-4" />
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import { ChevronLeft, ChevronRight } from 'lucide-vue-next'

const props = defineProps({
  page: { type: Number, default: 1 },
  pageSize: { type: Number, default: 25 },
  total: { type: Number, default: 0 },
  mostrarTamano: { type: Boolean, default: true },
  opcionesTamano: {
    type: Array,
    default: () => [10, 25, 50, 100]
  }
})

defineEmits(['update:page', 'update:pageSize'])

const totalPages = computed(() =>
  Math.max(1, Math.ceil(props.total / props.pageSize) || 1)
)

const desde = computed(() =>
  props.total === 0 ? 0 : (props.page - 1) * props.pageSize + 1
)

const hasta = computed(() =>
  Math.min(props.page * props.pageSize, props.total)
)

const paginasVisibles = computed(() => {
  const total = totalPages.value
  const actual = props.page
  if (total <= 7) {
    return Array.from({ length: total }, (_, i) => i + 1)
  }

  const paginas = new Set([1, total, actual, actual - 1, actual + 1])
  const ordenadas = [...paginas]
    .filter((n) => n >= 1 && n <= total)
    .sort((a, b) => a - b)

  const resultado = []
  for (let i = 0; i < ordenadas.length; i++) {
    if (i > 0 && ordenadas[i] - ordenadas[i - 1] > 1) {
      resultado.push('...')
    }
    resultado.push(ordenadas[i])
  }
  return resultado
})
</script>

<style scoped>
.pagination-btn {
  @apply inline-flex items-center justify-center px-2.5 py-1.5 text-sm font-medium border border-gray-300 rounded-md bg-white text-gray-700 hover:bg-gray-50 disabled:opacity-40 disabled:cursor-not-allowed transition-colors;
}
</style>
