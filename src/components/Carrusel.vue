<template>
  <div class="relative w-full h-96 overflow-hidden rounded-lg shadow-lg bg-gray-200">
    <div class="relative w-full h-full">
      <div 
        v-for="(image, index) in images" 
        :key="index"
        class="absolute inset-0 w-full h-full transition-opacity duration-1000 ease-in-out"
        :class="currentIndex === index ? 'opacity-100' : 'opacity-0'"
      >
        <img 
          :src="image" 
          :alt="`Imagen ${index + 1}`"
          class="w-full h-full object-cover object-center"
          loading="lazy"
        />
      </div>
    </div>
    
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

// Lista de imágenes del carrusel
const images = [
  '/1.jpeg',
  '/2.jpeg', 
  '/3.jpeg',
  '/4.jpeg',
  '/5.jpeg',
  '/6.jpeg'
]

const currentIndex = ref(0)
let intervalId = null

// Función para avanzar al siguiente slide
const nextSlide = () => {
  currentIndex.value = (currentIndex.value + 1) % images.length
}

// Iniciar el carrusel automático
const startCarousel = () => {
  intervalId = setInterval(nextSlide, 4000) // Cambia cada 4 segundos
}

// Detener el carrusel
const stopCarousel = () => {
  if (intervalId) {
    clearInterval(intervalId)
    intervalId = null
  }
}

// Pausar el carrusel al hacer hover
const pauseCarousel = () => {
  stopCarousel()
}

// Reanudar el carrusel al quitar el hover
const resumeCarousel = () => {
  startCarousel()
}

onMounted(() => {
  startCarousel()
})

onUnmounted(() => {
  stopCarousel()
})
</script>

<style scoped>
/* Transición suave para el carrusel con fade effect */
.transition-opacity {
  transition: opacity 1s ease-in-out;
}

/* Asegurar que las imágenes estén superpuestas correctamente */
.absolute {
  z-index: 1;
}

.absolute.opacity-100 {
  z-index: 2;
}

/* Optimización para las imágenes */
img {
  image-rendering: -webkit-optimize-contrast;
  image-rendering: crisp-edges;
  backface-visibility: hidden;
  transform: translateZ(0);
}

/* Mejorar la calidad de las transiciones */
.absolute {
  will-change: opacity;
}

</style>
