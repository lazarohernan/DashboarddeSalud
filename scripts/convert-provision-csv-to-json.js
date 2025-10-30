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
const csvPath = path.join(__dirname, '../../Dashboard MEMI/Provisión de Métodos-Tabla 1.csv');
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
      codMetodo: values[6] || '',
      metodo: values[7] || '',
      transaccion: values[8] || '',
      cantidad: parseInt(values[9]) || 0,
      fecha: values[10] || ''
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
  metodos: [...new Set(datos.map(d => d.metodo).filter(d => d))],
  transacciones: [...new Set(datos.map(d => d.transaccion).filter(d => d))],
  totalCantidad: datos.reduce((sum, d) => sum + d.cantidad, 0)
};

// Crear objeto final
const resultado = {
  metadata: {
    nombre: "Provisión de Métodos Anticonceptivos - Proyecto MEMI",
    descripcion: "Seguimiento de inventario de métodos anticonceptivos en establecimientos de salud",
    fuente: "Dashboard MEMI/Provisión de Métodos-Tabla 1.csv",
    fechaGeneracion: new Date().toISOString(),
    estadisticas: estadisticas
  },
  datos: datos
};

// Guardar archivo JSON
const outputPath = path.join(__dirname, '../src/data/provisionAnticonceptivos.json');
fs.writeFileSync(outputPath, JSON.stringify(resultado, null, 2));

console.log('✅ Archivo convertido exitosamente!');
console.log('📊 Estadísticas:', estadisticas);
console.log('📁 Guardado en:', outputPath);
