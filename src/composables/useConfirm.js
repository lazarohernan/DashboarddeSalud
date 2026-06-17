import { ref } from 'vue'

// Estado global del diálogo de confirmación (singleton)
const visible = ref(false)
const opciones = ref({
  titulo: '¿Confirmar acción?',
  mensaje: '',
  textoConfirmar: 'Confirmar',
  textoCancelar: 'Cancelar',
  peligro: true
})

let resolver = null

/**
 * Abre el diálogo y devuelve una promesa que resuelve true/false.
 * Uso: if (await confirmar({ titulo, mensaje })) { ... }
 */
function confirmar(config = {}) {
  opciones.value = {
    titulo: config.titulo ?? '¿Confirmar acción?',
    mensaje: config.mensaje ?? '',
    textoConfirmar: config.textoConfirmar ?? 'Confirmar',
    textoCancelar: config.textoCancelar ?? 'Cancelar',
    peligro: config.peligro ?? true
  }
  visible.value = true
  return new Promise((resolve) => {
    resolver = resolve
  })
}

function responder(valor) {
  visible.value = false
  if (resolver) {
    resolver(valor)
    resolver = null
  }
}

export function useConfirm() {
  return {
    visible,
    opciones,
    confirmar,
    aceptar: () => responder(true),
    cancelar: () => responder(false)
  }
}
