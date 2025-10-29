export const departamentos = [
  { id: 1, nombre: 'Atlántida' },
  { id: 2, nombre: 'Colón' },
  { id: 3, nombre: 'Islas de la Bahía' },
]

export const municipios = [
  { id: 1, nombre: 'La Ceiba', departamentoId: 1 },
  { id: 2, nombre: 'Tela', departamentoId: 1 },
  { id: 3, nombre: 'Trujillo', departamentoId: 2 },
  { id: 4, nombre: 'Iriona', departamentoId: 2 },
  { id: 5, nombre: 'Roatán', departamentoId: 3 },
  { id: 6, nombre: 'Guanaja', departamentoId: 3 },
  { id: 7, nombre: 'Utila', departamentoId: 3 },
]

export const establecimientos = [
  { id: 1, nombre: 'Hospital General La Ceiba', tipo: 'salud', municipioId: 1 },
  { id: 2, nombre: 'Centro de Salud Tela', tipo: 'salud', municipioId: 2 },
  { id: 3, nombre: 'Escuela Primaria Central', tipo: 'educativo', municipioId: 1 },
  { id: 4, nombre: 'Instituto Técnico', tipo: 'educativo', municipioId: 2 },
  { id: 5, nombre: 'Asociación Padres de Familia', tipo: 'asociacion', municipioId: 1 },
]

export const estandaresCalidad = [
  {
    id: 1,
    establecimientoId: 1,
    eje: 'Infraestructura',
    indicador: '¿Cuenta con sala de espera adecuada?',
    cumple: true
  },
  {
    id: 2,
    establecimientoId: 1,
    eje: 'Infraestructura',
    indicador: '¿Tiene consultorio privado?',
    cumple: true
  },
  {
    id: 3,
    establecimientoId: 1,
    eje: 'Personal',
    indicador: '¿Personal capacitado en salud reproductiva?',
    cumple: false
  },
  {
    id: 4,
    establecimientoId: 2,
    eje: 'Infraestructura',
    indicador: '¿Cuenta con sala de espera adecuada?',
    cumple: true
  },
]

export const planesAccion = [
  {
    id: 1,
    establecimientoId: 1,
    tipoActividad: 'Actividades de promoción',
    fecha: '2025-01-15',
    mujeres: 45,
    hombres: 23,
    rangoEdad: '15-25'
  },
  {
    id: 2,
    establecimientoId: 3,
    tipoActividad: 'Acciones de capacitación',
    fecha: '2025-02-10',
    mujeres: 30,
    hombres: 28,
    rangoEdad: '12-18'
  },
  {
    id: 3,
    establecimientoId: 1,
    tipoActividad: 'Ferias',
    fecha: '2025-03-05',
    mujeres: 120,
    hombres: 85,
    rangoEdad: '18-35'
  },
  {
    id: 4,
    establecimientoId: 5,
    tipoActividad: 'Reuniones de seguimiento',
    fecha: '2025-01-20',
    mujeres: 15,
    hombres: 12,
    rangoEdad: '25-45'
  },
]

export const provisionAnticonceptivos = [
  {
    id: 1,
    establecimientoId: 1,
    tipo: 'PAE',
    entran: 500,
    salen: 320,
    disponibles: 180,
    mes: '2025-01'
  },
  {
    id: 2,
    establecimientoId: 1,
    tipo: 'Condones Masculinos',
    entran: 2000,
    salen: 1450,
    disponibles: 550,
    mes: '2025-01'
  },
  {
    id: 3,
    establecimientoId: 1,
    tipo: 'Condones Femeninos',
    entran: 300,
    salen: 180,
    disponibles: 120,
    mes: '2025-01'
  },
  {
    id: 4,
    establecimientoId: 1,
    tipo: 'DIUs',
    entran: 100,
    salen: 45,
    disponibles: 55,
    mes: '2025-01'
  },
  {
    id: 5,
    establecimientoId: 3,
    tipo: 'PAE',
    entran: 200,
    salen: 150,
    disponibles: 50,
    mes: '2025-01'
  },
]
