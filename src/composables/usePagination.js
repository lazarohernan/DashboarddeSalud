import { ref, computed, watch, unref } from 'vue'

/**
 * Paginación en cliente sobre un array reactivo.
 */
export function usePagination(items, options = {}) {
  const pageSize = ref(options.pageSize ?? 25)
  const page = ref(1)

  const lista = computed(() => unref(items) ?? [])

  const total = computed(() => lista.value.length)

  const totalPages = computed(() =>
    Math.max(1, Math.ceil(total.value / pageSize.value) || 1)
  )

  const paginatedItems = computed(() => {
    const inicio = (page.value - 1) * pageSize.value
    return lista.value.slice(inicio, inicio + pageSize.value)
  })

  const desde = computed(() =>
    total.value === 0 ? 0 : (page.value - 1) * pageSize.value + 1
  )

  const hasta = computed(() =>
    Math.min(page.value * pageSize.value, total.value)
  )

  function irAPagina(nueva) {
    const destino = Math.min(Math.max(1, nueva), totalPages.value)
    page.value = destino
  }

  function paginaAnterior() {
    irAPagina(page.value - 1)
  }

  function paginaSiguiente() {
    irAPagina(page.value + 1)
  }

  function reiniciar() {
    page.value = 1
  }

  watch(lista, () => {
    if (page.value > totalPages.value) {
      page.value = totalPages.value
    }
  })

  watch(pageSize, () => {
    page.value = 1
  })

  return {
    page,
    pageSize,
    total,
    totalPages,
    paginatedItems,
    desde,
    hasta,
    irAPagina,
    paginaAnterior,
    paginaSiguiente,
    reiniciar
  }
}
