import { ref } from 'vue'

// Estado global de notificaciones (singleton)
const toasts = ref([])
let contador = 0

function agregar(tipo, mensaje, duracion = 4000) {
  const id = ++contador
  toasts.value.push({ id, tipo, mensaje })
  if (duracion > 0) {
    setTimeout(() => quitar(id), duracion)
  }
  return id
}

function quitar(id) {
  toasts.value = toasts.value.filter((t) => t.id !== id)
}

export function useToast() {
  return {
    toasts,
    quitar,
    success: (msg, dur) => agregar('success', msg, dur),
    error: (msg, dur) => agregar('error', msg, dur ?? 6000),
    info: (msg, dur) => agregar('info', msg, dur)
  }
}
