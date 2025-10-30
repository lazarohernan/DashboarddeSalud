import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Leer el archivo CSV de Estándares
const csvPath = path.join(__dirname, '../../Dashboard MEMI/Estandares-Tabla 1.csv');
const jsonOutputPath = path.join(__dirname, '../src/data/estandares.json');

console.log('Leyendo archivo CSV...');
const csvContent = fs.readFileSync(csvPath, 'utf-8');

// Parsear CSV manualmente (ya que tiene saltos de línea dentro de campos entre comillas)
const lines = csvContent.split('\n');
const headers = lines[0].split(',');

// Función para parsear CSV con manejo de comillas
function parseCSVLine(line) {
  const result = [];
  let current = '';
  let inQuotes = false;
  
  for (let i = 0; i < line.length; i++) {
    const char = line[i];
    
    if (char === '"') {
      inQuotes = !inQuotes;
    } else if (char === ',' && !inQuotes) {
      result.push(current.trim());
      current = '';
    } else {
      current += char;
    }
  }
  result.push(current.trim());
  
  return result;
}

// Normaliza códigos con más de dos decimales (p.ej. 5.19000000000001 → 5.19)
function normalizeCodIndicador(value) {
  const trimmed = (value || '').trim();
  const match = trimmed.match(/^(\d+)\.(\d+)$/);

  if (!match) return trimmed;

  const [, entero, decimales] = match;

  if (decimales.length <= 2) {
    return `${entero}.${decimales}`;
  }

  const ajustado = Number(trimmed).toFixed(2);
  return ajustado.replace(/\.00$/, '.0').replace(/(\.\d*[1-9])0+$/, '$1');
}

// Procesar las filas de datos usando un enfoque mejor para CSV con saltos de línea
const datos = [];
let idCounter = 1;

// Unir todo el contenido y dividir por líneas CSV (considerando comillas)
const csvData = lines.slice(1).join('\n'); // Saltar la cabecera
const csvRows = splitCSVRows(csvData);

for (const row of csvRows) {
  const values = parseCSVLine(row.trim());

  // Verificar que tengamos suficientes columnas
  if (values.length >= 12) {
    // Mapear a objeto
    const dataRow = {
      id: idCounter++,
      nivel: values[0] || '',
      departamento: values[1] || '',
      municipio: values[2] || '',
      comunidad: values[3] || '',
      establecimientoNombre: values[4] || '',
      tipoEstablecimiento: values[5] || '',
      codEje: values[6] || '',
      ejeNombre: values[7] || '',
      codIndicador: normalizeCodIndicador(values[8]),
      indicador: values[9] || '',
      calificacion: parseInt(values[10]) || 0,
      cumple: parseInt(values[10]) === 1,
      fecha: values[11] || ''
    };

    datos.push(dataRow);
  } else if (row.trim()) {
    console.log(`⚠️  Fila ignorada - insuficientes columnas: ${values.length}, contenido: ${row.substring(0, 100)}...`);
  }
}

// Función para dividir el CSV en filas considerando comillas
function splitCSVRows(csvText) {
  const rows = [];
  let currentRow = '';
  let inQuotes = false;

  for (let i = 0; i < csvText.length; i++) {
    const char = csvText[i];
    const nextChar = csvText[i + 1];

    if (char === '"') {
      if (inQuotes && nextChar === '"') {
        // Comilla escapada
        currentRow += '""';
        i++; // Saltar la siguiente comilla
      } else {
        // Comilla normal
        inQuotes = !inQuotes;
        currentRow += char;
      }
    } else if (char === '\n' && !inQuotes) {
      // Fin de fila
      if (currentRow.trim()) {
        rows.push(currentRow);
      }
      currentRow = '';
    } else {
      currentRow += char;
    }
  }

  // Agregar la última fila si existe
  if (currentRow.trim()) {
    rows.push(currentRow);
  }

  return rows;
}

console.log(`Procesadas ${datos.length} filas de datos.`);

// Crear estadísticas
const estadisticas = {
  totalRegistros: datos.length,
  departamentos: [...new Set(datos.map(d => d.departamento).filter(Boolean))].sort(),
  municipios: [...new Set(datos.map(d => d.municipio).filter(Boolean))].sort(),
  comunidades: [...new Set(datos.map(d => d.comunidad).filter(Boolean))].sort(),
  establecimientos: [...new Set(datos.map(d => d.establecimientoNombre).filter(Boolean))].sort(),
  tiposEstablecimiento: [...new Set(datos.map(d => d.tipoEstablecimiento).filter(Boolean))].sort(),
  ejes: [...new Set(datos.map(d => d.codEje).filter(Boolean))].sort(),
  indicadoresCumplen: datos.filter(d => d.cumple).length,
  indicadoresNoCumplen: datos.filter(d => !d.cumple).length
};

// Crear objeto final
const output = {
  metadata: {
    nombre: 'Estándares de Calidad - Proyecto MEMI',
    descripcion: 'Datos de evaluación de estándares de calidad en establecimientos de salud',
    fuente: 'Dashboard MEMI/Estandares-Tabla 1.csv',
    fechaGeneracion: new Date().toISOString(),
    estadisticas: estadisticas
  },
  datos: datos
};

// Guardar JSON
fs.writeFileSync(jsonOutputPath, JSON.stringify(output, null, 2), 'utf-8');
console.log(`✅ JSON generado exitosamente en: ${jsonOutputPath}`);
console.log(`\n📊 Estadísticas:`);
console.log(`   - Total registros: ${estadisticas.totalRegistros}`);
console.log(`   - Departamentos: ${estadisticas.departamentos.length}`);
console.log(`   - Municipios: ${estadisticas.municipios.length}`);
console.log(`   - Comunidades: ${estadisticas.comunidades.length}`);
console.log(`   - Establecimientos: ${estadisticas.establecimientos.length}`);
console.log(`   - Tipos de establecimiento: ${estadisticas.tiposEstablecimiento.join(', ')}`);
console.log(`   - Indicadores que cumplen: ${estadisticas.indicadoresCumplen}`);
console.log(`   - Indicadores que NO cumplen: ${estadisticas.indicadoresNoCumplen}`);
