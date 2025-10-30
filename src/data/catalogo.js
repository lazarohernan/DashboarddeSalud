// Catálogos Maestros - Datos del archivo Catálogos-Tabla 1.csv
// Valores oficiales del proyecto MEMI

export const departamentos = [
  { id: 1, nombre: 'Atlántida' },
  { id: 2, nombre: 'Colón' },
  { id: 3, nombre: 'Gracias a Dios' },
  { id: 4, nombre: 'Islas de la Bahía' }
]

export const municipios = [
  { id: 1, nombre: 'La Ceiba', departamentoId: 1 },
  { id: 2, nombre: 'Iriona', departamentoId: 2 },
  { id: 3, nombre: 'Santa Fe', departamentoId: 3 },
  { id: 4, nombre: 'Limón', departamentoId: 4 },
  { id: 5, nombre: 'Santa Rosa de Aguán', departamentoId: 2 },
  { id: 6, nombre: 'Wampusirpi', departamentoId: 3 },
  { id: 7, nombre: 'José Santos Guardiola', departamentoId: 4 }
]

export const comunidades = [
  { id: 1, nombre: 'Cusuna', municipioId: 2, departamentoId: 2 },
  { id: 2, nombre: 'Sangrelaya', municipioId: 2, departamentoId: 2 }
]

export const establecimientos = [
  { id: 1, nombre: 'Centro de Salud Cusuna', tipo: 'UAPS', comunidadId: 1, municipioId: 2, departamentoId: 2 },
  { id: 2, nombre: 'Centro de Salud Sangrelaya', tipo: 'CIS', comunidadId: 2, municipioId: 2, departamentoId: 2 }
]

export const tiposEstablecimiento = [
  'CIS',
  'UAPS'
]

export const metodosAnticonceptivos = [
  { id: 1, nombre: 'Píldora combinada' },
  { id: 2, nombre: 'Inyección mensual' },
  { id: 3, nombre: ' Inyección trimestral' },
  { id: 4, nombre: 'Implante' },
  { id: 5, nombre: 'DIU TCU 380 A' },
  { id: 6, nombre: 'Condón Masculino' },
  { id: 7, nombre: 'Condón Femenino' },
  { id: 8, nombre: 'PAE (Levonorgestrel)' },
  { id: 9, nombre: 'Otros' }
]

export const ejesCalidad = [
  { 
    id: 1, 
    codigo: '1',
    nombre: 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los servicios de salud.'
  },
  { 
    id: 2, 
    codigo: '2',
    nombre: 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.'
  },
  { 
    id: 3, 
    codigo: '3',
    nombre: 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.'
  },
  { 
    id: 4, 
    codigo: '4',
    nombre: 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.'
  },
  { 
    id: 5, 
    codigo: '5',
    nombre: 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.'
  },
  { 
    id: 6, 
    codigo: '6',
    nombre: 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.'
  },
  { 
    id: 7, 
    codigo: '7',
    nombre: 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.'
  },
  { 
    id: 8, 
    codigo: '8',
    nombre: 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.'
  }
]
