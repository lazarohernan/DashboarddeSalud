<template>
  <div id="mapa-honduras" class="w-full h-96 rounded-lg border border-gray-200"></div>
</template>

<script setup>
import { onMounted, onUnmounted, ref } from 'vue'
import maplibregl from 'maplibre-gl'
import 'maplibre-gl/dist/maplibre-gl.css'
import MapLibreWorker from 'maplibre-gl/dist/maplibre-gl-csp-worker?worker'

// Configurar worker para MapLibre GL
maplibregl.workerClass = MapLibreWorker

const mapaContainer = ref(null)
let map = null
const cargando = ref(true)

// Función para construir URL estática
const buildStaticUrl = (path) => {
  const normalizado = path.replace(/^\//, '')
  const base = import.meta.env.BASE_URL ?? '/'
  if (/^https?:\/\//i.test(base)) {
    return `${base.replace(/\/$/, '')}/${normalizado}`
  }
  if (typeof window !== 'undefined') {
    const prefijo = base === '/' ? '' : base.replace(/\/$/, '')
    return `${window.location.origin}${prefijo}/${normalizado}`
  }
  return `/${normalizado}`
}

const construirMapa = async () => {
  try {
    // Cargar GeoJSON de Honduras
    const geoUrl = buildStaticUrl('geo/geoBoundaries-HND-ADM1.geojson')
    const geojsonResp = await fetch(geoUrl)

    if (!geojsonResp.ok) {
      throw new Error('No se pudo cargar el GeoJSON de Honduras')
    }

    const geojson = await geojsonResp.json()

    // Crear estilo del mapa con los departamentos
    const estilo = {
      version: 8,
      glyphs: 'https://demotiles.maplibre.org/font/{fontstack}/{range}.pbf',
      sources: {
        honduras: {
          type: 'geojson',
          data: geojson
        }
      },
      layers: [
        // Capa 1: Fondo
        {
          id: 'background',
          type: 'background',
          paint: {
            'background-color': '#f4f8ff'
          }
        },
        // Capa 2: Relleno de departamentos
        {
          id: 'departamentos-fill',
          type: 'fill',
          source: 'honduras',
          paint: {
            'fill-color': '#ffffff',
            'fill-opacity': 0.9
          }
        },
        // Capa 3: Bordes de departamentos
        {
          id: 'departamentos-borde',
          type: 'line',
          source: 'honduras',
          paint: {
            'line-color': '#94a3b8',
            'line-width': 1.5
          }
        }
      ]
    }

    // Inicializar mapa
    map = new maplibregl.Map({
      container: mapaContainer.value || 'mapa-honduras',
      style: estilo,
      center: [-86.25, 14.8], // Centro geográfico de Honduras
      zoom: 6.2, // Zoom inicial
      pitch: 0, // Vista plana (sin inclinación)
      bearing: 0, // Norte arriba (sin rotación)
      // Deshabilitar todas las interacciones
      scrollZoom: false,
      boxZoom: false,
      dragRotate: false,
      dragPan: false,
      keyboard: false,
      doubleClickZoom: false,
      touchZoomRotate: false
    })

    // Confirmar carga del mapa
    map.on('load', () => {
      console.log('Mapa de Honduras cargado correctamente')
      cargando.value = false
    })

    // Manejar errores
    map.on('error', (e) => {
      console.error('Error al cargar el mapa:', e)
      cargando.value = false
    })

  } catch (error) {
    console.error('Error al construir el mapa:', error)
    cargando.value = false
  }
}

onMounted(() => {
  mapaContainer.value = document.getElementById('mapa-honduras')
  construirMapa()
})

onUnmounted(() => {
  if (map) {
    map.remove()
    map = null
  }
})
</script>
