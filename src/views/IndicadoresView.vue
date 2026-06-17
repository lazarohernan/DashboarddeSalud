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

      <div class="bg-white border border-gray-200 rounded-lg p-6 mt-6">
        <div class="flex flex-wrap items-center justify-between gap-3 mb-4">
          <h3 class="text-base font-semibold text-gray-800">Indicadores LNOB por Output</h3>
          <div class="flex flex-wrap gap-2">
            <button
              v-for="ano in anosKpi"
              :key="ano"
              @click="anoKpiSeleccionado = ano"
              :class="[
                'px-3 py-1 text-xs font-medium rounded-full border transition-colors',
                anoKpiSeleccionado === ano
                  ? 'bg-orange-500 text-white border-orange-500'
                  : 'bg-white text-orange-600 border-orange-300 hover:bg-orange-50'
              ]"
            >
              {{ ano }}
            </button>
          </div>
        </div>

        <div class="flex flex-wrap gap-2 mb-4">
          <button
            v-for="(bloque, codOutput) in indicadoresKpi"
            :key="codOutput"
            @click="outputKpiSeleccionado = codOutput"
            :class="[
              'px-3 py-1.5 text-xs font-medium rounded-lg border transition-colors',
              outputKpiSeleccionado === codOutput
                ? 'bg-slate-700 text-orange-400 border-slate-700'
                : 'bg-white text-gray-700 border-gray-300 hover:border-orange-400'
            ]"
          >
            Output {{ codOutput }}
          </button>
        </div>

        <p v-if="bloqueKpiSeleccionado" class="text-xs text-gray-600 mb-4 leading-relaxed">
          {{ bloqueKpiSeleccionado.nombre }}
        </p>

        <div v-if="bloqueKpiSeleccionado" class="overflow-x-auto">
          <table class="w-full text-sm">
            <thead>
              <tr class="border-b-2 border-gray-300">
                <th class="text-left py-2 px-3 font-semibold text-gray-700">Código</th>
                <th class="text-left py-2 px-3 font-semibold text-gray-700">Indicador</th>
                <th class="text-center py-2 px-3 font-semibold text-gray-700">{{ anoKpiSeleccionado }}</th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="ind in bloqueKpiSeleccionado.indicadores"
                :key="ind.codigo"
                class="border-b border-gray-200 hover:bg-gray-50"
              >
                <td class="py-2 px-3 font-mono text-orange-600">{{ ind.codigo }}</td>
                <td class="py-2 px-3 text-gray-700">{{ ind.nombre }}</td>
                <td class="py-2 px-3 text-center font-semibold text-gray-900">
                  {{ formatearValorKpi(ind.años?.[anoKpiSeleccionado] ?? ind.años?.[String(anoKpiSeleccionado)]) }}
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <p v-else class="text-sm text-gray-500">No hay indicadores KPI cargados.</p>
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
              <span class="text-sm text-gray-500">{{ municipio.consumo }} unidades consumidas</span>
            </div>
            <div class="w-full bg-gray-100 rounded-full h-6 relative overflow-hidden">
              <div 
                class="h-6 rounded-full bg-gradient-to-r from-orange-400 to-orange-600 transition-all duration-700 flex items-center justify-end pr-2"
                :style="{ width: (municipio.consumo / maxConsumoMunicipio * 100) + '%' }"
              >
                <span v-if="municipio.consumo > 50" class="text-xs text-white font-medium">
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
import { computed, ref, watch } from 'vue'
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
import {
  construirTarjetasKpi,
  derivarDisponibilidadMAC,
  derivarResumenEstandares,
  derivarSemaforosMunicipales
} from '../utils/derivarIndicadores'

const props = defineProps({
  departamentoSeleccionado: {
    type: String,
    default: ''
  },
  municipioSeleccionado: {
    type: String,
    default: ''
  },
  indicadoresKpi: {
    type: Object,
    default: () => ({})
  },
  provision: {
    type: Array,
    default: () => []
  },
  estandares: {
    type: Array,
    default: () => []
  }
})

const pestañaActiva = ref('kpis')
const anoKpiSeleccionado = ref(2025)
const outputKpiSeleccionado = ref('1')
const anosKpi = [2023, 2024, 2025, 2026, 2027]

watch(
  () => props.indicadoresKpi,
  (kpi) => {
    const primero = Object.keys(kpi ?? {})[0]
    if (primero) outputKpiSeleccionado.value = primero
  },
  { immediate: true }
)

const provisionFiltrada = computed(() => {
  let datos = props.provision ?? []
  if (props.municipioSeleccionado) {
    datos = datos.filter((d) => d.municipio === props.municipioSeleccionado)
  }
  return datos
})

const estandaresFiltrados = computed(() => {
  let datos = props.estandares ?? []
  if (props.municipioSeleccionado) {
    datos = datos.filter((d) => d.municipio === props.municipioSeleccionado)
  }
  return datos
})

const indicadores = computed(() => construirTarjetasKpi(props.indicadoresKpi, anoKpiSeleccionado.value))

const bloqueKpiSeleccionado = computed(() => props.indicadoresKpi?.[outputKpiSeleccionado.value] ?? null)

const formatearValorKpi = (valor) => {
  if (valor == null || valor === '') return '—'
  return valor
}

const datosPorMunicipio = computed(() => {
  const totales = new Map()
  for (const row of provisionFiltrada.value) {
    if (!row.municipio) continue
    const actual = totales.get(row.municipio) ?? 0
    totales.set(row.municipio, actual + (Number(row.consumo) || 0))
  }

  const max = Math.max(...[...totales.values(), 1])
  return [...totales.entries()]
    .map(([nombre, consumo]) => ({
      nombre,
      consumo: Math.round(consumo),
      porcentaje: Math.round((consumo / max) * 100)
    }))
    .sort((a, b) => b.consumo - a.consumo)
})

const maxConsumoMunicipio = computed(() =>
  Math.max(...datosPorMunicipio.value.map((m) => m.consumo), 1)
)

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

const disponibilidadMAC = computed(() => derivarDisponibilidadMAC(provisionFiltrada.value))

const proveedoresSESAL = computed(() => [])

const totalProveedoresSESAL = computed(() => ({
  medicos: 0,
  enfermeras: 0,
  auxiliares: 0,
  otros: 0,
  total: 0
}))

const resumenSSR = computed(() => {
  const estandaresResumen = derivarResumenEstandares(estandaresFiltrados.value)
  const verde = disponibilidadMAC.value.filter((m) => m.estado === 'verde').length
  const amarillo = disponibilidadMAC.value.filter((m) => m.estado === 'amarillo').length
  const rojo = disponibilidadMAC.value.filter((m) => m.estado === 'rojo').length
  const proveedoresReal = indicadores.value.proveedores.real.total

  return {
    establecimientosCalidad: estandaresResumen.establecimientosCalidad,
    totalEstablecimientos: estandaresResumen.totalEstablecimientos,
    proveedoresFormados: proveedoresReal,
    totalProveedores: indicadores.value.proveedores.meta.total,
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

const semaforosMunicipales = computed(() =>
  derivarSemaforosMunicipales(disponibilidadMAC.value, props.indicadoresKpi)
)
</script>
