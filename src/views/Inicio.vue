<template>
  <div class="max-w-7xl mx-auto px-3 space-y-6">
    <!-- Cabecera del Proyecto -->
    <div class="bg-gradient-to-r from-orange-500 to-orange-600 text-white rounded-lg p-8 text-center animate-fade-in">
      <h1 class="text-3xl md:text-4xl font-bold mb-4">PROYECTO</h1>
      <p class="text-2xl md:text-3xl font-bold mb-2">"No dejar a nadie atrás"</p>
      <h2 class="text-lg md:text-xl font-semibold mb-4">
        Reducción del Embarazo Adolescente
      </h2>
      <p class="text-lg md:text-xl max-w-4xl mx-auto leading-relaxed">
        en las comunidades afrodescendientes, criollas, garífunas y miskitas 
        en municipios seleccionados de la costa caribeña centroamericana.
      </p>
    </div>

    <!-- Objetivo Final -->
    <div class="bg-white border border-gray-300 rounded-lg p-6 animate-slide-in">
      <div class="flex items-center gap-3 mb-4">
        <Target class="w-6 h-6 text-orange-600" />
        <h3 class="text-xl font-bold text-gray-800">Objetivo Final 2025</h3>
      </div>
      <div class="space-y-2 text-gray-700">
        <p class="animate-fade-in-delay-1">• Se ha acelerado la reducción de las muertes maternas prevenibles</p>
        <p class="animate-fade-in-delay-2">• Se ha acelerado la reducción de la necesidad insatisfecha de planificación familiar</p>
        <p class="animate-fade-in-delay-3">• Se ha acelerado la reducción de la VBG y las prácticas nocivas</p>
      </div>
    </div>

    <!-- Resultado Esperado -->
    <div class="bg-white border border-gray-300 rounded-lg p-6 animate-slide-in-right">
      <div class="flex items-center gap-3 mb-4">
        <Trophy class="w-6 h-6 text-orange-600" />
        <h3 class="text-xl font-bold text-gray-800">Resultado Esperado 2025</h3>
      </div>
      <p class="text-gray-700 leading-relaxed animate-fade-in">
        El proyecto ha contribuido a la reducción del embarazo adolescente brindando servicios de calidad 
        libres de racismo y discriminación y empoderando a mujeres y jóvenes de comunidades 
        afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de Centroamérica Caribe Costa.
      </p>
    </div>

    <!-- Outputs del Proyecto -->
    <div class="space-y-4">
      <h3 class="text-xl font-bold text-center text-gray-800 mb-4 animate-bounce-in">
        ¿Qué lograremos con la ejecución del Proyecto?
      </h3>
      
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <!-- Output 1 -->
        <div class="bg-white border border-gray-300 rounded-lg p-6 hover:shadow-md transition-all duration-300 transform hover:-translate-y-1 animate-fade-in-delay-1">
          <div class="flex items-center gap-3 mb-2">
            <BookOpen class="w-5 h-5 text-orange-600" />
            <h4 class="text-lg font-bold text-gray-800">Output 1</h4>
          </div>
          <p class="text-gray-700">
            Fortalecimiento de la educación sexual integral dentro y fuera de la escuela para adolescentes, 
            niñas y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados 
            de la Costa Caribe centroamericana.
          </p>
        </div>

        <!-- Output 2 -->
        <div class="bg-white border border-gray-300 rounded-lg p-6 hover:shadow-md transition-all duration-300 transform hover:-translate-y-1 animate-fade-in-delay-2">
          <div class="flex items-center gap-3 mb-2">
            <Stethoscope class="w-5 h-5 text-orange-600" />
            <h4 class="text-lg font-bold text-gray-800">Output 2</h4>
          </div>
          <p class="text-gray-700">
            Mejorar de la cobertura y acceso a servicios de salud sexual y reproductiva de alta calidad 
            para adolescentes y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios 
            seleccionados de la Costa Caribe centroamericana.
          </p>
        </div>

        <!-- Output 3 -->
        <div class="bg-white border border-gray-300 rounded-lg p-6 hover:shadow-md transition-all duration-300 transform hover:-translate-y-1 animate-fade-in-delay-3">
          <div class="flex items-center gap-3 mb-2">
            <Users class="w-5 h-5 text-orange-600" />
            <h4 class="text-lg font-bold text-gray-800">Output 3</h4>
          </div>
          <p class="text-gray-700">
            Aumentar las capacidades de liderazgo y empoderamiento de mujeres y jóvenes de comunidades 
            afrodescendientes, criollas, garífunas y miskitas para abogar por el cumplimiento de sus derechos, 
            incluyendo la salud y los derechos sexuales y reproductivos.
          </p>
        </div>

        <!-- Output 4 -->
        <div class="bg-white border border-gray-300 rounded-lg p-6 hover:shadow-md transition-all duration-300 transform hover:-translate-y-1 animate-fade-in-delay-4">
          <div class="flex items-center gap-3 mb-2">
            <BarChart3 class="w-5 h-5 text-orange-600" />
            <h4 class="text-lg font-bold text-gray-800">Output 4</h4>
          </div>
          <p class="text-gray-700">
            Contar con una Línea de base, seguimiento y evaluación para medir el impacto y progreso 
            del proyecto en las comunidades objetivo.
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
// Vista de inicio con información del proyecto - animaciones sutiles y distribución atractiva
import { Target, Trophy, BookOpen, Stethoscope, Users, BarChart3 } from 'lucide-vue-next'
</script>

<style scoped>
@keyframes fade-in {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

@keyframes slide-in {
  from { opacity: 0; transform: translateX(-30px); }
  to { opacity: 1; transform: translateX(0); }
}

@keyframes slide-in-right {
  from { opacity: 0; transform: translateX(30px); }
  to { opacity: 1; transform: translateX(0); }
}

@keyframes bounce-in {
  0% { opacity: 0; transform: scale(0.3); }
  50% { opacity: 1; transform: scale(1.05); }
  70% { transform: scale(0.9); }
  100% { opacity: 1; transform: scale(1); }
}

.animate-fade-in {
  animation: fade-in 0.8s ease-out;
}

.animate-fade-in-delay-1 {
  animation: fade-in 0.8s ease-out 0.2s both;
}

.animate-fade-in-delay-2 {
  animation: fade-in 0.8s ease-out 0.4s both;
}

.animate-fade-in-delay-3 {
  animation: fade-in 0.8s ease-out 0.6s both;
}

.animate-fade-in-delay-4 {
  animation: fade-in 0.8s ease-out 0.8s both;
}

.animate-slide-in {
  animation: slide-in 0.8s ease-out;
}

.animate-slide-in-right {
  animation: slide-in-right 0.8s ease-out;
}

.animate-bounce-in {
  animation: bounce-in 1s ease-out;
}
</style>
