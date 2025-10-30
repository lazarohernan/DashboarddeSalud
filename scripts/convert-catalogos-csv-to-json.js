import fs from 'fs'
import path from 'path'
import { fileURLToPath } from 'url'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

function parseCSVLine(line) {
  const result = []
  let current = ''
  let inQuotes = false
  
  for (let i = 0; i < line.length; i++) {
    const char = line[i]
    
    if (char === '"') {
      inQuotes = !inQuotes
    } else if (char === ',' && !inQuotes) {
      result.push(current.trim())
      current = ''
    } else {
      current += char
    }
  }
  result.push(current.trim())
  
  return result
}

const csvPath = path.join(__dirname, '../../Dashboard MEMI/Catálogos-Tabla 1.csv')
const csvContent = fs.readFileSync(csvPath, 'utf-8')
const lines = csvContent.split('\n')

const headers = parseCSVLine(lines[0])

const catalogos = {
  metadata: {
    nombre: "Catálogos - Proyecto MEMI",
    descripcion: "Catálogos maestros de departamentos, municipios, métodos y tipos de establecimiento",
    fuente: "Dashboard MEMI/Catálogos-Tabla 1.csv",
    fechaGeneracion: new Date().toISOString()
  },
  departamentos: [],
  municipios: [],
  metodos: [],
  tiposEstablecimiento: [],
  relaciones: []
}

const departamentosMap = new Map()
const municipiosSet = new Set()
const metodosSet = new Set()
const tiposEstablecimientoSet = new Set()

// Procesar las filas de datos
let ultimoDepartamento = ''
for (let i = 1; i < lines.length; i++) {
  const line = lines[i].trim()
  if (!line) continue
  
  const values = parseCSVLine(line)
  
  let departamento = values[0]?.trim() || ''
  const municipio = values[1]?.trim() || ''
  const metodo = values[2]?.trim() || ''
  const tipoEstablecimiento = values[3]?.trim() || ''
  
  // Si no hay departamento pero hay municipio, usar el último departamento conocido
  if (!departamento && municipio && ultimoDepartamento) {
    departamento = ultimoDepartamento
  }
  
  // Actualizar último departamento conocido
  if (departamento) {
    ultimoDepartamento = departamento
  }
  
  // Recopilar departamentos
  if (departamento && !departamentosMap.has(departamento)) {
    departamentosMap.set(departamento, true)
    catalogos.departamentos.push(departamento)
  }
  
  // Recopilar municipios con relación a departamento
  if (municipio && !municipiosSet.has(municipio)) {
    municipiosSet.add(municipio)
    // Si el departamento es null pero hay uno anterior, usar el anterior
    const deptFinal = departamento || ultimoDepartamento || null
    catalogos.municipios.push({
      nombre: municipio,
      departamento: deptFinal
    })
  }
  
  // Recopilar métodos
  if (metodo && !metodosSet.has(metodo)) {
    metodosSet.add(metodo)
    catalogos.metodos.push(metodo)
  }
  
  // Recopilar tipos de establecimiento
  if (tipoEstablecimiento && !tiposEstablecimientoSet.has(tipoEstablecimiento)) {
    tiposEstablecimientoSet.add(tipoEstablecimiento)
    catalogos.tiposEstablecimiento.push(tipoEstablecimiento)
  }
  
  // Guardar relación si hay datos
  if (departamento || municipio || metodo || tipoEstablecimiento) {
    catalogos.relaciones.push({
      departamento: departamento || null,
      municipio: municipio || null,
      metodo: metodo || null,
      tipoEstablecimiento: tipoEstablecimiento || null
    })
  }
}

// Ordenar alfabéticamente
catalogos.departamentos.sort()
catalogos.municipios.sort((a, b) => a.nombre.localeCompare(b.nombre))
catalogos.metodos.sort()
catalogos.tiposEstablecimiento.sort()

// Estadísticas
const estadisticas = {
  totalDepartamentos: catalogos.departamentos.length,
  totalMunicipios: catalogos.municipios.length,
  totalMetodos: catalogos.metodos.length,
  totalTiposEstablecimiento: catalogos.tiposEstablecimiento.length,
  totalRelaciones: catalogos.relaciones.length
}

catalogos.estadisticas = estadisticas

// Guardar JSON
const outputPath = path.join(__dirname, '../src/data/catalogos.json')
fs.writeFileSync(outputPath, JSON.stringify(catalogos, null, 2), 'utf-8')

console.log('✅ Catálogos convertidos exitosamente')
console.log('📊 Estadísticas:')
console.log(`   - Departamentos: ${estadisticas.totalDepartamentos}`)
console.log(`   - Municipios: ${estadisticas.totalMunicipios}`)
console.log(`   - Métodos: ${estadisticas.totalMetodos}`)
console.log(`   - Tipos de Establecimiento: ${estadisticas.totalTiposEstablecimiento}`)
console.log(`   - Relaciones: ${estadisticas.totalRelaciones}`)
console.log(`\n📁 Archivo guardado en: ${outputPath}`)

