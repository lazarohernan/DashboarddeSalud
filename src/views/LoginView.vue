<template>
  <section class="flex justify-center py-8 animate-fade-in">
    <div class="w-full max-w-md">
      <div class="bg-white border border-gray-300 rounded-lg shadow-sm overflow-hidden">
        <div class="bg-gradient-to-r from-orange-500 to-orange-600 px-6 py-8 text-white text-center">
          <div class="inline-flex items-center justify-center w-14 h-14 rounded-full bg-white/20 mb-4">
            <Lock class="w-7 h-7" />
          </div>
          <h2 class="text-2xl font-bold">Iniciar sesión</h2>
          <p class="text-orange-100 text-sm mt-2">
            Ingresa para actualizar la información del proyecto
          </p>
        </div>

        <form class="p-6 space-y-5" @submit.prevent="handleSubmit">
          <div>
            <label for="email" class="block text-sm font-medium text-gray-700 mb-1.5">
              Correo electrónico
            </label>
            <input
              id="email"
              v-model="email"
              type="email"
              required
              autocomplete="email"
              placeholder="correo@ejemplo.com"
              class="w-full px-4 py-2.5 border border-gray-300 rounded-lg text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500"
            />
          </div>

          <div>
            <label for="password" class="block text-sm font-medium text-gray-700 mb-1.5">
              Contraseña
            </label>
            <div class="relative">
              <input
                id="password"
                v-model="password"
                :type="mostrarPassword ? 'text' : 'password'"
                required
                autocomplete="current-password"
                placeholder="••••••••"
                class="w-full px-4 py-2.5 pr-11 border border-gray-300 rounded-lg text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-orange-500"
              />
              <button
                type="button"
                class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
                :aria-label="mostrarPassword ? 'Ocultar contraseña' : 'Mostrar contraseña'"
                @click="mostrarPassword = !mostrarPassword"
              >
                <EyeOff v-if="mostrarPassword" class="w-5 h-5" />
                <Eye v-else class="w-5 h-5" />
              </button>
            </div>
          </div>

          <p
            v-if="errorLocal"
            class="text-sm text-red-600 bg-red-50 border border-red-200 rounded-lg px-3 py-2"
          >
            {{ errorLocal }}
          </p>

          <button
            type="submit"
            :disabled="enviando"
            class="w-full flex items-center justify-center gap-2 px-4 py-3 rounded-lg text-white font-semibold bg-slate-700 hover:bg-slate-800 disabled:opacity-60 disabled:cursor-not-allowed transition-colors"
          >
            <Loader2 v-if="enviando" class="w-5 h-5 animate-spin" />
            <LogIn v-else class="w-5 h-5" />
            {{ enviando ? 'Ingresando...' : 'Iniciar sesión' }}
          </button>
        </form>

        <div class="px-6 pb-6">
          <button
            type="button"
            class="w-full text-sm text-gray-600 hover:text-orange-600 transition-colors"
            @click="$emit('volver')"
          >
            ← Volver al inicio
          </button>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
import { ref } from 'vue'
import { Eye, EyeOff, Loader2, Lock, LogIn } from 'lucide-vue-next'
import { useAuth } from '../composables/useAuth'

const emit = defineEmits(['login-exitoso', 'volver'])

const { signIn } = useAuth()

const email = ref('')
const password = ref('')
const mostrarPassword = ref(false)
const enviando = ref(false)
const errorLocal = ref('')

async function handleSubmit() {
  errorLocal.value = ''
  enviando.value = true

  const result = await signIn(email.value.trim(), password.value)
  enviando.value = false

  if (!result.success) {
    errorLocal.value = result.error
    return
  }

  emit('login-exitoso')
}
</script>
