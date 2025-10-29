<template>
  <div class="border border-gray-300 p-6">
    <h2 class="text-lg font-semibold text-gray-900 mb-4">Filtros</h2>
    
    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
      <!-- Departamento -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-2">
          <MapPin class="inline-block w-4 h-4 mr-1" />
          Departamento
        </label>
        <select 
          @change="$emit('update:departamento', $event.target.value ? Number($event.target.value) : null)"
          class="w-full border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:border-gray-500"
        >
          <option value="">Todos los departamentos</option>
          <option 
            v-for="dept in departamentos" 
            :key="dept.id" 
            :value="dept.id"
          >
            {{ dept.nombre }}
          </option>
        </select>
      </div>

      <!-- Municipio -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-2">
          <MapPin class="inline-block w-4 h-4 mr-1" />
          Municipio
        </label>
        <select 
          @change="$emit('update:municipio', $event.target.value ? Number($event.target.value) : null)"
          class="w-full border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:border-gray-500"
        >
          <option value="">Todos los municipios</option>
          <option 
            v-for="mun in municipios" 
            :key="mun.id" 
            :value="mun.id"
          >
            {{ mun.nombre }}
          </option>
        </select>
      </div>

      <!-- Establecimiento -->
      <div>
        <label class="block text-sm font-medium text-gray-700 mb-2">
          <Building2 class="inline-block w-4 h-4 mr-1" />
          Establecimiento
        </label>
        <select 
          @change="$emit('update:establecimiento', $event.target.value ? Number($event.target.value) : null)"
          class="w-full border border-gray-300 px-3 py-2 text-sm focus:outline-none focus:border-gray-500"
        >
          <option value="">Todos los establecimientos</option>
          <option 
            v-for="est in establecimientos" 
            :key="est.id" 
            :value="est.id"
          >
            {{ est.nombre }} ({{ est.tipo }})
          </option>
        </select>
      </div>
    </div>
  </div>
</template>

<script setup>
import { MapPin, Building2 } from 'lucide-vue-next'

defineProps({
  departamentos: Array,
  municipios: Array,
  establecimientos: Array
})

defineEmits(['update:departamento', 'update:municipio', 'update:establecimiento'])
</script>
