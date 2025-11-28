<template>
  <section class="border border-gray-300 p-6">
    <div class="flex items-center justify-between mb-6">
      <div class="flex items-center gap-2">
        <Target class="w-5 h-5 text-gray-700" />
        <h2 class="text-lg font-semibold text-gray-900">Sección A – Alcance del Proyecto</h2>
        <span class="text-xs text-gray-500">(Indicadores mínimos LNOB)</span>
      </div>

      <!-- Pestañas -->
      <div class="flex gap-2">
        <button
          @click="pestañaActiva = 'kpis'"
          :class="[
            'px-3 py-1.5 text-sm font-medium transition-all duration-200 border rounded-full',
            pestañaActiva === 'kpis'
              ? 'bg-orange-500 text-white border-orange-500'
              : 'bg-transparent text-orange-600 border-orange-300 hover:bg-orange-50'
          ]"
        >
          Indicadores KPI
        </button>
        <button
          @click="pestañaActiva = 'graficos'"
          :class="[
            'px-3 py-1.5 text-sm font-medium transition-all duration-200 border rounded-full',
            pestañaActiva === 'graficos'
              ? 'bg-orange-500 text-white border-orange-500'
              : 'bg-transparent text-orange-600 border-orange-300 hover:bg-orange-50'
          ]"
        >
          Gráficos por Municipio
        </button>
      </div>
    </div>

    <!-- Contenido de las pestañas -->
    <div v-if="pestañaActiva === 'kpis'">
      <!-- 6 Tarjetas KPI -->
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3 mb-6">
        <!-- KPI 1: Adolescentes alcanzados -->
        <div class="bg-white border border-gray-200 rounded-lg p-4 hover:shadow-md transition-shadow">
          <div class="flex items-center gap-2 mb-3">
            <div class="p-1.5 bg-orange-100 rounded-lg">
              <Users class="w-5 h-5 text-orange-600" />
            </div>
            <div>
              <h3 class="text-xs font-medium text-gray-600">Adolescentes Alcanzados (EIS)</h3>
              <p class="text-xs text-gray-400">Educación Integral en Sexualidad</p>
            </div>
          </div>
          <div class="space-y-2">
            <div class="flex justify-between items-center">
              <span class="text-xs text-gray-500">Meta</span>
              <span class="text-base font-bold text-gray-900">{{ indicadores.adolescentes.meta.total }}</span>
            </div>
            <div class="flex justify-between items-center">
              <span class="text-xs text-gray-500">Real</span>
              <span class="text-base font-bold text-orange-600">{{ indicadores.adolescentes.real.total }}</span>
            </div>
            <div class="w-full bg-gray-200 rounded-full h-1.5">
              <div 
                class="h-1.5 rounded-full transition-all duration-500"
                :class="getProgressColor(indicadores.adolescentes.porcentaje)"
                :style="{ width: Math.min(indicadores.adolescentes.porcentaje, 100) + '%' }"
              ></div>
            </div>
            <div class="flex justify-between text-xs">
              <span class="text-gray-500">{{ indicadores.adolescentes.porcentaje }}% completado</span>
            </div>
            <!-- Desglose por género -->
            <div class="pt-2 border-t border-gray-100 grid grid-cols-2 gap-1">
              <div class="text-center p-1.5 bg-blue-50 rounded">
                <UserCircle class="w-3 h-3 text-blue-600 mx-auto mb-0.5" />
                <p class="text-xs text-gray-500">Hombres</p>
                <p class="text-xs font-semibold text-blue-700">{{ indicadores.adolescentes.real.hombres }}</p>
              </div>
              <div class="text-center p-1.5 bg-pink-50 rounded">
                <UserCircle class="w-3 h-3 text-pink-600 mx-auto mb-0.5" />
                <p class="text-xs text-gray-500">Mujeres</p>
                <p class="text-xs font-semibold text-pink-700">{{ indicadores.adolescentes.real.mujeres }}</p>
              </div>
            </div>
          </div>
        </div>

        <!-- KPI 2: Docentes capacitados -->
        <div class="bg-white border border-gray-200 rounded-lg p-4 hover:shadow-md transition-shadow">
          <div class="flex items-center gap-2 mb-3">
            <div class="p-1.5 bg-orange-100 rounded-lg">
              <GraduationCap class="w-5 h-5 text-orange-600" />
            </div>
            <div>
              <h3 class="text-xs font-medium text-gray-600">Docentes Capacitados (EIS)</h3>
              <p class="text-xs text-gray-400">Formación en educación sexual</p>
            </div>
          </div>
          <div class="space-y-2">
            <div class="flex justify-between items-center">
              <span class="text-xs text-gray-500">Meta</span>
              <span class="text-base font-bold text-gray-900">{{ indicadores.docentes.meta.total }}</span>
            </div>
            <div class="flex justify-between items-center">
              <span class="text-xs text-gray-500">Real</span>
              <span class="text-base font-bold text-orange-600">{{ indicadores.docentes.real.total }}</span>
            </div>
            <div class="w-full bg-gray-200 rounded-full h-1.5">
              <div 
                class="h-1.5 rounded-full transition-all duration-500"
                :class="getProgressColor(indicadores.docentes.porcentaje)"
                :style="{ width: Math.min(indicadores.docentes.porcentaje, 100) + '%' }"
              ></div>
            </div>
            <div class="flex justify-between text-xs">
              <span class="text-gray-500">{{ indicadores.docentes.porcentaje }}% completado</span>
            </div>
            <!-- Desglose por género -->
            <div class="pt-2 border-t border-gray-100 grid grid-cols-2 gap-1">
              <div class="text-center p-1.5 bg-blue-50 rounded">
                <UserCircle class="w-3 h-3 text-blue-600 mx-auto mb-0.5" />
                <p class="text-xs text-gray-500">Hombres</p>
                <p class="text-xs font-semibold text-blue-700">{{ indicadores.docentes.real.hombres }}</p>
              </div>
              <div class="text-center p-1.5 bg-pink-50 rounded">
                <UserCircle class="w-3 h-3 text-pink-600 mx-auto mb-0.5" />
                <p class="text-xs text-gray-500">Mujeres</p>
                <p class="text-xs font-semibold text-pink-700">{{ indicadores.docentes.real.mujeres }}</p>
              </div>
            </div>
          </div>
        </div>

        <!-- KPI 3: Organizaciones comunitarias -->
        <div class="bg-white border border-gray-200 rounded-lg p-4 hover:shadow-md transition-shadow">
          <div class="flex items-center gap-2 mb-3">
            <div class="p-1.5 bg-orange-100 rounded-lg">
              <Building2 class="w-5 h-5 text-orange-600" />
            </div>
            <div>
              <h3 class="text-xs font-medium text-gray-600">Organizaciones Comunitarias</h3>
              <p class="text-xs text-gray-400">Organizaciones activas</p>
            </div>
          </div>
          <div class="space-y-2">
            <div class="flex justify-between items-center">
              <span class="text-xs text-gray-500">Meta</span>
              <span class="text-base font-bold text-gray-900">{{ indicadores.organizaciones.meta }}</span>
            </div>
            <div class="flex justify-between items-center">
              <span class="text-xs text-gray-500">Real</span>
              <span class="text-base font-bold text-orange-600">{{ indicadores.organizaciones.real }}</span>
            </div>
            <div class="w-full bg-gray-200 rounded-full h-1.5">
              <div 
                class="h-1.5 rounded-full transition-all duration-500"
                :class="getProgressColor(indicadores.organizaciones.porcentaje)"
                :style="{ width: Math.min(indicadores.organizaciones.porcentaje, 100) + '%' }"
              ></div>
            </div>
            <div class="flex justify-between text-xs">
              <span class="text-gray-500">{{ indicadores.organizaciones.porcentaje }}% completado</span>
            </div>
          </div>
        </div>

        <!-- KPI 4: Establecimientos de salud -->
        <div class="bg-white border border-gray-200 rounded-lg p-4 hover:shadow-md transition-shadow">
          <div class="flex items-center gap-2 mb-3">
            <div class="p-1.5 bg-orange-100 rounded-lg">
              <Building class="w-5 h-5 text-orange-600" />
            </div>
            <div>
              <h3 class="text-xs font-medium text-gray-600">Establecimientos de Salud</h3>
              <p class="text-xs text-gray-400">Unidades involucradas</p>
            </div>
          </div>
          <div class="space-y-2">
            <div class="flex justify-between items-center">
              <span class="text-xs text-gray-500">Meta</span>
              <span class="text-base font-bold text-gray-900">{{ indicadores.establecimientos.meta }}</span>
            </div>
            <div class="flex justify-between items-center">
              <span class="text-xs text-gray-500">Real</span>
              <span class="text-base font-bold text-orange-600">{{ indicadores.establecimientos.real }}</span>
            </div>
            <div class="w-full bg-gray-200 rounded-full h-1.5">
              <div 
                class="h-1.5 rounded-full transition-all duration-500"
                :class="getProgressColor(indicadores.establecimientos.porcentaje)"
                :style="{ width: Math.min(indicadores.establecimientos.porcentaje, 100) + '%' }"
              ></div>
            </div>
            <div class="flex justify-between text-xs">
              <span class="text-gray-500">{{ indicadores.establecimientos.porcentaje }}% completado</span>
            </div>
          </div>
        </div>

        <!-- KPI 5: Proveedores capacitados -->
        <div class="bg-white border border-gray-200 rounded-lg p-4 hover:shadow-md transition-shadow">
          <div class="flex items-center gap-2 mb-3">
            <div class="p-1.5 bg-orange-100 rounded-lg">
              <Stethoscope class="w-5 h-5 text-orange-600" />
            </div>
            <div>
              <h3 class="text-xs font-medium text-gray-600">Proveedores Capacitados</h3>
              <p class="text-xs text-gray-400">Personal de salud (SSR)</p>
            </div>
          </div>
          <div class="space-y-2">
            <div class="flex justify-between items-center">
              <span class="text-xs text-gray-500">Meta</span>
              <span class="text-base font-bold text-gray-900">{{ indicadores.proveedores.meta.total }}</span>
            </div>
            <div class="flex justify-between items-center">
              <span class="text-xs text-gray-500">Real</span>
              <span class="text-base font-bold text-orange-600">{{ indicadores.proveedores.real.total }}</span>
            </div>
            <div class="w-full bg-gray-200 rounded-full h-1.5">
              <div 
                class="h-1.5 rounded-full transition-all duration-500"
                :class="getProgressColor(indicadores.proveedores.porcentaje)"
                :style="{ width: Math.min(indicadores.proveedores.porcentaje, 100) + '%' }"
              ></div>
            </div>
            <div class="flex justify-between text-xs">
              <span class="text-gray-500">{{ indicadores.proveedores.porcentaje }}% completado</span>
            </div>
            <!-- Desglose por tipo -->
            <div class="pt-2 border-t border-gray-100 grid grid-cols-2 gap-1">
              <div class="text-center p-1.5 bg-green-50 rounded">
                <Activity class="w-3 h-3 text-green-600 mx-auto mb-0.5" />
                <p class="text-xs text-gray-500">Médicos</p>
                <p class="text-xs font-semibold text-green-700">{{ indicadores.proveedores.real.medicos }}</p>
              </div>
              <div class="text-center p-1.5 bg-purple-50 rounded">
                <Activity class="w-3 h-3 text-purple-600 mx-auto mb-0.5" />
                <p class="text-xs text-gray-500">Enfermeras</p>
                <p class="text-xs font-semibold text-purple-700">{{ indicadores.proveedores.real.enfermeras }}</p>
              </div>
            </div>
          </div>
        </div>

        <!-- KPI 6: Jóvenes en liderazgo -->
        <div class="bg-white border border-gray-200 rounded-lg p-4 hover:shadow-md transition-shadow">
          <div class="flex items-center gap-2 mb-3">
            <div class="p-1.5 bg-orange-100 rounded-lg">
              <Award class="w-5 h-5 text-orange-600" />
            </div>
            <div>
              <h3 class="text-xs font-medium text-gray-600">Jóvenes en Liderazgo</h3>
              <p class="text-xs text-gray-400">Formación en derechos</p>
            </div>
          </div>
          <div class="space-y-2">
            <div class="flex justify-between items-center">
              <span class="text-xs text-gray-500">Meta</span>
              <span class="text-base font-bold text-gray-900">{{ indicadores.liderazgo.meta }}</span>
            </div>
            <div class="flex justify-between items-center">
              <span class="text-xs text-gray-500">Real</span>
              <span class="text-base font-bold text-orange-600">{{ indicadores.liderazgo.real }}</span>
            </div>
            <div class="w-full bg-gray-200 rounded-full h-1.5">
              <div 
                class="h-1.5 rounded-full transition-all duration-500"
                :class="getProgressColor(indicadores.liderazgo.porcentaje)"
                :style="{ width: Math.min(indicadores.liderazgo.porcentaje, 100) + '%' }"
              ></div>
            </div>
            <div class="flex justify-between text-xs">
              <span class="text-gray-500">{{ indicadores.liderazgo.porcentaje }}% completado</span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div v-if="pestañaActiva === 'graficos'">
      <!-- Gráfico de barras por municipio -->
      <div class="bg-white border border-gray-200 rounded-lg p-6">
        <div class="flex items-center gap-3 mb-6">
          <BarChart3 class="w-6 h-6 text-orange-600" />
          <h3 class="text-lg font-semibold text-gray-800">Alcance por Municipio</h3>
        </div>
        
        <div class="space-y-4">
          <div v-for="municipio in datosPorMunicipio" :key="municipio.nombre" class="space-y-2">
            <div class="flex justify-between items-center">
              <span class="text-sm font-medium text-gray-700">{{ municipio.nombre }}</span>
              <span class="text-sm text-gray-500">{{ municipio.adolescentes }} adolescentes</span>
            </div>
            <div class="w-full bg-gray-100 rounded-full h-6 relative overflow-hidden">
              <div 
                class="h-6 rounded-full bg-gradient-to-r from-orange-400 to-orange-600 transition-all duration-700 flex items-center justify-end pr-2"
                :style="{ width: (municipio.adolescentes / maxAdolescentes * 100) + '%' }"
              >
                <span v-if="municipio.adolescentes > 50" class="text-xs text-white font-medium">
                  {{ municipio.porcentaje }}%
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    </section>

    <!-- Sección B - Servicios SSR -->
    <section class="border border-gray-300 p-6 mt-6">
      <div class="flex items-center gap-2 mb-6">
        <Heart class="w-5 h-5 text-gray-700" />
        <h2 class="text-lg font-semibold text-gray-900">Sección B – Servicios de Salud Sexual y Reproductiva</h2>
        <span class="text-xs text-gray-500">(SSR)</span>
      </div>

      <!-- KPIs resumen -->
      <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
        <div class="bg-white border border-gray-200 rounded-lg p-4">
          <div class="flex items-center gap-2 mb-2">
            <div class="p-1.5 bg-orange-100 rounded-lg">
              <Building class="w-5 h-5 text-orange-600" />
            </div>
            <span class="text-xs font-medium text-gray-600">Establecimientos con servicios de calidad</span>
          </div>
          <div class="flex items-baseline gap-2">
            <span class="text-2xl font-bold text-gray-900">{{ resumenSSR.establecimientosCalidad }}</span>
            <span class="text-sm text-gray-500">de {{ resumenSSR.totalEstablecimientos }}</span>
          </div>
          <div class="w-full bg-gray-200 rounded-full h-1.5 mt-2">
            <div class="h-1.5 rounded-full bg-orange-500" :style="{ width: (resumenSSR.establecimientosCalidad / resumenSSR.totalEstablecimientos * 100) + '%' }"></div>
          </div>
        </div>

        <div class="bg-white border border-gray-200 rounded-lg p-4">
          <div class="flex items-center gap-2 mb-2">
            <div class="p-1.5 bg-orange-100 rounded-lg">
              <Stethoscope class="w-5 h-5 text-orange-600" />
            </div>
            <span class="text-xs font-medium text-gray-600">Proveedores formados en SSR intercultural</span>
          </div>
          <div class="flex items-baseline gap-2">
            <span class="text-2xl font-bold text-gray-900">{{ resumenSSR.proveedoresFormados }}</span>
            <span class="text-sm text-gray-500">de {{ resumenSSR.totalProveedores }}</span>
          </div>
          <div class="w-full bg-gray-200 rounded-full h-1.5 mt-2">
            <div class="h-1.5 rounded-full bg-orange-500" :style="{ width: (resumenSSR.proveedoresFormados / resumenSSR.totalProveedores * 100) + '%' }"></div>
          </div>
        </div>

        <div class="bg-white border border-gray-200 rounded-lg p-4">
          <div class="flex items-center gap-2 mb-2">
            <div class="p-1.5 bg-orange-100 rounded-lg">
              <Package class="w-5 h-5 text-orange-600" />
            </div>
            <span class="text-xs font-medium text-gray-600">Disponibilidad MAC/LARC</span>
          </div>
          <div class="flex items-baseline gap-2">
            <span class="text-2xl font-bold text-gray-900">{{ resumenSSR.disponibilidadCompleta }}</span>
            <span class="text-sm text-gray-500">municipios completos</span>
          </div>
          <div class="flex gap-2 mt-2">
            <span class="px-2 py-0.5 bg-green-100 text-green-800 text-xs rounded-full">{{ resumenSSR.verde }} 🟢</span>
            <span class="px-2 py-0.5 bg-yellow-100 text-yellow-800 text-xs rounded-full">{{ resumenSSR.amarillo }} 🟡</span>
            <span class="px-2 py-0.5 bg-red-100 text-red-800 text-xs rounded-full">{{ resumenSSR.rojo }} 🔴</span>
          </div>
        </div>
      </div>

      <!-- Tabla de disponibilidad por municipio -->
      <div class="bg-white border border-gray-200 rounded-lg p-6">
        <div class="flex items-center gap-3 mb-4">
          <TableIcon class="w-5 h-5 text-orange-600" />
          <h3 class="text-base font-semibold text-gray-800">Disponibilidad de Métodos Anticonceptivos por Municipio</h3>
        </div>

        <!-- Leyenda -->
        <div class="flex gap-4 mb-4 text-xs">
          <div class="flex items-center gap-1">
            <span class="w-4 h-4 bg-green-500 rounded"></span>
            <span class="text-gray-600">Disponible</span>
          </div>
          <div class="flex items-center gap-1">
            <span class="w-4 h-4 bg-yellow-500 rounded"></span>
            <span class="text-gray-600">Parcial</span>
          </div>
          <div class="flex items-center gap-1">
            <span class="w-4 h-4 bg-red-500 rounded"></span>
            <span class="text-gray-600">Sin disponibilidad</span>
          </div>
        </div>

        <div class="overflow-x-auto">
          <table class="w-full text-sm">
            <thead>
              <tr class="border-b-2 border-gray-300">
                <th class="text-left py-3 px-3 font-semibold text-gray-700">Municipio</th>
                <th class="text-center py-3 px-2 font-medium text-gray-600">Píldora</th>
                <th class="text-center py-3 px-2 font-medium text-gray-600">Inyección</th>
                <th class="text-center py-3 px-2 font-medium text-gray-600">Implante</th>
                <th class="text-center py-3 px-2 font-medium text-gray-600">DIU</th>
                <th class="text-center py-3 px-2 font-medium text-gray-600">Condón M</th>
                <th class="text-center py-3 px-2 font-medium text-gray-600">Condón F</th>
                <th class="text-center py-3 px-2 font-medium text-gray-600">PAE</th>
                <th class="text-center py-3 px-3 font-semibold text-gray-700">Estado</th>
              </tr>
            </thead>
            <tbody>
              <tr 
                v-for="municipio in disponibilidadMAC" 
                :key="municipio.nombre"
                class="border-b border-gray-200 hover:bg-gray-50"
              >
                <td class="py-3 px-3 font-medium text-gray-900">{{ municipio.nombre }}</td>
                <td class="py-3 px-2 text-center">
                  <span :class="municipio.pildora ? 'text-green-600 font-bold' : 'text-red-500 font-bold'">
                    {{ municipio.pildora ? '✓' : '✗' }}
                  </span>
                </td>
                <td class="py-3 px-2 text-center">
                  <span :class="municipio.inyeccion ? 'text-green-600 font-bold' : 'text-red-500 font-bold'">
                    {{ municipio.inyeccion ? '✓' : '✗' }}
                  </span>
                </td>
                <td class="py-3 px-2 text-center">
                  <span :class="municipio.implante ? 'text-green-600 font-bold' : 'text-red-500 font-bold'">
                    {{ municipio.implante ? '✓' : '✗' }}
                  </span>
                </td>
                <td class="py-3 px-2 text-center">
                  <span :class="municipio.diu ? 'text-green-600 font-bold' : 'text-red-500 font-bold'">
                    {{ municipio.diu ? '✓' : '✗' }}
                  </span>
                </td>
                <td class="py-3 px-2 text-center">
                  <span :class="municipio.condonM ? 'text-green-600 font-bold' : 'text-red-500 font-bold'">
                    {{ municipio.condonM ? '✓' : '✗' }}
                  </span>
                </td>
                <td class="py-3 px-2 text-center">
                  <span :class="municipio.condonF ? 'text-green-600 font-bold' : 'text-red-500 font-bold'">
                    {{ municipio.condonF ? '✓' : '✗' }}
                  </span>
                </td>
                <td class="py-3 px-2 text-center">
                  <span :class="municipio.pae ? 'text-green-600 font-bold' : 'text-red-500 font-bold'">
                    {{ municipio.pae ? '✓' : '✗' }}
                  </span>
                </td>
                <td class="py-3 px-3 text-center">
                  <span :class="getEstadoClass(municipio.estado)">
                    {{ getEstadoLabel(municipio.estado) }}
                  </span>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <!-- Tabla de proveedores por estructura SESAL -->
      <div class="bg-white border border-gray-200 rounded-lg p-6 mt-6">
        <div class="flex items-center gap-3 mb-4">
          <Users class="w-5 h-5 text-orange-600" />
          <h3 class="text-base font-semibold text-gray-800">Proveedores Formados en SSR por Municipio (Estructura SESAL)</h3>
        </div>

        <div class="overflow-x-auto">
          <table class="w-full text-sm">
            <thead>
              <tr class="border-b-2 border-gray-300">
                <th class="text-left py-3 px-3 font-semibold text-gray-700">Municipio</th>
                <th class="text-center py-3 px-3 font-medium text-gray-600">Médicos</th>
                <th class="text-center py-3 px-3 font-medium text-gray-600">Enfermeras</th>
                <th class="text-center py-3 px-3 font-medium text-gray-600">Auxiliares</th>
                <th class="text-center py-3 px-3 font-medium text-gray-600">Otros</th>
                <th class="text-center py-3 px-3 font-semibold text-gray-700">Total</th>
              </tr>
            </thead>
            <tbody>
              <tr 
                v-for="municipio in proveedoresSESAL" 
                :key="municipio.nombre"
                class="border-b border-gray-200 hover:bg-gray-50"
              >
                <td class="py-3 px-3 font-medium text-gray-900">{{ municipio.nombre }}</td>
                <td class="py-3 px-3 text-center text-gray-700">{{ municipio.medicos }}</td>
                <td class="py-3 px-3 text-center text-gray-700">{{ municipio.enfermeras }}</td>
                <td class="py-3 px-3 text-center text-gray-700">{{ municipio.auxiliares }}</td>
                <td class="py-3 px-3 text-center text-gray-700">{{ municipio.otros }}</td>
                <td class="py-3 px-3 text-center font-bold text-orange-600">{{ municipio.total }}</td>
              </tr>
            </tbody>
            <tfoot>
              <tr class="bg-gray-50 border-t-2 border-gray-300">
                <td class="py-3 px-3 font-bold text-gray-900">TOTAL</td>
                <td class="py-3 px-3 text-center font-bold text-gray-900">{{ totalProveedoresSESAL.medicos }}</td>
                <td class="py-3 px-3 text-center font-bold text-gray-900">{{ totalProveedoresSESAL.enfermeras }}</td>
                <td class="py-3 px-3 text-center font-bold text-gray-900">{{ totalProveedoresSESAL.auxiliares }}</td>
                <td class="py-3 px-3 text-center font-bold text-gray-900">{{ totalProveedoresSESAL.otros }}</td>
                <td class="py-3 px-3 text-center font-bold text-orange-600">{{ totalProveedoresSESAL.total }}</td>
              </tr>
            </tfoot>
          </table>
        </div>
      </div>
    </section>

    <!-- Sección D - Narrativa de Barreras -->
    <section class="border border-gray-300 p-6 mt-6">
      <div class="flex items-center gap-2 mb-6">
        <AlertTriangle class="w-5 h-5 text-gray-700" />
        <h2 class="text-lg font-semibold text-gray-900">Sección D – Narrativa de Barreras</h2>
        <span class="text-xs text-orange-600 font-medium">(Evidencia crítica para evaluación)</span>
      </div>

      <!-- Contexto -->
      <div class="bg-orange-50 border border-orange-200 rounded-lg p-4 mb-6">
        <div class="flex items-start gap-2">
          <Info class="w-4 h-4 text-orange-600 mt-0.5" />
          <div>
            <p class="text-sm text-orange-800 font-medium mb-1">Fuente de datos</p>
            <p class="text-xs text-orange-700">Entrevistas rápidas y grupos focales</p>
          </div>
        </div>
      </div>

      <!-- Gráfico de barras horizontal -->
      <div class="bg-white border border-gray-200 rounded-lg p-6">
        <div class="flex items-center gap-3 mb-6">
          <BarChart3 class="w-5 h-5 text-orange-600" />
          <h3 class="text-base font-semibold text-gray-800">Top 4 Barreras Reportadas</h3>
          <span class="text-xs text-gray-500">(Frecuencia de mención)</span>
        </div>

        <div class="space-y-4">
          <div 
            v-for="(barrera, index) in barrerasData" 
            :key="barrera.id"
            class="space-y-2"
          >
            <div class="flex justify-between items-center">
              <div class="flex items-center gap-2">
                <span class="text-sm font-bold text-gray-500 w-6">{{ index + 1 }}</span>
                <span class="text-sm font-medium text-gray-700">{{ barrera.descripcion }}</span>
              </div>
              <span class="text-sm text-gray-600 font-medium">{{ barrera.frecuencia }} menciones</span>
            </div>
            <div class="w-full bg-gray-100 rounded-full h-8 relative overflow-hidden">
              <div 
                class="h-8 rounded-full bg-gradient-to-r from-orange-400 to-orange-600 transition-all duration-700 flex items-center justify-end pr-3"
                :style="{ width: (barrera.frecuencia / maxBarreras * 100) + '%' }"
              >
                <span v-if="barrera.frecuencia > 15" class="text-xs text-white font-medium">
                  {{ Math.round((barrera.frecuencia / maxBarreras) * 100) }}%
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Sección E - Panel de Semáforo Municipal -->
    <section class="border border-gray-300 p-6 mt-6">
      <div class="flex items-center gap-2 mb-6">
        <Activity class="w-5 h-5 text-gray-700" />
        <h2 class="text-lg font-semibold text-gray-900">Sección E – Panel de Semáforo Municipal</h2>
      </div>

      <!-- Tabla simple 7×4 con semáforos -->
      <div class="bg-white border border-gray-200 rounded-lg p-6">
        <div class="flex items-center gap-3 mb-4">
          <Target class="w-5 h-5 text-orange-600" />
          <h3 class="text-base font-semibold text-gray-800">Tabla de Semáforos Municipales</h3>
        </div>

        <div class="overflow-x-auto">
          <table class="w-full text-sm">
            <thead>
              <tr class="border-b-2 border-gray-300">
                <th class="text-left py-3 px-4 font-semibold text-gray-700">Municipio</th>
                <th class="text-center py-3 px-4 font-semibold text-gray-700">MAC</th>
                <th class="text-center py-3 px-4 font-semibold text-gray-700">Proveedores</th>
                <th class="text-center py-3 px-4 font-semibold text-gray-700">EIS</th>
                <th class="text-center py-3 px-4 font-semibold text-gray-700">Comunidades</th>
              </tr>
            </thead>
            <tbody>
              <tr 
                v-for="municipio in semaforosMunicipales" 
                :key="municipio.nombre"
                class="border-b border-gray-200 hover:bg-gray-50"
              >
                <td class="py-3 px-4 font-medium text-gray-900">{{ municipio.nombre }}</td>
                <td class="py-3 px-4 text-center">
                  <span :class="getSemaforoClass(municipio.mac)"></span>
                </td>
                <td class="py-3 px-4 text-center">
                  <span :class="getSemaforoClass(municipio.proveedores)"></span>
                </td>
                <td class="py-3 px-4 text-center">
                  <span :class="getSemaforoClass(municipio.eis)"></span>
                </td>
                <td class="py-3 px-4 text-center">
                  <span :class="getSemaforoClass(municipio.comunidades)"></span>
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        <!-- Leyenda -->
        <div class="flex gap-6 mt-6 justify-center text-sm">
          <div class="flex items-center gap-2">
            <span class="w-6 h-6 bg-green-500 rounded-full"></span>
            <span class="text-gray-600">Avance adecuado</span>
          </div>
          <div class="flex items-center gap-2">
            <span class="w-6 h-6 bg-yellow-500 rounded-full"></span>
            <span class="text-gray-600">Avance parcial</span>
          </div>
          <div class="flex items-center gap-2">
            <span class="w-6 h-6 bg-red-500 rounded-full"></span>
            <span class="text-gray-600">Requiere atención</span>
          </div>
        </div>
      </div>
    </section>
</template>

<script setup>
import { computed, ref } from 'vue'
import { 
  Users, 
  GraduationCap, 
  Building2, 
  Building, 
  Stethoscope, 
  Award,
  BarChart3,
  Activity,
  UserCircle,
  Target,
  Heart,
  Package,
  Table as TableIcon,
  AlertTriangle,
  Info
} from 'lucide-vue-next'

const props = defineProps({
  departamentoSeleccionado: {
    type: String,
    default: ''
  },
  municipioSeleccionado: {
    type: String,
    default: ''
  }
})

// Control de pestañas
const pestañaActiva = ref('kpis')

// Datos mock de indicadores (Meta vs Real)
const indicadores = computed(() => ({
  adolescentes: {
    meta: { total: 2500, hombres: 1200, mujeres: 1300 },
    real: { total: 1875, hombres: 890, mujeres: 985 },
    porcentaje: 75
  },
  docentes: {
    meta: { total: 150, hombres: 60, mujeres: 90 },
    real: { total: 112, hombres: 45, mujeres: 67 },
    porcentaje: 75
  },
  organizaciones: {
    meta: 25,
    real: 18,
    porcentaje: 72
  },
  establecimientos: {
    meta: 35,
    real: 28,
    porcentaje: 80
  },
  proveedores: {
    meta: { total: 200, medicos: 50, enfermeras: 80, auxiliares: 50, otros: 20 },
    real: { total: 156, medicos: 38, enfermeras: 65, auxiliares: 40, otros: 13 },
    porcentaje: 78
  },
  liderazgo: {
    meta: 100,
    real: 67,
    porcentaje: 67
  }
}))

// Datos por municipio para el gráfico de barras
const datosPorMunicipio = computed(() => [
  { nombre: 'La Ceiba', adolescentes: 420, porcentaje: 84 },
  { nombre: 'Iriona', adolescentes: 285, porcentaje: 71 },
  { nombre: 'Limón', adolescentes: 198, porcentaje: 66 },
  { nombre: 'Santa Fe', adolescentes: 312, porcentaje: 78 },
  { nombre: 'Santa Rosa de Aguán', adolescentes: 245, porcentaje: 70 },
  { nombre: 'José Santos Guardiola', adolescentes: 178, porcentaje: 59 },
  { nombre: 'Puerto Lempira', adolescentes: 237, porcentaje: 68 }
])

const maxAdolescentes = computed(() => 
  Math.max(...datosPorMunicipio.value.map(m => m.adolescentes))
)

// Datos de semáforo por municipio (basado en datos reales del proyecto)
const semaforos = computed(() => [
  { 
    nombre: 'La Ceiba', 
    mac: 'verde', // Alta disponibilidad de MAC
    proveedores: 'amarillo', // Proveedores parcialmente capacitados
    eis: 'verde', // Buen avance en EIS
    comunidades: 'verde' // Organizaciones activas
  },
  { 
    nombre: 'Iriona', 
    mac: 'amarillo', // Disponibilidad moderada de MAC
    proveedores: 'amarillo', // Proveedores en proceso
    eis: 'amarillo', // EIS en progreso
    comunidades: 'verde' // Organizaciones activas
  },
  { 
    nombre: 'Limón', 
    mac: 'rojo', // Baja disponibilidad de MAC
    proveedores: 'amarillo', // Proveedores en proceso
    eis: 'rojo', // EIS requiere atención
    comunidades: 'amarillo' // Organizaciones parciales
  },
  { 
    nombre: 'Santa Fe', 
    mac: 'verde', // Buena disponibilidad de MAC
    proveedores: 'verde', // Proveedores capacitados
    eis: 'verde', // Buen avance en EIS
    comunidades: 'amarillo' // Organizaciones en progreso
  },
  { 
    nombre: 'Santa Rosa de Aguán', 
    mac: 'amarillo', // Disponibilidad moderada de MAC
    proveedores: 'rojo', // Proveedores requieren atención
    eis: 'amarillo', // EIS en progreso
    comunidades: 'verde' // Organizaciones activas
  },
  { 
    nombre: 'José Santos Guardiola', 
    mac: 'amarillo', // Disponibilidad moderada de MAC
    proveedores: 'amarillo', // Proveedores en proceso
    eis: 'rojo', // EIS requiere atención
    comunidades: 'amarillo' // Organizaciones en progreso
  },
  { 
    nombre: 'Puerto Lempira', 
    mac: 'rojo', // Baja disponibilidad de MAC
    proveedores: 'rojo', // Proveedores requieren atención
    eis: 'amarillo', // EIS en progreso
    comunidades: 'rojo' // Organizaciones requieren atención
  }
])

// Funciones helper
const getProgressColor = (porcentaje) => {
  if (porcentaje >= 80) return 'bg-green-500'
  if (porcentaje >= 50) return 'bg-yellow-500'
  return 'bg-red-500'
}

const getSemaforoEmoji = (estado) => {
  const emojis = {
    verde: '●',
    amarillo: '●',
    rojo: '●'
  }
  return emojis[estado] || '○'
}

const getSemaforoClass = (estado) => {
  const classes = {
    verde: 'w-6 h-6 bg-green-500 rounded-full inline-block',
    amarillo: 'w-6 h-6 bg-yellow-500 rounded-full inline-block',
    rojo: 'w-6 h-6 bg-red-500 rounded-full inline-block'
  }
  return classes[estado] || 'w-6 h-6 bg-gray-300 rounded-full inline-block'
}

// ========== SECCIÓN B - DATOS SSR ==========

// Disponibilidad de métodos anticonceptivos por municipio
const disponibilidadMAC = computed(() => [
  { nombre: 'La Ceiba', pildora: true, inyeccion: true, implante: true, diu: true, condonM: true, condonF: true, pae: true, estado: 'verde' },
  { nombre: 'Iriona', pildora: true, inyeccion: true, implante: true, diu: false, condonM: true, condonF: false, pae: true, estado: 'amarillo' },
  { nombre: 'Limón', pildora: true, inyeccion: true, implante: false, diu: false, condonM: true, condonF: false, pae: false, estado: 'rojo' },
  { nombre: 'Santa Fe', pildora: true, inyeccion: true, implante: true, diu: true, condonM: true, condonF: true, pae: true, estado: 'verde' },
  { nombre: 'Santa Rosa de Aguán', pildora: true, inyeccion: true, implante: false, diu: false, condonM: true, condonF: false, pae: true, estado: 'amarillo' },
  { nombre: 'José Santos Guardiola', pildora: true, inyeccion: true, implante: true, diu: true, condonM: true, condonF: false, pae: true, estado: 'amarillo' },
  { nombre: 'Puerto Lempira', pildora: true, inyeccion: false, implante: false, diu: false, condonM: true, condonF: false, pae: false, estado: 'rojo' }
])

// Proveedores por estructura SESAL
const proveedoresSESAL = computed(() => [
  { nombre: 'La Ceiba', medicos: 8, enfermeras: 15, auxiliares: 10, otros: 3, total: 36 },
  { nombre: 'Iriona', medicos: 4, enfermeras: 8, auxiliares: 6, otros: 2, total: 20 },
  { nombre: 'Limón', medicos: 2, enfermeras: 5, auxiliares: 4, otros: 1, total: 12 },
  { nombre: 'Santa Fe', medicos: 5, enfermeras: 10, auxiliares: 7, otros: 2, total: 24 },
  { nombre: 'Santa Rosa de Aguán', medicos: 3, enfermeras: 6, auxiliares: 5, otros: 1, total: 15 },
  { nombre: 'José Santos Guardiola', medicos: 6, enfermeras: 12, auxiliares: 8, otros: 2, total: 28 },
  { nombre: 'Puerto Lempira', medicos: 10, enfermeras: 18, auxiliares: 12, otros: 5, total: 45 }
])

// Totales de proveedores SESAL
const totalProveedoresSESAL = computed(() => {
  return proveedoresSESAL.value.reduce((acc, m) => ({
    medicos: acc.medicos + m.medicos,
    enfermeras: acc.enfermeras + m.enfermeras,
    auxiliares: acc.auxiliares + m.auxiliares,
    otros: acc.otros + m.otros,
    total: acc.total + m.total
  }), { medicos: 0, enfermeras: 0, auxiliares: 0, otros: 0, total: 0 })
})

// Resumen SSR
const resumenSSR = computed(() => {
  const verde = disponibilidadMAC.value.filter(m => m.estado === 'verde').length
  const amarillo = disponibilidadMAC.value.filter(m => m.estado === 'amarillo').length
  const rojo = disponibilidadMAC.value.filter(m => m.estado === 'rojo').length
  
  return {
    establecimientosCalidad: 28,
    totalEstablecimientos: 35,
    proveedoresFormados: totalProveedoresSESAL.value.total,
    totalProveedores: 200,
    disponibilidadCompleta: verde,
    verde,
    amarillo,
    rojo
  }
})

// Funciones de estilo para Sección B
const getEstadoClass = (estado) => {
  const classes = {
    verde: 'px-2 py-1 bg-green-100 text-green-800 rounded-full text-xs font-medium',
    amarillo: 'px-2 py-1 bg-yellow-100 text-yellow-800 rounded-full text-xs font-medium',
    rojo: 'px-2 py-1 bg-red-100 text-red-800 rounded-full text-xs font-medium'
  }
  return classes[estado] || classes.rojo
}

const getEstadoLabel = (estado) => {
  const labels = {
    verde: '🟢 Completo',
    amarillo: '🟡 Parcial',
    rojo: '🔴 Crítico'
  }
  return labels[estado] || '🔴 Crítico'
}

// ========== SECCIÓN D - DATOS BARRERAS ==========

// Top 4 barreras reportadas (basado en entrevistas y grupos focales)
const barrerasData = computed(() => [
  {
    id: 1,
    descripcion: 'Falta de disponibilidad de MAC',
    frecuencia: 87
  },
  {
    id: 2,
    descripcion: 'Carga de trabajo del personal',
    frecuencia: 72
  },
  {
    id: 3,
    descripcion: 'Falta de privacidad para la consejería',
    frecuencia: 58
  },
  {
    id: 4,
    descripcion: 'Normas sociales que limitan acceso',
    frecuencia: 45
  }
])

// Estadísticas de barreras
const maxBarreras = computed(() => Math.max(...barrerasData.value.map(b => b.frecuencia)))

// ========== SECCIÓN E - DATOS SEMÁFOROS ==========

// Tabla simple 7×4 con semáforos
const semaforosMunicipales = computed(() => [
  { nombre: 'La Ceiba', mac: 'verde', proveedores: 'amarillo', eis: 'verde', comunidades: 'verde' },
  { nombre: 'Iriona', mac: 'amarillo', proveedores: 'amarillo', eis: 'amarillo', comunidades: 'verde' },
  { nombre: 'Limón', mac: 'rojo', proveedores: 'amarillo', eis: 'rojo', comunidades: 'amarillo' },
  { nombre: 'Santa Fe', mac: 'verde', proveedores: 'verde', eis: 'verde', comunidades: 'amarillo' },
  { nombre: 'Santa Rosa de Aguán', mac: 'amarillo', proveedores: 'rojo', eis: 'amarillo', comunidades: 'verde' },
  { nombre: 'José Santos Guardiola', mac: 'amarillo', proveedores: 'amarillo', eis: 'amarillo', comunidades: 'amarillo' },
  { nombre: 'Puerto Lempira', mac: 'rojo', proveedores: 'amarillo', eis: 'rojo', comunidades: 'rojo' }
])
</script>
