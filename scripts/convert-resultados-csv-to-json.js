const fs = require('fs');
const path = require('path');

// Función para parsear línea CSV considerando comillas
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

// Leer el archivo CSV
const csvPath = path.join(__dirname, '../../Dashboard MEMI/Resultados-Tabla 1.csv');
const csvContent = fs.readFileSync(csvPath, 'utf-8');

// Dividir en líneas y filtrar líneas vacías
const lines = csvContent.split('\n').filter(line => line.trim() !== '');

// Parsear datos
const headers = parseCSVLine(lines[0]);
const datos = [];
let idCounter = 1;

console.log('Headers encontrados:', headers);
console.log('Número de líneas de datos:', lines.length - 1);

for (let i = 1; i < lines.length; i++) {
  const values = parseCSVLine(lines[i]);

  if (values.length >= headers.length) {
    const row = {
      id: idCounter++,
      nivel: values[0] || '',
      departamento: values[1] || '',
      municipio: values[2] || '',
      comunidad: values[3] || '',
      establecimientoNombre: values[4] || '',
      tipoEstablecimiento: values[5] || '',
      codOutput: values[6] || '',
      output: values[7] || '',
      codActividad: values[8] || '',
      actividad: values[9] || '',
      estado: values[10] || '',
      porcentajeAvance: parseInt(values[11]) || 0,
      fechaInicio: values[12] || '',
      fechaFin: values[13] || ''
    };

    datos.push(row);
  } else {
    console.log(`Línea ${i + 1} tiene ${values.length} valores, esperado ${headers.length}:`, values);
  }
}

// Calcular estadísticas
const estadisticas = {
  totalRegistros: datos.length,
  departamentos: [...new Set(datos.map(d => d.departamento).filter(d => d))],
  municipios: [...new Set(datos.map(d => d.municipio).filter(d => d))],
  comunidades: [...new Set(datos.map(d => d.comunidad).filter(d => d))],
  establecimientos: [...new Set(datos.map(d => d.establecimientoNombre).filter(d => d))],
  tiposEstablecimiento: [...new Set(datos.map(d => d.tipoEstablecimiento).filter(d => d))],
  outputs: [...new Set(datos.map(d => d.output).filter(d => d))],
  actividades: [...new Set(datos.map(d => d.codActividad).filter(d => d))],
  estados: [...new Set(datos.map(d => d.estado).filter(d => d))],
  actividadesCompletadas: datos.filter(d => d.estado === 'Completado').length,
  actividadesPendientes: datos.filter(d => d.estado === 'Pendiente').length,
  actividadesEnProceso: datos.filter(d => d.estado === 'En Proceso').length,
  porcentajePromedioAvance: Math.round(datos.reduce((sum, d) => sum + d.porcentajeAvance, 0) / datos.length)
};

// Crear objeto final
const resultado = {
  metadata: {
    nombre: "Resultados y Avances - Proyecto MEMI",
    descripcion: "Seguimiento de actividades y resultados del proyecto MEMI",
    fuente: "Dashboard MEMI/Resultados-Tabla 1.csv",
    fechaGeneracion: new Date().toISOString(),
    estadisticas: estadisticas
  },
  datos: datos
};

// Guardar archivo JSON
const outputPath = path.join(__dirname, '../src/data/resultados.json');
fs.writeFileSync(outputPath, JSON.stringify(resultado, null, 2));

console.log('✅ Archivo convertido exitosamente!');
console.log('📊 Estadísticas:', estadisticas);
console.log('📁 Guardado en:', outputPath);
