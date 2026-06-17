import { createClient } from '@supabase/supabase-js'

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseKey = import.meta.env.VITE_SUPABASE_ANON_KEY

if (!supabaseUrl || !supabaseKey) {
  console.warn(
    'Faltan VITE_SUPABASE_URL o VITE_SUPABASE_ANON_KEY. Configura el archivo .env.local.'
  )
}

// Timeout a nivel de red: si una petición se queda colgada, se aborta y rechaza
// (en lugar de quedar pendiente para siempre, lo que congelaba la carga).
const FETCH_TIMEOUT_MS = 20000

function fetchConTimeout(input, init = {}) {
  // Respeta cualquier señal de aborto existente combinándola con el timeout
  const controller = new AbortController()
  const timeout = setTimeout(() => controller.abort(), FETCH_TIMEOUT_MS)

  const señalExterna = init.signal
  if (señalExterna) {
    if (señalExterna.aborted) controller.abort()
    else señalExterna.addEventListener('abort', () => controller.abort(), { once: true })
  }

  return fetch(input, { ...init, signal: controller.signal }).finally(() => {
    clearTimeout(timeout)
  })
}

export const supabase = createClient(supabaseUrl ?? '', supabaseKey ?? '', {
  auth: {
    persistSession: true,
    autoRefreshToken: true,
    detectSessionInUrl: false
  },
  global: {
    fetch: fetchConTimeout
  }
})
