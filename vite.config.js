import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// GitHub Pages sirve el sitio en /DashboarddeSalud/
const base = process.env.VITE_BASE_PATH || '/'

export default defineConfig({
  base,
  plugins: [vue()],
})
