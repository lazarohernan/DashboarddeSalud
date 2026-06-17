/**
 * Convierte errores de Supabase/PostgreSQL a mensajes legibles para el usuario.
 */
export function parsearError(msg = '') {
  if (!msg) return 'Error desconocido.'

  const fkMatch = msg.match(/Key \((\w+)\)=\(([^)]+)\) is not present/)
  if (fkMatch) {
    return `El ID "${fkMatch[2]}" en el campo "${fkMatch[1]}" no existe en el catálogo. Verifica los IDs.`
  }
  if (msg.includes('duplicate key') || msg.includes('unique constraint')) {
    return 'Algunos registros ya existen con los mismos valores únicos (duplicados).'
  }
  const nullMatch = msg.match(/null value in column "(\w+)"/)
  if (nullMatch) {
    return `El campo "${nullMatch[1]}" no puede estar vacío. Revisa las filas del archivo.`
  }
  if (msg.includes('check constraint')) {
    return 'Un valor no cumple las restricciones de la base de datos (rango o formato incorrecto).'
  }
  if (msg.includes('foreign key constraint') || msg.includes('violates foreign key')) {
    return 'Un ID referenciado no existe en la tabla de catálogo. Verifica los campos de ID.'
  }
  if (msg.includes('Failed to fetch') || msg.includes('NetworkError')) {
    return 'Error de conexión. Verifica tu internet e intenta de nuevo.'
  }
  return msg
}

/**
 * Valida que un valor sea un entero positivo.
 */
export function esEnteroPositivo(val) {
  const n = Number(val)
  return Number.isInteger(n) && n > 0
}

/**
 * Valida que un año sea razonable (2000–2100).
 */
export function esAnioValido(val) {
  const n = Number(val)
  return !isNaN(n) && n >= 2000 && n <= 2100
}

/**
 * Acepta "SI"/"NO" en cualquier variante:
 * si, sí, yes, 1, true, verdadero → true
 * no, 0, false, falso, vacío      → false
 */
export function esSi(val) {
  const s = String(val ?? '').toLowerCase().trim()
  return ['si', 'sí', 'yes', '1', 'true', 'verdadero'].includes(s)
}

/**
 * Convierte un valor de fecha que puede venir de Excel como:
 * - Número serial de Excel (ej. 45383)
 * - Objeto Date (cuando XLSX lee con cellDates:true)
 * - String en formato DD/MM/YYYY, MM/DD/YYYY o YYYY-MM-DD
 * Devuelve string "YYYY-MM-DD" o null si no puede parsear.
 */
export function formatearFechaExcel(val) {
  if (val === '' || val == null) return null

  // Ya es un objeto Date (de cellDates:true)
  if (val instanceof Date) {
    if (isNaN(val.getTime())) return null
    return val.toISOString().slice(0, 10)
  }

  // Número serial de Excel (días desde 1900-01-01, con bug del año bisiesto 1900)
  const n = Number(val)
  if (!isNaN(n) && n > 1000 && n < 100000) {
    // Conversión del serial de Excel
    const fecha = new Date(Math.round((n - 25569) * 86400 * 1000))
    if (!isNaN(fecha.getTime())) return fecha.toISOString().slice(0, 10)
  }

  const s = String(val).trim()

  // Ya está en formato YYYY-MM-DD
  if (/^\d{4}-\d{2}-\d{2}$/.test(s)) return s

  // DD/MM/YYYY → YYYY-MM-DD
  const dmyMatch = s.match(/^(\d{1,2})\/(\d{1,2})\/(\d{4})$/)
  if (dmyMatch) return `${dmyMatch[3]}-${dmyMatch[2].padStart(2,'0')}-${dmyMatch[1].padStart(2,'0')}`

  // MM/DD/YYYY → YYYY-MM-DD (menos común pero Excel en locale US)
  const mdyMatch = s.match(/^(\d{1,2})-(\d{1,2})-(\d{4})$/)
  if (mdyMatch) return `${mdyMatch[3]}-${mdyMatch[1].padStart(2,'0')}-${mdyMatch[2].padStart(2,'0')}`

  return null
}

/**
 * Divide un array en lotes de tamaño dado.
 */
export function enLotes(arr, tamano = 200) {
  const lotes = []
  for (let i = 0; i < arr.length; i += tamano) {
    lotes.push(arr.slice(i, i + tamano))
  }
  return lotes
}
