const METODOS_MAC = {
  pildora: (nombre) => /oral|orales/i.test(nombre),
  inyeccion: (nombre) => /inyect|depoprovera|medrox/i.test(nombre),
  implante: (nombre) => /implant|jadelle|etonogestrel/i.test(nombre),
  diu: (nombre) => /diu/i.test(nombre),
  condonM: (nombre) => /condon/i.test(nombre) && !/femenin/i.test(nombre),
  condonF: (nombre) => /femenin/i.test(nombre),
  pae: (nombre) => /pae|emergencia/i.test(nombre)
}

const METAS_LNOB = {
  adolescentes: { total: 2500, hombres: 1200, mujeres: 1300 },
  docentes: { total: 150, hombres: 60, mujeres: 90 },
  organizaciones: 25,
  establecimientos: 35,
  proveedores: { total: 200, medicos: 50, enfermeras: 80 },
  liderazgo: 100
}

const KPI_CODIGOS = {
  adolescentes: ['1.7', '1.8'],
  docentes: ['1.5', '1.6'],
  organizaciones: ['3.3', '3.6'],
  establecimientos: ['2.10', '2.11'],
  proveedores: ['2.7', '2.8'],
  liderazgo: ['3.1', '3.2']
}

export function buscarIndicadorKpi(indicadoresKpi, codigo) {
  for (const bloque of Object.values(indicadoresKpi ?? {})) {
    const encontrado = bloque.indicadores?.find((i) => i.codigo === codigo)
    if (encontrado) return encontrado
  }
  return null
}

export function valorKpi(indicador, anio = 2025) {
  if (!indicador?.años) return null
  const valor = indicador.años[anio] ?? indicador.años[String(anio)]
  return valor == null ? null : Number(valor)
}

function primerValorKpi(indicadoresKpi, codigos, anio = 2025) {
  for (const codigo of codigos) {
    const valor = valorKpi(buscarIndicadorKpi(indicadoresKpi, codigo), anio)
    if (valor != null && !Number.isNaN(valor)) return valor
  }
  return null
}

function porcentajeAvance(real, meta) {
  if (real == null || !meta) return 0
  return Math.round((real / meta) * 100)
}

export function construirTarjetasKpi(indicadoresKpi, anio = 2025) {
  const adolescentesReal = primerValorKpi(indicadoresKpi, KPI_CODIGOS.adolescentes, anio)
  const docentesReal = primerValorKpi(indicadoresKpi, KPI_CODIGOS.docentes, anio)
  const organizacionesReal = primerValorKpi(indicadoresKpi, KPI_CODIGOS.organizaciones, anio)
  const establecimientosReal = primerValorKpi(indicadoresKpi, KPI_CODIGOS.establecimientos, anio)
  const proveedoresReal = primerValorKpi(indicadoresKpi, KPI_CODIGOS.proveedores, anio)
  const liderazgoReal = primerValorKpi(indicadoresKpi, KPI_CODIGOS.liderazgo, anio)

  return {
    adolescentes: {
      meta: METAS_LNOB.adolescentes,
      real: {
        total: adolescentesReal ?? 0,
        hombres: Math.round((adolescentesReal ?? 0) * 0.47),
        mujeres: Math.round((adolescentesReal ?? 0) * 0.53)
      },
      porcentaje: porcentajeAvance(adolescentesReal, METAS_LNOB.adolescentes.total)
    },
    docentes: {
      meta: METAS_LNOB.docentes,
      real: {
        total: docentesReal ?? 0,
        hombres: Math.round((docentesReal ?? 0) * 0.4),
        mujeres: Math.round((docentesReal ?? 0) * 0.6)
      },
      porcentaje: porcentajeAvance(docentesReal, METAS_LNOB.docentes.total)
    },
    organizaciones: {
      meta: METAS_LNOB.organizaciones,
      real: organizacionesReal ?? 0,
      porcentaje: porcentajeAvance(organizacionesReal, METAS_LNOB.organizaciones)
    },
    establecimientos: {
      meta: METAS_LNOB.establecimientos,
      real: establecimientosReal ?? 0,
      porcentaje: porcentajeAvance(establecimientosReal, METAS_LNOB.establecimientos)
    },
    proveedores: {
      meta: METAS_LNOB.proveedores,
      real: {
        total: proveedoresReal ?? 0,
        medicos: Math.round((proveedoresReal ?? 0) * 0.24),
        enfermeras: Math.round((proveedoresReal ?? 0) * 0.42)
      },
      porcentaje: porcentajeAvance(proveedoresReal, METAS_LNOB.proveedores.total)
    },
    liderazgo: {
      meta: METAS_LNOB.liderazgo,
      real: liderazgoReal ?? 0,
      porcentaje: porcentajeAvance(liderazgoReal, METAS_LNOB.liderazgo)
    }
  }
}

function estadoDisponibilidad(conteoMetodos) {
  const total = Object.keys(METODOS_MAC).length
  if (conteoMetodos >= total) return 'verde'
  if (conteoMetodos >= Math.ceil(total / 2)) return 'amarillo'
  return 'rojo'
}

export function derivarDisponibilidadMAC(provision = []) {
  const porMunicipio = new Map()

  for (const row of provision) {
    if (!row.municipio) continue
    if (!porMunicipio.has(row.municipio)) {
      porMunicipio.set(row.municipio, {
        nombre: row.municipio,
        pildora: false,
        inyeccion: false,
        implante: false,
        diu: false,
        condonM: false,
        condonF: false,
        pae: false
      })
    }
    if (Number(row.consumo) <= 0) continue

    const entry = porMunicipio.get(row.municipio)
    const metodo = row.tipoMetodo ?? ''
    for (const [clave, coincide] of Object.entries(METODOS_MAC)) {
      if (coincide(metodo)) entry[clave] = true
    }
  }

  return [...porMunicipio.values()]
    .map((m) => {
      const disponibles = Object.keys(METODOS_MAC).filter((k) => m[k]).length
      return { ...m, estado: estadoDisponibilidad(disponibles) }
    })
    .sort((a, b) => a.nombre.localeCompare(b.nombre, 'es'))
}

export function derivarResumenEstandares(estandares = []) {
  const porEstablecimiento = new Map()

  for (const row of estandares) {
    const clave = row.establecimientoNombre || 'Sin nombre'
    if (!porEstablecimiento.has(clave)) {
      porEstablecimiento.set(clave, { total: 0, cumplen: 0 })
    }
    const stats = porEstablecimiento.get(clave)
    stats.total += 1
    if (row.cumple) stats.cumplen += 1
  }

  let establecimientosCalidad = 0
  for (const stats of porEstablecimiento.values()) {
    if (stats.total > 0 && stats.cumplen / stats.total >= 0.7) {
      establecimientosCalidad += 1
    }
  }

  return {
    establecimientosCalidad,
    totalEstablecimientos: porEstablecimiento.size
  }
}

export function derivarSemaforosMunicipales(disponibilidadMAC, indicadoresKpi) {
  const eisPorMunicipio = valorKpi(buscarIndicadorKpi(indicadoresKpi, '1.4'), 2025) ?? 0
  const orgs = valorKpi(buscarIndicadorKpi(indicadoresKpi, '3.3'), 2025) ?? 0

  const nivelEis = eisPorMunicipio >= 2 ? 'verde' : eisPorMunicipio >= 1 ? 'amarillo' : 'rojo'
  const nivelOrgs = orgs >= 8 ? 'verde' : orgs >= 4 ? 'amarillo' : 'rojo'
  const nivelProveedores = (valorKpi(buscarIndicadorKpi(indicadoresKpi, '2.7'), 2025) ?? 0) >= 1
    ? 'amarillo'
    : 'rojo'

  return disponibilidadMAC.map((m) => ({
    nombre: m.nombre,
    mac: m.estado,
    proveedores: nivelProveedores,
    eis: nivelEis,
    comunidades: nivelOrgs
  }))
}
