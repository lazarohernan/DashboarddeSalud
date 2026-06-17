<template>
  <div class="rounded-xl border border-gray-200 bg-white p-5 shadow-sm">

    <!-- Encabezado -->
    <div class="flex flex-wrap items-center gap-4">
      <div class="flex items-center gap-3 min-w-0 flex-1">
        <div class="flex items-center justify-center w-9 h-9 rounded-lg bg-slate-100 shrink-0">
          <FileSpreadsheet class="w-4 h-4 text-slate-600" />
        </div>
        <div class="min-w-0">
          <p class="text-sm font-medium text-gray-900">{{ titulo }}</p>
          <p class="text-xs text-gray-500 mt-0.5">
            Archivo <span class="text-gray-700">.xlsx</span> o <span class="text-gray-700">.csv</span>
          </p>
        </div>
      </div>

      <div class="flex items-center gap-2 shrink-0">
        <button
          type="button"
          @click="descargarPlantilla"
          class="inline-flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium text-gray-600 bg-gray-50 border border-gray-200 rounded-lg hover:bg-gray-100 hover:text-gray-800 transition-colors"
        >
          <Download class="w-3.5 h-3.5" />
          Plantilla
        </button>

        <label
          :class="[
            'inline-flex items-center gap-1.5 px-3 py-1.5 text-xs font-medium text-white rounded-lg transition-colors',
            importando ? 'bg-slate-400 cursor-not-allowed' : 'bg-slate-700 hover:bg-slate-800 cursor-pointer'
          ]"
        >
          <Upload class="w-3.5 h-3.5" />
          Subir archivo
          <input
            type="file"
            accept=".xlsx,.xls,.csv"
            class="hidden"
            ref="fileInput"
            :disabled="importando"
            @change="procesarArchivo"
          />
        </label>
      </div>
    </div>

    <!-- Columnas esperadas -->
    <div class="mt-4 pt-4 border-t border-gray-100">
      <p class="text-[11px] font-medium uppercase tracking-wide text-gray-400 mb-2">Columnas esperadas</p>
      <div class="flex flex-wrap gap-1.5">
        <span
          v-for="col in columnas"
          :key="col.campo"
          :class="[
            'text-xs px-2.5 py-1 rounded-md',
            col.requerido
              ? 'bg-slate-100 text-slate-700 font-medium'
              : 'bg-gray-50 text-gray-500 border border-gray-100'
          ]"
        >
          {{ col.etiqueta }}<span v-if="col.requerido" class="text-slate-400 ml-0.5">*</span>
        </span>
      </div>
    </div>

    <!-- Advertencia de columnas faltantes -->
    <div
      v-if="columnasFaltantes.length"
      class="mt-4 pt-4 border-t border-gray-100 flex items-start gap-3"
    >
      <div class="flex items-center justify-center w-8 h-8 rounded-lg bg-amber-50 shrink-0">
        <AlertTriangle class="w-4 h-4 text-amber-500" />
      </div>
      <div>
        <p class="text-sm font-medium text-gray-900">Columnas requeridas no encontradas</p>
        <p class="text-xs text-gray-500 mt-0.5">
          El archivo no tiene datos en:
          <strong class="text-gray-700">{{ columnasFaltantes.join(', ') }}</strong>.
          Descarga la plantilla para ver el formato correcto.
        </p>
      </div>
    </div>

    <!-- Preview y validación -->
    <div v-if="filasValidas.length || filasInvalidas.length" class="mt-4 pt-4 border-t border-gray-100 space-y-3">

      <!-- Resumen de validación -->
      <div class="flex flex-wrap items-center gap-4">
        <div class="flex items-center gap-1.5 text-xs text-gray-700">
          <CheckCircle class="w-3.5 h-3.5 text-emerald-500" />
          <strong>{{ filasValidas.length }}</strong> filas válidas
        </div>
        <div v-if="filasInvalidas.length" class="flex items-center gap-1.5 text-xs text-gray-500">
          <AlertCircle class="w-3.5 h-3.5 text-amber-500" />
          <strong>{{ filasInvalidas.length }}</strong> filas con problemas
          <button
            type="button"
            class="text-slate-600 underline underline-offset-2 hover:text-slate-800 ml-1"
            @click="mostrarInvalidas = !mostrarInvalidas"
          >{{ mostrarInvalidas ? 'Ocultar' : 'Ver detalle' }}</button>
        </div>
        <button
          type="button"
          @click="cancelar"
          :disabled="importando"
          class="text-xs text-gray-400 hover:text-gray-600 transition-colors ml-auto disabled:opacity-40"
        >
          Cancelar
        </button>
      </div>

      <!-- Detalle de filas inválidas -->
      <div v-if="mostrarInvalidas && filasInvalidas.length" class="rounded-lg border border-amber-100 bg-amber-50/40 overflow-x-auto max-h-40">
        <table class="text-xs w-full">
          <thead>
            <tr class="border-b border-amber-100">
              <th class="px-3 py-2 text-left text-gray-500 font-medium w-14">Fila</th>
              <th class="px-3 py-2 text-left text-gray-500 font-medium">Problema</th>
              <th class="px-3 py-2 text-left text-gray-500 font-medium">Valores</th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="(item, i) in filasInvalidas"
              :key="i"
              class="border-t border-amber-100/50"
            >
              <td class="px-3 py-1.5 text-gray-400">{{ item.numero }}</td>
              <td class="px-3 py-1.5 text-amber-700 font-medium whitespace-nowrap">{{ item.error }}</td>
              <td class="px-3 py-1.5 text-gray-500 text-[11px] max-w-xs truncate">
                {{ resumenFila(item.row) }}
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- Vista previa de válidas (máx 5) -->
      <div v-if="filasValidas.length" class="overflow-x-auto rounded-lg border border-gray-100 max-h-36">
        <table class="text-xs w-full">
          <thead class="bg-gray-50 sticky top-0">
            <tr>
              <th
                v-for="col in columnas"
                :key="col.campo"
                class="px-3 py-2 text-left text-gray-500 font-medium whitespace-nowrap"
              >
                {{ col.campo }}
              </th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-50">
            <tr v-for="(row, i) in filasValidas.slice(0, 5)" :key="i" class="hover:bg-gray-50/50">
              <td
                v-for="col in columnas"
                :key="col.campo"
                class="px-3 py-1.5 text-gray-700 whitespace-nowrap max-w-xs truncate"
              >
                {{ row[col.campo] ?? '—' }}
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <p v-if="filasValidas.length > 5" class="text-[11px] text-gray-400">
        y {{ filasValidas.length - 5 }} filas más
      </p>

      <!-- Botón importar -->
      <button
        v-if="filasValidas.length"
        type="button"
        @click="confirmarImportacion"
        :disabled="importando"
        class="w-full inline-flex items-center justify-center gap-2 px-4 py-2 text-sm font-medium text-white bg-slate-700 rounded-lg hover:bg-slate-800 disabled:opacity-60 disabled:cursor-not-allowed transition-colors"
      >
        <span
          v-if="importando"
          class="inline-block w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin"
        />
        <Upload v-else class="w-4 h-4" />
        {{ importando ? 'Importando...' : `Importar ${filasValidas.length} registros` }}
      </button>

      <!-- Sin filas válidas -->
      <p v-else class="text-xs text-gray-500 text-center py-2">
        Ninguna fila es válida. Revisa el archivo o descarga la plantilla.
      </p>
    </div>

    <!-- Resultado de importación (éxito o error) -->
    <div
      v-if="resultadoImport"
      class="mt-4 pt-4 border-t border-gray-100 flex items-start gap-3"
    >
      <div
        :class="[
          'flex items-center justify-center w-8 h-8 rounded-lg shrink-0 mt-0.5',
          resultadoImport.ok ? 'bg-emerald-50' : 'bg-red-50'
        ]"
      >
        <Check v-if="resultadoImport.ok" class="w-4 h-4 text-emerald-600" />
        <AlertCircle v-else class="w-4 h-4 text-red-500" />
      </div>
      <div class="flex-1 min-w-0">
        <p class="text-sm font-medium text-gray-900">
          {{ resultadoImport.ok ? 'Importación exitosa' : 'Error en la importación' }}
        </p>
        <p class="text-xs text-gray-500 mt-0.5">
          {{ resultadoImport.ok
            ? `${resultadoImport.total} registros procesados correctamente.`
            : resultadoImport.error }}
        </p>
        <p v-if="resultadoImport.omitidas" class="text-xs text-amber-600 mt-0.5">
          {{ resultadoImport.omitidas }} filas omitidas por datos inválidos.
        </p>
      </div>
      <button
        type="button"
        class="text-gray-400 hover:text-gray-600 shrink-0"
        @click="$emit('limpiar-resultado')"
      >
        <X class="w-4 h-4" />
      </button>
    </div>

    <!-- Error de lectura del archivo -->
    <div
      v-if="errorArchivo"
      class="mt-4 pt-4 border-t border-gray-100 flex items-start gap-3"
    >
      <div class="flex items-center justify-center w-8 h-8 rounded-lg bg-red-50 shrink-0 mt-0.5">
        <AlertCircle class="w-4 h-4 text-red-500" />
      </div>
      <div class="flex-1">
        <p class="text-sm font-medium text-gray-900">Error al leer el archivo</p>
        <p class="text-xs text-gray-500 mt-0.5">{{ errorArchivo }}</p>
      </div>
      <button type="button" class="text-gray-400 hover:text-gray-600 shrink-0" @click="errorArchivo = ''">
        <X class="w-4 h-4" />
      </button>
    </div>

  </div>
</template>

<script setup>
import { ref, computed, watch } from 'vue'
import {
  FileSpreadsheet, Upload, Download,
  CheckCircle, Check, AlertCircle, AlertTriangle, X
} from 'lucide-vue-next'
import * as XLSX from 'xlsx'

const props = defineProps({
  titulo:          { type: String,   default: 'Importar desde Excel' },
  columnas:        { type: Array,    default: () => [] },
  importando:      { type: Boolean,  default: false },
  resultadoImport: { type: Object,   default: null },
  // (row) => string|null — retorna mensaje de error o null si es válida
  validarFila:     { type: Function, default: null },
  // Array de objetos con valores de ejemplo para la fila de muestra en la plantilla
  ejemploPlantilla:{ type: Object,   default: null }
})

const emit = defineEmits(['datos-parseados', 'limpiar-resultado'])

const fileInput      = ref(null)
const rawPreview     = ref([])          // todas las filas del archivo
const errorArchivo   = ref('')
const mostrarInvalidas = ref(false)

// ── Validación por fila ───────────────────────────────────────────────────────

const filasConEstado = computed(() => {
  if (!rawPreview.value.length) return []
  return rawPreview.value.map((row, idx) => ({
    numero: idx + 2,    // +2: fila 1 = encabezados, +1 para base-1
    row,
    error: props.validarFila ? props.validarFila(row) : null
  }))
})

const filasValidas   = computed(() => filasConEstado.value.filter(f => !f.error).map(f => f.row))
const filasInvalidas = computed(() => filasConEstado.value.filter(f =>  f.error))

// Columnas requeridas que no tienen ningún dato en el archivo
const columnasFaltantes = computed(() => {
  if (!rawPreview.value.length) return []
  return props.columnas
    .filter(c => c.requerido)
    .filter(c => !rawPreview.value.some(row => row[c.campo] !== '' && row[c.campo] != null))
    .map(c => c.etiqueta)
})

// Limpiar preview cuando llega resultado
watch(() => props.resultadoImport, (val) => {
  if (val?.ok) {
    rawPreview.value = []
    mostrarInvalidas.value = false
  }
})

// ── Procesamiento del archivo ─────────────────────────────────────────────────

function procesarArchivo(e) {
  errorArchivo.value = ''
  rawPreview.value   = []
  mostrarInvalidas.value = false
  const archivo = e.target.files[0]
  if (!archivo) return

  // Límite de 5 MB
  if (archivo.size > 5 * 1024 * 1024) {
    errorArchivo.value = 'El archivo supera 5 MB. Divide los datos en archivos más pequeños.'
    return
  }

  const reader = new FileReader()
  reader.onload = (ev) => {
    try {
      // cellDates:true → las fechas de Excel se convierten a objetos Date en lugar de seriales
      const workbook = XLSX.read(ev.target.result, { type: 'binary', cellDates: true })
      const hoja = workbook.Sheets[workbook.SheetNames[0]]
      const filas = XLSX.utils.sheet_to_json(hoja, { defval: '' })

      if (!filas.length) {
        errorArchivo.value = 'El archivo está vacío o no tiene el formato correcto.'
        return
      }

      // Mapeo flexible: acepta etiqueta o campo como nombre de columna
      const mapaColumnas = {}
      for (const col of props.columnas) {
        mapaColumnas[col.etiqueta.toLowerCase().trim()] = col.campo
        mapaColumnas[col.campo.toLowerCase().trim()]    = col.campo
      }

      rawPreview.value = filas
        .map(row => {
          const normalizada = {}
          for (const [k, v] of Object.entries(row)) {
            const clave = k.toLowerCase().trim()
            // Formatear objetos Date a string YYYY-MM-DD
            const valor = v instanceof Date
              ? v.toISOString().slice(0, 10)
              : v
            normalizada[mapaColumnas[clave] ?? clave] = valor
          }
          return normalizada
        })
        // Filtrar filas completamente vacías (Excel suele añadir filas en blanco al final)
        .filter(row => Object.values(row).some(v => v !== '' && v != null))
    } catch (err) {
      errorArchivo.value = 'No se pudo leer el archivo: ' + err.message
    }
  }
  reader.readAsBinaryString(archivo)
  if (fileInput.value) fileInput.value.value = ''
}

function confirmarImportacion() {
  emit('datos-parseados', filasValidas.value)
}

function cancelar() {
  rawPreview.value   = []
  errorArchivo.value = ''
  mostrarInvalidas.value = false
}

function descargarPlantilla() {
  const encabezados = props.columnas.map(c => c.etiqueta)
  const filas = [encabezados]

  // Añadir fila de ejemplo si se proporcionó
  if (props.ejemploPlantilla) {
    const filaEjemplo = props.columnas.map(c => props.ejemploPlantilla[c.campo] ?? '')
    filas.push(filaEjemplo)
  }

  const ws = XLSX.utils.aoa_to_sheet(filas)
  // Resaltar encabezados en negrita (estilo básico)
  const rango = XLSX.utils.decode_range(ws['!ref'])
  for (let col = rango.s.c; col <= rango.e.c; col++) {
    const celda = XLSX.utils.encode_cell({ r: 0, c: col })
    if (ws[celda]) ws[celda].s = { font: { bold: true } }
  }

  const wb = XLSX.utils.book_new()
  XLSX.utils.book_append_sheet(wb, ws, 'Datos')
  XLSX.writeFile(wb, 'plantilla.xlsx')
}

// Resumen corto de una fila para la tabla de inválidas
function resumenFila(row) {
  return Object.entries(row)
    .filter(([, v]) => v !== '' && v != null)
    .slice(0, 3)
    .map(([k, v]) => `${k}: ${v}`)
    .join(' | ')
}
</script>
