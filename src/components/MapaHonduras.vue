<template>
  <div class="relative">
    <div id="mapa-honduras" class="w-full h-[500px] rounded-lg border border-gray-200 relative">
      <!-- Modal dentro del mapa -->
      <div
        v-if="modalVisible"
        class="absolute right-0 top-0 h-full w-80 bg-white shadow-lg border-l border-gray-200 z-10 flex flex-col"
      >
        <!-- Header del modal -->
        <div class="flex items-center justify-between p-4">
          <h3 class="text-lg font-semibold text-gray-900">Dpto. {{ municipioSeleccionado?.departamento || 'Información' }}</h3>
          <button
            @click="cerrarModal"
            class="text-gray-400 hover:text-gray-600 transition-colors"
          >
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
            </svg>
          </button>
        </div>

        <!-- Contenido del modal -->
        <div class="flex-1 px-4 pb-4">
          <div v-if="municipioSeleccionado">
            <div class="mb-4 pb-4 border-b border-gray-200">
              <p class="text-sm text-gray-500 uppercase tracking-wide">Municipio - {{ municipioSeleccionado.nombre }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Botón para centrar el mapa -->
    <button
      @click="centrarMapa"
      class="absolute bottom-3 left-1/2 transform -translate-x-1/2 bg-orange-500 px-4 py-2 rounded-full shadow-md border border-orange-600 text-white hover:bg-orange-600 hover:shadow-lg transition-all flex items-center gap-2"
    >
      <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 8V4m0 0h4M4 4l5 5m11-1V4m0 0h-4m4 0l-5 5M4 16v4m0 0h4m-4 0l5-5m11 5l-5-5m5 5v-4m0 4h-4" />
      </svg>
      Centrar mapa
    </button>
  </div>
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

// Estado del modal
const modalVisible = ref(false)
const municipioSeleccionado = ref(null)
const modalTop = ref(0)

// Coordenadas de los 7 municipios LNOB (coordenadas exactas verificadas)
// Formato MapLibre: [longitud, latitud] - WGS84 (EPSG:4326)
const municipiosLNOB = [
  {
    nombre: 'La Ceiba',
    departamento: 'Atlántida',
    coordenadas: [-86.791901, 15.770288],
    descripcion: 'Puerto principal y centro turístico'
  },
  {
    nombre: 'Iriona',
    departamento: 'Colón',
    coordenadas: [-85.12000, 15.90000], // Movido tierra firme (más al interior)
    descripcion: 'Municipio costero en Colón'
  },
  {
    nombre: 'Limón',
    departamento: 'Colón',
    coordenadas: [-85.50000, 15.86250], 
    descripcion: 'Comunidad garífuna en la costa caribeña'
  },
  {
    nombre: 'Santa Fe',
    departamento: 'Colón',
    coordenadas: [-85.95000, 15.88000], // Movido tierra firme (más al interior)
    descripcion: 'Municipio en el corazón de Colón'
  },
  {
    nombre: 'Santa Rosa de Aguán',
    departamento: 'Colón',
    coordenadas: [-85.717, 15.950], 
    descripcion: 'Comunidad pesquera en la costa'
  },
  {
    nombre: 'José Santos Guardiola',
    departamento: 'Islas de la Bahía',
    coordenadas: [-86.54000, 16.35000], 
    descripcion: 'Municipio en la isla de Roatán'
  },
  {
    nombre: 'Puerto Lempira',
    departamento: 'Gracias a Dios',
    coordenadas: [-83.780617, 15.25743], // Coordenadas exactas verificadas
    descripcion: 'Capital de Gracias a Dios (La Mosquitia)'
  }
]

// Centro inicial del mapa (centrado en Honduras completo)
const centroInicial = [-86.5, 14.8]
const zoomInicial = 6.5

// Función para centrar el mapa
const centrarMapa = () => {
  if (map) {
    map.flyTo({
      center: centroInicial,
      zoom: zoomInicial,
      speed: 1.5,
      curve: 1.2,
      essential: true
    })
  }
}

// Función para abrir el modal con información del municipio
const abrirModal = (municipio) => {
  municipioSeleccionado.value = municipio
  modalVisible.value = true
}

// Función para cerrar el modal
const cerrarModal = () => {
  modalVisible.value = false
  municipioSeleccionado.value = null
}

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
    
    // Agregar IDs a los features para poder usar feature-state
    geojson.features = geojson.features.map((feature, index) => {
      return {
        ...feature,
        id: index
      }
    })
    
    // Crear un GeoJSON separado con puntos centrales para las etiquetas (sin duplicados)
    const departamentosUnicos = {}
    geojson.features.forEach(feature => {
      const nombre = feature.properties.shapeName
      if (!departamentosUnicos[nombre]) {
        // Calcular el centroide aproximado del polígono
        let coords = []
        if (feature.geometry.type === 'Polygon') {
          coords = feature.geometry.coordinates[0]
        } else if (feature.geometry.type === 'MultiPolygon') {
          // Usar el polígono más grande
          let maxLen = 0
          feature.geometry.coordinates.forEach(poly => {
            if (poly[0].length > maxLen) {
              maxLen = poly[0].length
              coords = poly[0]
            }
          })
        }
        
        // Calcular centroide usando algoritmo de centroide poligonal para mejor precisión
        if (coords.length > 0) {
          let area = 0
          let cx = 0
          let cy = 0

          // Algoritmo de centroide poligonal
          for (let i = 0; i < coords.length; i++) {
            const j = (i + 1) % coords.length
            const xi = coords[i][0]
            const yi = coords[i][1]
            const xj = coords[j][0]
            const yj = coords[j][1]

            const cross = xi * yj - xj * yi
            area += cross
            cx += (xi + xj) * cross
            cy += (yi + yj) * cross
          }

          area /= 2

          if (Math.abs(area) > 1e-10) {
            cx /= (6 * area)
            cy /= (6 * area)
          } else {
            // Fallback al bounding box si el área es cero o muy pequeña
            let minLng = Infinity, maxLng = -Infinity, minLat = Infinity, maxLat = -Infinity
            coords.forEach(coord => {
              minLng = Math.min(minLng, coord[0])
              maxLng = Math.max(maxLng, coord[0])
              minLat = Math.min(minLat, coord[1])
              maxLat = Math.max(maxLat, coord[1])
            })
            cx = (minLng + maxLng) / 2
            cy = (minLat + maxLat) / 2
          }

          departamentosUnicos[nombre] = {
            type: 'Feature',
            properties: { shapeName: nombre },
            geometry: {
              type: 'Point',
              coordinates: [cx, cy]
            }
          }
        }
      }
    })
    
    const etiquetasGeoJSON = {
      type: 'FeatureCollection',
      features: Object.values(departamentosUnicos)
    }
    
    // Verificar las propiedades del GeoJSON
    console.log('GeoJSON cargado:', geojson.features.length, 'polígonos')
    console.log('Departamentos únicos:', Object.keys(departamentosUnicos).length)

    // Crear estilo del mapa con los departamentos
    const estilo = {
      version: 8,
      glyphs: 'https://demotiles.maplibre.org/font/{fontstack}/{range}.pbf',
      sources: {
        honduras: {
          type: 'geojson',
          data: geojson
        },
        etiquetas: {
          type: 'geojson',
          data: etiquetasGeoJSON
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
        // Capa 2: Relleno de departamentos (con hover usando feature-state)
        {
          id: 'departamentos-fill',
          type: 'fill',
          source: 'honduras',
          paint: {
            'fill-color': [
              'case',
              ['boolean', ['feature-state', 'hover'], false],
              '#87CEEB', // Azul cielo suave cuando hover
              '#ffffff'  // Blanco normal
            ],
            'fill-opacity': [
              'case',
              ['boolean', ['feature-state', 'hover'], false],
              0.7,  // Más opaco en hover
              0.9   // Normal
            ]
          }
        },
        // Capa 3: Bordes de departamentos
        {
          id: 'departamentos-borde',
          type: 'line',
          source: 'honduras',
          paint: {
            'line-color': '#94a3b8',  // Gris constante (sin cambio en hover)
            'line-width': [
              'case',
              ['boolean', ['feature-state', 'hover'], false],
              2.5,  // Más grueso en hover
              1.5   // Normal
            ]
          }
        },
        // Capa 4: Etiquetas de departamentos (una por departamento, desde fuente separada)
        {
          id: 'departamentos-labels',
          type: 'symbol',
          source: 'etiquetas',
          layout: {
            'text-field': ['get', 'shapeName'],
            'text-size': 11,
            'text-font': ['Open Sans Regular', 'Arial Unicode MS Regular'],
            'text-anchor': 'center',
            'text-justify': 'center',
            'text-allow-overlap': false,
            'text-ignore-placement': false,
            'text-max-width': 5
          },
          paint: {
            'text-color': '#374151',
            'text-halo-color': '#ffffff',
            'text-halo-width': 2,
            'text-halo-blur': 0.5
          }
        }
      ]
    }

    // Inicializar mapa
    map = new maplibregl.Map({
      container: mapaContainer.value || 'mapa-honduras',
      style: estilo,
      center: centroInicial,
      zoom: zoomInicial,
      pitch: 0,
      bearing: 0,
      // Habilitar arrastre y zoom
      scrollZoom: true,
      boxZoom: true,
      dragRotate: false,
      dragPan: true, // Habilitado para arrastrar
      keyboard: true,
      doubleClickZoom: true,
      touchZoomRotate: true
    })

    // Confirmar carga del mapa
    map.on('load', () => {
      console.log('Mapa de Honduras cargado correctamente')
      agregarMarcadoresMunicipios()
      agregarInteractividadDepartamentos()
    })

    // Manejar errores
    map.on('error', (e) => {
      console.error('Error al cargar el mapa:', e)
    })
  } catch (error) {
    console.error('Error al construir el mapa:', error)
  }
}

// Función para validar coordenadas
const validarCoordenadas = (lng, lat) => {
  return !isNaN(lng) && !isNaN(lat) && 
         lng >= -180 && lng <= 180 && 
         lat >= -90 && lat <= 90
}

// Función para agregar marcadores de municipios LNOB
const agregarMarcadoresMunicipios = () => {
  console.log('Agregando marcadores de municipios LNOB...')
  
  municipiosLNOB.forEach((municipio, index) => {
    const [lng, lat] = municipio.coordenadas
    
    // Validar coordenadas
    if (!validarCoordenadas(lng, lat)) {
      console.error(`Coordenadas inválidas para ${municipio.nombre}:`, municipio.coordenadas)
      return
    }
    
    // Crear marcador personalizado con tamaño fijo
    const markerElement = document.createElement('div')
    markerElement.className = 'marker-municipio'
    markerElement.style.cssText = `
      width: 14px;
      height: 14px;
      background-color: #ef4444;
      border: 2px solid #ffffff;
      border-radius: 50%;
      box-shadow: 0 2px 4px rgba(0,0,0,0.3);
      cursor: pointer;
    `
    
    // Añadir efecto hover solo con color (sin cambiar tamaño)
    markerElement.addEventListener('mouseenter', () => {
      markerElement.style.backgroundColor = '#dc2626'
      markerElement.style.boxShadow = '0 3px 6px rgba(0,0,0,0.4)'
    })
    
    markerElement.addEventListener('mouseleave', () => {
      markerElement.style.backgroundColor = '#ef4444'
      markerElement.style.boxShadow = '0 2px 4px rgba(0,0,0,0.3)'
    })

    // Crear y añadir marcador al mapa con anchor en centro
    const marker = new maplibregl.Marker({
      element: markerElement,
      anchor: 'center'
    })
      .setLngLat([lng, lat])
      .addTo(map)

    // Verificar que el marcador se agregó correctamente
    if (!marker) {
      console.error(`Error al crear marcador para ${municipio.nombre}`)
      return
    }

    // Evento de clic para abrir modal y centrar el mapa
    markerElement.addEventListener('click', (e) => {
      e.stopPropagation()
      abrirModal(municipio)
      map.flyTo({
        center: [lng, lat],
        zoom: 9,
        speed: 1.2,
        curve: 1.4,
        essential: true
      })
    })
  })
  
  console.log('Marcadores agregados correctamente')
}

// Función para agregar interactividad a los departamentos
const agregarInteractividadDepartamentos = () => {
  // Variable para almacenar el departamento hover
  let hoveredDepartamentoId = null
  
  // Evento hover sobre departamentos
  map.on('mousemove', 'departamentos-fill', (e) => {
    map.getCanvas().style.cursor = 'pointer'
    
    if (e.features.length > 0) {
      // Quitar hover del anterior
      if (hoveredDepartamentoId !== null) {
        map.setFeatureState(
          { source: 'honduras', id: hoveredDepartamentoId },
          { hover: false }
        )
      }
      // Agregar hover al nuevo
      hoveredDepartamentoId = e.features[0].id
      map.setFeatureState(
        { source: 'honduras', id: hoveredDepartamentoId },
        { hover: true }
      )
    }
  })
  
  // Evento mouseleave
  map.on('mouseleave', 'departamentos-fill', () => {
    map.getCanvas().style.cursor = ''
    if (hoveredDepartamentoId !== null) {
      map.setFeatureState(
        { source: 'honduras', id: hoveredDepartamentoId },
        { hover: false }
      )
    }
    hoveredDepartamentoId = null
  })

  // Evento clic en departamentos para hacer zoom
  map.on('click', 'departamentos-fill', (e) => {
    if (e.features.length > 0) {
      const feature = e.features[0]
      const geometry = feature.geometry
      
      // Calcular bounds manualmente para geometrías GeoJSON
      let bounds = null
      
      if (geometry.type === 'Polygon') {
        bounds = getBoundsFromCoordinates(geometry.coordinates[0])
      } else if (geometry.type === 'MultiPolygon') {
        // Usar el polígono más grande
        let maxArea = 0
        let bestBounds = null
        
        geometry.coordinates.forEach(polygonCoords => {
          const polygonBounds = getBoundsFromCoordinates(polygonCoords[0])
          const area = (polygonBounds[2] - polygonBounds[0]) * (polygonBounds[3] - polygonBounds[1])
          if (area > maxArea) {
            maxArea = area
            bestBounds = polygonBounds
          }
        })
        bounds = bestBounds
      }
      
      if (bounds) {
        map.fitBounds([
          [bounds[0], bounds[1]], // southwest
          [bounds[2], bounds[3]]  // northeast
        ], {
          padding: 50,
          maxZoom: 9,
          speed: 1.2,
          curve: 1.4,
          essential: true
        })
      }
    }
  })

// Función auxiliar para calcular bounds de coordenadas
const getBoundsFromCoordinates = (coordinates) => {
  let minLng = Infinity, maxLng = -Infinity, minLat = Infinity, maxLat = -Infinity
  
  coordinates.forEach(coord => {
    minLng = Math.min(minLng, coord[0])
    maxLng = Math.max(maxLng, coord[0])
    minLat = Math.min(minLat, coord[1])
    maxLat = Math.max(maxLat, coord[1])
  })
  
  return [minLng, minLat, maxLng, maxLat]
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

<style>
/* Eliminar outline de focus en marcadores y mapa */
.maplibregl-marker:focus,
.maplibregl-canvas:focus,
.marker-municipio:focus {
  outline: none !important;
}
</style>
