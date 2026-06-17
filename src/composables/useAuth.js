import { ref, computed } from 'vue'
import { supabase } from '../lib/supabase'

const session = ref(null)
const profile = ref(null)
const loading = ref(true)
const authError = ref(null)
let listenerAttached = false

async function fetchProfile(userId) {
  if (!userId) {
    profile.value = null
    return
  }

  const { data, error } = await supabase
    .from('perfiles')
    .select('id, nombre_completo, rol, activo')
    .eq('id', userId)
    .maybeSingle()

  if (error) {
    console.error('Error al cargar perfil:', error.message)
    profile.value = null
    return
  }

  profile.value = data
}

function attachAuthListener() {
  if (listenerAttached) return
  listenerAttached = true

  supabase.auth.onAuthStateChange(async (_event, newSession) => {
    session.value = newSession
    await fetchProfile(newSession?.user?.id ?? null)
    loading.value = false
  })
}

async function initAuth() {
  attachAuthListener()

  const { data, error } = await supabase.auth.getSession()
  if (error) {
    authError.value = error.message
  }

  session.value = data.session
  await fetchProfile(data.session?.user?.id ?? null)
  loading.value = false
}

export function useAuth() {
  const user = computed(() => session.value?.user ?? null)
  const isAuthenticated = computed(() => !!session.value)
  const isAdmin = computed(() => profile.value?.rol === 'admin' && profile.value?.activo !== false)
  const displayName = computed(
    () => profile.value?.nombre_completo || user.value?.email || 'Usuario'
  )

  async function signIn(email, password) {
    authError.value = null
    loading.value = true

    const { data, error } = await supabase.auth.signInWithPassword({ email, password })

    if (error) {
      loading.value = false
      authError.value = mapAuthError(error.message)
      return { success: false, error: authError.value }
    }

    session.value = data.session
    await fetchProfile(data.user?.id ?? null)
    loading.value = false

    if (!profile.value?.activo) {
      await signOut()
      authError.value = 'Tu cuenta no está activa. Comunícate con el equipo del proyecto.'
      return { success: false, error: authError.value }
    }

    return { success: true }
  }

  async function signOut() {
    authError.value = null
    await supabase.auth.signOut()
    session.value = null
    profile.value = null
  }

  return {
    session,
    profile,
    user,
    loading,
    authError,
    isAuthenticated,
    isAdmin,
    displayName,
    initAuth,
    signIn,
    signOut
  }
}

function mapAuthError(message) {
  if (message.includes('Invalid login credentials')) {
    return 'Correo o contraseña incorrectos.'
  }
  if (message.includes('Email not confirmed')) {
    return 'Debes confirmar tu correo antes de ingresar.'
  }
  if (message.includes('Database error')) {
    return 'Hay un problema con la cuenta.'
  }
  return 'No se pudo iniciar sesión. Intenta de nuevo.'
}
