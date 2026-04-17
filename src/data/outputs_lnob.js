// outputs_lnob.js
// Datos reales generados desde "Avance de actividades LNOB.xlsx"
// Total de registros: 45
// Estructura: por indicador, con bloques de datos por año (2023–2027)
//
// Campos por registro:
//   codigoOutput    — número del output (1–4)
//   output          — descripción larga del output
//   fondo           — "Irlanda" o "Luxemburgo"
//   actividadIngles — texto original de la actividad en inglés
//   actividadEspanol— traducción al español (vacío si Excel usa fórmula TRANSLATE)
//   codigoIndicador — ej: "1.1", "2.3"
//   indicador       — descripción del indicador
//   anos            — objeto con claves "2023" a "2027", cada uno con:
//                     añoReferencia, priorizado, estado, resultado, observaciones
//
// REGLA: si priorizado === "No", el estado es "No Aplica" (no penaliza la ejecución)

export const outputsLNOB = [
  {
    "codigoOutput": 1,
    "output": "Fortalecimiento de la educación sexual integral dentro y fuera de la escuela para adolescentes, niñas y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_1.1 Review, adapt and validate the national CSE programmes-in and out of school- ensuring the inclusion of culturally sensitive approaches, and the alignment with the international standards, and available in their own languages in Panama, Costa Rica, Honduras, Guatemala, and Belize.",
    "actividadEspanol": "",
    "codigoIndicador": "1.1",
    "indicador": "# de programas de EIS en la escuela revisados, adaptados y/o validados, incluyendo enfoques culturalmente sensibles y disponibles en sus idiomas en los 6 países.",
    "anos": {
      "2023": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "1",
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "Completado",
        "resultado": "0",
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": 3,
        "priorizado": "Si",
        "estado": null,
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": 3,
        "priorizado": "Si",
        "estado": null,
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 1,
    "output": "Fortalecimiento de la educación sexual integral dentro y fuera de la escuela para adolescentes, niñas y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Irlanda",
    "actividadIngles": "IEA36_1.1 Development of a tool to calculate the impact of In and Out of School CSE on reducing adolescent pregnancy linked to improved adherence to contraceptive methods or else delay in initiation of sexual intercourse",
    "actividadEspanol": "",
    "codigoIndicador": "1.2",
    "indicador": "Número de estrategias implementadas para calcular el impacto de la EIS dentro y fuera de la escuela en la reducción del embarazo adolescente.",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "1",
        "observaciones": "Desarrollo de herramienta para calcular el impacto de la EIS, fuera y dentro de la escuela, con el apoyo técnico del FLACSO Argentina y la colaboración de líderes comunitarios y autoridades gubernamentales y oficina UNFPA Honduras."
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 1,
    "output": "Fortalecimiento de la educación sexual integral dentro y fuera de la escuela para adolescentes, niñas y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_1.2 Designing, printing and publication of educational and promotional materials on CSE in-and out of school in Panama, Costa Rica, etc. please complete (Please note that activity includes expenses for design, printing and publishing services including expenses for printing of promotional materials, such as brochures, booklets, banners, etc.)",
    "actividadEspanol": "",
    "codigoIndicador": "1.3",
    "indicador": "- # de materiales educativos y/o promocionales diseñados, impresos y publicados.",
    "anos": {
      "2023": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "1 paquete de afiches informativos sobre el proyecto LNOB",
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "Completado",
        "resultado": "0",
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 1,
    "output": "Fortalecimiento de la educación sexual integral dentro y fuera de la escuela para adolescentes, niñas y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_1.3 Carry out workshops to train facilitators on CSE out of school from selected CSOs located at community level in Panama, Costa Rica,  Honduras, Guatemala y Belize (Please note under this activity at least 2 workshops per each country per 2 days, with 15-20 participants; and the activity will start in the Year 2 of the project)",
    "actividadEspanol": "",
    "codigoIndicador": "1.4",
    "indicador": "- # de talleres realizados desglosados por país y municipio - # de facilitadores capacitados por edad, sexo, raza y etnia, ubicación geográfica - % de facilitadores que dominan los conocimientos relevantes (Nota: uso de pruebas previas y posteriores)",
    "anos": {
      "2023": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "46 facilitadores de OSC",
        "observaciones": "Los participantes se conformaron: líderes comunitarios, coordinadores de equipos de futbol, mujeres, periodistas, comunicadores, autoridades locales, etc."
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "121 facilitadores de OSC",
        "observaciones": "Los participantes se conformaron: líderes comunitarios, coordinadores de equipos de futbol, mujeres, periodistas, comunicadores, autoridades locales, etc."
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 1,
    "output": "Fortalecimiento de la educación sexual integral dentro y fuera de la escuela para adolescentes, niñas y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_1.4 Carry out workshops to train facilitators (teachers) on CSE in school from selected institutes/schools of the MoE located at community level in Panama, Costa Rica, Honduras, Guatemala y Belize (at least 1 workshop per each country per 2 days, with 15-20 participants).",
    "actividadEspanol": "",
    "codigoIndicador": "1.5",
    "indicador": "# de talleres realizados desglosados por país y municipio # de docentes formados desglosados por edad, sexo, etnia - raza, ubicación geográfica",
    "anos": {
      "2023": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "4 docentes",
        "observaciones": "Como resultado del diagnóstico inicial comunitario para el proyecto, se tomó la decisión de unificar los talleres de fortalecimiento de capacidades con los líderes comunitarios y docentes, dadas las condiciones complejas sobre la percepción del tema (resistencia inicial y estigmas  ante la EIS)"
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "21 docentes",
        "observaciones": "Como resultado del diagnóstico inicial comunitario para el proyecto, se tomó la decisión de unificar los talleres de fortalecimiento de capacidades con los líderes comunitarios y docentes, dadas las condiciones complejas sobre la percepción del tema (resistencia inicial y estigmas  ante la EIS)"
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 1,
    "output": "Fortalecimiento de la educación sexual integral dentro y fuera de la escuela para adolescentes, niñas y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Irlanda",
    "actividadIngles": "IEA36_1.2 Enhanced capacity of teachers to implement out-of-school comprehensive sexuality education (CSE) strategies, aligned with the International Technical and Programmatic Guidelines on Comprehensive Sexuality Education Out of School, in prioritized municipalities of Costa Rica, Honduras, Guatemala, and Belize",
    "actividadEspanol": "",
    "codigoIndicador": "1.6",
    "indicador": "Número de docentes capacitados para la implementación adecuada de los programas/iniciativas de Educación Integral en Sexualidad (EIS) siguiendo estándares internacionales, incluidos enfoques culturalmente sensibles.",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "170 docentes",
        "observaciones": null
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 1,
    "output": "Fortalecimiento de la educación sexual integral dentro y fuera de la escuela para adolescentes, niñas y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_1.5 Implement workshops with the aim to train adolescents and young people who are out of schoool in CSE from selected municipalities in Panama, Costa Rica, Honduras, Guatemala, Belize (at least 1 workshops in selected comunities per country each year)",
    "actividadEspanol": "",
    "codigoIndicador": "1.7",
    "indicador": "# de talleres realizados desagregados por país y municipio # de adolescentes capacitados desagregados por edad, sexo, etnia - raza, ubicación geográfica - % de adolescentes que dominan los conocimientos relevantes (Nota: uso de pruebas previas y posteriores)",
    "anos": {
      "2023": {
        "añoReferencia": 1,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "50",
        "observaciones": "Acordarse de los medios de verificación: listados"
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 1,
    "output": "Fortalecimiento de la educación sexual integral dentro y fuera de la escuela para adolescentes, niñas y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_1.6 Implement workshops to train adolescents and young people who are at schoool on CSE from selected institutes/ schools at community level in Panama, Costa Rica, Honduras, Guatemala, Belize (at least 1 workshops in selected comunities per country each year)",
    "actividadEspanol": "",
    "codigoIndicador": "1.8",
    "indicador": "# de talleres realizados desagregados por país y municipio # de adolescentes capacitados desagregados por edad, sexo, etnia - raza, ubicación geográfica - % de adolescentes que dominan los conocimientos relevantes (Nota: utilizando pruebas previas y posteriores)",
    "anos": {
      "2023": {
        "añoReferencia": 1,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "230",
        "observaciones": "Acordarse de los medios de verificación: listados"
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 1,
    "output": "Fortalecimiento de la educación sexual integral dentro y fuera de la escuela para adolescentes, niñas y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_1.7 Design and implement a communication and advocay strategies at the community level to combat racism, xenophobia, and all forms of discrimination and promote CSE. (Please note that during the first year of the project, the strategy will be designed, including comunicational and advocacy products, and in the upcoming years the activities and events will be implemented)",
    "actividadEspanol": "",
    "codigoIndicador": "1.9",
    "indicador": "# y tipo de actividades de comunicación y promoción realizadas por país y municipio # y tipo de productos de comunicación y promoción producidos desagregados por país",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "Diseñados e implementados juegos lúdicos para adolescentes y jóvenes (bingo, mural interactivo)",
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 1,
    "output": "Fortalecimiento de la educación sexual integral dentro y fuera de la escuela para adolescentes, niñas y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Irlanda",
    "actividadIngles": "IEA36_1.3 Communication and advocacy strategy at the community level to combat racism, xenophobia and all forms of discrimination and promote CSE",
    "actividadEspanol": "",
    "codigoIndicador": "1.1",
    "indicador": "Número de estrategias de comunicación implementadas que contribuyen a la promoción de la EIS y la erradicación del racismo y la discriminación racial",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 1,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 1,
    "output": "Fortalecimiento de la educación sexual integral dentro y fuera de la escuela para adolescentes, niñas y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_1.8 Project personnel costs (technical and operational)",
    "actividadEspanol": "",
    "codigoIndicador": "1.11",
    "indicador": "# de asistente administrativo local contratado oportunamente y de calidad por localidad / # de oficiales de enlace locales contratados oportunamente y de calidad por ubicación",
    "anos": {
      "2023": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "1 Coordinadora de proyectos, 1 Asistente administrativo contratados",
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "1 Coordinadora de proyectos, 1 Asistente administrativo contratados",
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 2,
    "output": "Mejorar de la cobertura y acceso a servicios de salud sexual y reproductiva de alta calidad para adolescentes y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_2.1 Review and adapt national SRH and GBV norms, protocols, guidelines, and counseling, in coordination with the MoH to ensure the inclusion of evidence-based standards, ensuring culturally sensitive approaches and the adoption of life- course. (Please note that activity will include sub-activities such as to hire consultants, designing, printing, and publishing normative documents, brochures, posters, flipcharts, etc. as well as translation, if it is requiered. This activity will be started in the last quarter of the first year of the project and will be completed in the second quarter of the second year of the project).",
    "actividadEspanol": "",
    "codigoIndicador": "2.1",
    "indicador": "# de normas, y/o protocolos y directrices revisadas, adaptadas y/o validadas desglosadas por área: SDSR, violencia de género y país",
    "anos": {
      "2023": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "1",
        "observaciones": "Revisión y actualización del protocolo de atención a víctimas sobrevivientes de violencia sexual"
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "1",
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 2,
    "output": "Mejorar de la cobertura y acceso a servicios de salud sexual y reproductiva de alta calidad para adolescentes y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Irlanda",
    "actividadIngles": "IEA36_2.1 Identified barriers to access to health services for Afro-descendant adolescents and young people in Costa Rica, Guatemala, Honduras, and Belize; as well as action strategies to eliminate these barriers",
    "actividadEspanol": "",
    "codigoIndicador": "2.2",
    "indicador": "# de iniciativas emprendidas para abordar las barreras al acceso a la salud para adolescentes y jóvenes en comunidades selectas de la costa caribeña de Costa Rica, Guatemala, Honduras y Belice # de iniciativas desarrolladas para fortalecer el acceso de adolescentes y jóvenes afrodescendientes a los servicios de salud.",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 1,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 2,
    "output": "Mejorar de la cobertura y acceso a servicios de salud sexual y reproductiva de alta calidad para adolescentes y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Irlanda",
    "actividadIngles": "IEA36_2.2 Strengthen health service responses to the Afro-descendant adolescent population by measuring the quality standards of sexual and reproductive health services for adolescents in the municipalities prioritized by the project",
    "actividadEspanol": "",
    "codigoIndicador": "2.3",
    "indicador": "Fortalecimiento de los servicios de salud para adolescentes en comunidades de la Costa Caribe de Costa Rica, Honduras, Guatemala y Belice y donde viven poblaciones afrodescendientes",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "1",
        "observaciones": "Diseño de la herramienta para el seguimiento y monitoreo del autodiagnóstico de estándares de calidad de los servicios de salud."
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 2,
    "output": "Mejorar de la cobertura y acceso a servicios de salud sexual y reproductiva de alta calidad para adolescentes y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_2.2 Designing, printing and publication of information and promotional materials on SRHR, including family planning- LARCs- and GBV including (Please note that this activity includes expenses for design, printing, publishing services, and distribution costs, as well as translation when it will be needed. The information and promotional material will include for example, brochures, booklets, banners, etc. These materials will be distributed at the health care units at municipality levels, as well among the adolescents and young people and women that use these services)",
    "actividadEspanol": "",
    "codigoIndicador": "2.4",
    "indicador": "# de Materiales informativos y/o promocionales diseñados, impresos y/o distribuidos por país y municipio",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 2,
    "output": "Mejorar de la cobertura y acceso a servicios de salud sexual y reproductiva de alta calidad para adolescentes y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_2.3 Sub-regional workshop on LARCs (Long-Acting Reversible Contraception- IUDs and implants) to train health care providers, in full four days training ( please note that this activity will gather at least 30 participants from the selected health care units at municipality level. For this activity, through the project will be possible to hire a SRHR NGO with training experience in this area)",
    "actividadEspanol": "",
    "codigoIndicador": "2.5",
    "indicador": "- Taller realizado oportunamente y de calidad - # de proveedores de atención médica capacitados por edad, sexo, raza, etnia, ubicación geográfica - % de proveedores de atención médica que dominan los conocimientos relevantes (Nota: uso de pruebas previas y posteriores)",
    "anos": {
      "2023": {
        "añoReferencia": 1,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "Participación de 5 proveedores de salud representantes de los 4 departamentos priorizados para el proyecto en el taller subregional llevado a cabo en Panamá",
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 2,
    "output": "Mejorar de la cobertura y acceso a servicios de salud sexual y reproductiva de alta calidad para adolescentes y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_2.4 Implement workshops to train health care providers from selected health services at local level in Sexual and Reproductive Health and Rights (SRHR) and GBV norms, protocols, guidelines, and counseling with particular focus on the elimination of cultural barriers as well as to the international standards for quality health services for adolescents established by WHO and UNFPA. (Please note that this activity will be implemented in the years 2, 3, and 4. At least 2 workshops per year in selected municipalities with 20-30 participants in each country).",
    "actividadEspanol": "",
    "codigoIndicador": "2.6",
    "indicador": "# de talleres realizados desglosados por país y municipio # de proveedores de atención médica capacitados por edad, sexo, raza, etnia, ubicación geográfica - % de proveedores de salud que dominan los conocimientos relevantes (Nota: uso de pruebas previas y posteriores)",
    "anos": {
      "2023": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "29 proveedores de salud capacitados de los 4 departamentos priorizados del proyecto",
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "25 proveedores sanitarios",
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 2,
    "output": "Mejorar de la cobertura y acceso a servicios de salud sexual y reproductiva de alta calidad para adolescentes y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Irlanda",
    "actividadIngles": "IEA36_2.3 Strengthen the capacities and tools of locally selected healthcare providers in the areas of standards, protocols, guidelines, and counseling on sexual and reproductive health and rights (SRHR) and gender-based violence, with a special focus on eliminating cultural barriers, racial stereotypes, and approaching services from an intercultural and ethno-racial perspective",
    "actividadEspanol": "",
    "codigoIndicador": "2.7",
    "indicador": "Número de proveedores de atención de la salud capacitados para prestar servicios de alta calidad en SSR a mujeres, adolescentes y jóvenes, centrándose en la eliminación de barreras, incluidos el racismo y la discriminación, y en enfoques que tengan en cuenta las diferencias culturales",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "1",
        "observaciones": "Elaboración de una guía práctica de consejería en anticoncepción para adolescentes con enfoque de género, interculturalidad y derechos humanos."
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 2,
    "output": "Mejorar de la cobertura y acceso a servicios de salud sexual y reproductiva de alta calidad para adolescentes y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_2.5 Carry out workshops at local level on LARCs (Long-Acting Reversible Contraception- IUDs and implants) to train health care providers, in full three-days training, including theory and practice. (Please note that this activity will be implemented in the year 2, 3, and 4. At least 1 workshop per year in selected municipalities with 20 participants in each country, and a refreshed training will be conducted in the year 3 of the project. For this activity, through the project will be possible to hire a SRHR NGO with training experience in this area) Maybe sub-regional training",
    "actividadEspanol": "",
    "codigoIndicador": "2.8",
    "indicador": "-# de talleres realizados desglosados por país y municipio -# de proveedores de atención médica capacitados por edad, sexo, raza, etnia, ubicación geográfica - % de proveedores de atención médica que dominan los conocimientos relevantes (Nota: uso de pruebas previas y posteriores)",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "50 profesionales sanitarios",
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 2,
    "output": "Mejorar de la cobertura y acceso a servicios de salud sexual y reproductiva de alta calidad para adolescentes y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_2.6 Sub-regional workshop on SRHR, GBV and Culturally Sensitive Approaches with the aim to discuss the impact of discrimination, racism, and exclusion on women's, and girls' health (Maternal health, Adolescent Pregnancy, Unmet needs for Familiy Planning)",
    "actividadEspanol": "",
    "codigoIndicador": "2.9",
    "indicador": "- Taller subregional realizado de manera oportuna y de calidad -# de proveedores de atención médica capacitados por edad, sexo, raza, etnia, ubicación geográfica - % de proveedores de atención médica que dominan el conocimiento relevante (Nota: uso de pruebas previas y posteriores)",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 2,
    "output": "Mejorar de la cobertura y acceso a servicios de salud sexual y reproductiva de alta calidad para adolescentes y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_2.7 Provide medical equipment and/or commodities for SRH care for adolescents and women in selected health units, including funds for project staff travel",
    "actividadEspanol": "",
    "codigoIndicador": "2.1",
    "indicador": "# de unidades de atención médica equipadas con equipos médicos para la atención de SHR desagregadas por país y municipio",
    "anos": {
      "2023": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "Distribuidos los equipamientos médicos en los establecimientos",
        "observaciones": "Recibidos en 2024"
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "Distribuidos los equipamientos médicos en los establecimientos",
        "observaciones": "Recibidos en 2024"
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 2,
    "output": "Mejorar de la cobertura y acceso a servicios de salud sexual y reproductiva de alta calidad para adolescentes y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Irlanda",
    "actividadIngles": "IEA36_2.4 Provide medical equipment and/or commodities for SRH care for adolescents and women in selected health units (Ensure access to a full range of contraceptive methods, including long-acting reversible contraceptives (LARCs)",
    "actividadEspanol": "",
    "codigoIndicador": "2.11",
    "indicador": "Número de unidades de atención de salud equipadas con equipo médico para la atención de SHR, desglosado por país",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 1,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 2,
    "output": "Mejorar de la cobertura y acceso a servicios de salud sexual y reproductiva de alta calidad para adolescentes y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_2.8 Develop and implement a communication and advocacy strategy using innovative approaches to increase informed demand for high quality SRH services, including modern contraception, prevention of GBV and sexual violence and the prevention of adolescent pregnancy with focus on women, adolescents, and young people in the selected municipalities. (Please note that to do this the project could established alliance and partnerships with NGOs, hire consultants, etc. It is estimated at least Euros 10,000 per each municipality involved in the project, to develop the strategy and other Euros 10,000 for the implementation. In addition to that, the beneficiaries of the strategy must be involved in the design and implementation of the strategy.)",
    "actividadEspanol": "",
    "codigoIndicador": "2.12",
    "indicador": "- Estrategia de comunicación y promoción desarrollada e implementada - # y tipo de actividades realizadas desagregadas por país y municipio (ferias de salud, desfiles, reuniones, APPs, foros de cine, etc.) - Número y tipo de alianzas y asociaciones desarrolladas para la implementación de la estrategia (gobiernos locales, OSC, ONG, sector privado, etc.)",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "Implementación de alianza con comunicadores y periodistas afrohondureños",
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 2,
    "output": "Mejorar de la cobertura y acceso a servicios de salud sexual y reproductiva de alta calidad para adolescentes y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Irlanda",
    "actividadIngles": "IEA36_2.5 Communication and advocacy strategy using innovative approaches to increase informed demand for high quality SRH services, including modern contraception, prevention of GBV and sexual violence and the prevention of adolescent pregnancy with focus on women, adolescents, and young people of African descent",
    "actividadEspanol": "",
    "codigoIndicador": "2.13",
    "indicador": "Número de iniciativas implementadas para mejorar el acceso a los servicios de salud de los adolescentes desatendidos en las comunidades afrodescendientes de Centroamérica a través de actividades de sensibilización, movilización comunitaria y comunicación",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "1",
        "observaciones": "Diseño e implementación de una estrategia de comunicación para aumentar la demanda informada de los Servicios de Salud en coordinación con la red de comunicadores y periodistas afrohondureños."
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 2,
    "output": "Mejorar de la cobertura y acceso a servicios de salud sexual y reproductiva de alta calidad para adolescentes y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_2.9 Project personnel (Technical and operational)",
    "actividadEspanol": "",
    "codigoIndicador": "2.14",
    "indicador": "# de oficiales de enlace locales contratados oportunamente y de calidad por ubicación\n# de asistente administrativo local contratado oportunamente y de calidad por localidad",
    "anos": {
      "2023": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "1 Coordinadora de proyectos, 1 Asistente administrativo contratados",
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "1 Coordinadora de proyectos, 1 Asistente administrativo contratados",
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 3,
    "output": "Aumentar las capacidades de liderazgo y empoderamiento de mujeres y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas para abogar por el cumplimiento de sus derechos, incluyendo la salud y los derechos sexuales y reproductivos.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_3.1 Review, adapted and validate the UNFPA courses on Youth Participation and Empowerment, using culturally sensitive approaches with the aim to strengthen the skills of Afro-descendant and Garifuna Adolescents and Youth on issues related to human rights, sexual and reproductive rights and gender equailty, as well as their right to participate in political, strategic and decision-making spaces on issues that affect their lives, inlcuding bodily autonomy, positive masculinities, prevention of GBV, including sexual violence, leadership, and participation. (Please note that these materials will be available in their own languages, and will include the human rights-based approaches, and must include the vision, needs and views of the young people).",
    "actividadEspanol": "",
    "codigoIndicador": "3.1",
    "indicador": "# de cursos del UNFPA sobre participación y liderazgo de los jóvenes revisados, adaptados y/o validados, desglosados por país",
    "anos": {
      "2023": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "1",
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "1",
        "observaciones": "Talleres de masculinidades positivas, de VBG."
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 3,
    "output": "Aumentar las capacidades de liderazgo y empoderamiento de mujeres y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas para abogar por el cumplimiento de sus derechos, incluyendo la salud y los derechos sexuales y reproductivos.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_3.2 Carry out workshops to train facilitators on the course of AD Youth Participation and Empowerment from selected NGOS/CSOs and stakeholders located at community level in Panama, Costa Rica, Honduras, Guatemala y Belize (at least 1 workshop per each country per 2 days, with 15-20 participants).",
    "actividadEspanol": "",
    "codigoIndicador": "3.2",
    "indicador": "- # de talleres realizados desagregados por país y municipio - # de facilitadores capacitados por edad, sexo, raza, etnia, ubicación geográfica y ONG - % de facilitadores que han dominado sus conocimientos (utilizando pruebas previas y posteriores)",
    "anos": {
      "2023": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "Desarrollo de grupo focal con líderes comunitarios para la validación de materiales de la implementación del curso de participación y empoderamiento con Ashanti Perú.",
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "15 jóvenes facilitadores",
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 3,
    "output": "Aumentar las capacidades de liderazgo y empoderamiento de mujeres y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas para abogar por el cumplimiento de sus derechos, incluyendo la salud y los derechos sexuales y reproductivos.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_3.3 Engage selected NGOs/CSOs from national and/or local levels to carry out the implementation and follow up of the training course on Youth Participation and Empowerment three times a year in selected municipalities of the project and support the establisment of AD Youth Neworks (PLease note that this activity will train at least 50 young people per course in each municipality, per year, and a follow up meeting with the trainees per year. This activity will be implemented using an Implementing Partner Agreement modality and/or a modality that will allow the project to support other stakeholders).",
    "actividadEspanol": "",
    "codigoIndicador": "3.3",
    "indicador": "- # de ONG/OSC comprometidas para implementar el curso de capacitación desglosado por país y municipio - # de adolescentes y jóvenes capacitados desglosados por sexo, raza, etnia, ubicación geográfica - # de redes y/o plataformas establecidas y/o apoyadas - % de adolescentes y jóvenes que han dominado sus conocimientos (utilizando pruebas previas y posteriores), -#Menstrual materiales educativos para la salud y artículos de higiene menstrual reutilizables entregados.",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "297 adolescentes y jóvenes capacitados",
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 3,
    "output": "Aumentar las capacidades de liderazgo y empoderamiento de mujeres y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas para abogar por el cumplimiento de sus derechos, incluyendo la salud y los derechos sexuales y reproductivos.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_3.4 Involved selected NGOs and/or CSOs to develop and carry out workshops to strengthen skills and competencies to change discriminatory social and gender norms, inlcuding positive masculinities, prevention of GBV, including social violence, to train adolescents and youth, school teachers, health care providers, parents and other relevant participants. (Please note that this activity will be implemented using an Implementing Partner Agreement modality and/or a modality that will allow the project to support other stakeholders, and it is expected to carry out 2 workshops with 25 participants per each municipality per year).",
    "actividadEspanol": "",
    "codigoIndicador": "3.4",
    "indicador": "-# de talleres realizados desagregados por país, municipio y ONG implementadora - # de personas capacitadas por grupo desagregadas por sexo, edad, etnia, ubicación geográfica * Grupos: Adolescentes y Jóvenes; Mujeres líderes, madres y padres; organizaciones gubernamentales: maestros, proveedores de atención médica, etc.-",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "7 talleres realizados con la participación de 210 adolescentes  jóvenes, líderes y autoridades locales capacitadas",
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 3,
    "output": "Aumentar las capacidades de liderazgo y empoderamiento de mujeres y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas para abogar por el cumplimiento de sus derechos, incluyendo la salud y los derechos sexuales y reproductivos.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_3.5 Develop and implement a series of workshops to support the strengthening and articulation of the Afro-descendant's, Garifuna and Miskito Women and Youth Networks to improve their knowledge around the Montevideo Consensus on Population and Development, the 2030 Agenda, the Programme of Activities of the International Decade for AD, the Durban Declaration, with particular focus to fulfill the rights of people of African-descents, Garifuna, Creole, Miskito and Indigenous People and the UN Mechanisms to support their rights, including the UN Permanet Forum for People of Africandescendant and the UN Permanent Forum for Indigenous Peoples. (Please note that this activity will include at least two workshops – two full days- to train the project ‘s beneficiaries- community leaders-per year, with the participation of 20 leaders from the areas of the project, per country).",
    "actividadEspanol": "",
    "codigoIndicador": "3.5",
    "indicador": "- # de talleres realizados desagregados por condado y municipio - # de personas capacitadas por sexo, edad, raza, etnia, ubicación geográfica - # redes apoyadas desagregadas por raza, etnia y ubicación geográfica",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "1 taller con la participación de 30 lideresas comunitarias",
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 3,
    "output": "Aumentar las capacidades de liderazgo y empoderamiento de mujeres y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas para abogar por el cumplimiento de sus derechos, incluyendo la salud y los derechos sexuales y reproductivos.",
    "fondo": "Irlanda",
    "actividadIngles": "IEA36_3.1 Support the strengthening and articulation of the Afro-descendant's Women and Youth Networks; Afro-descendantt's CSO, including social movements; Afro-descendant's platforms and academic organizations; to discuss relevant issues around the Montevideo Consensus on Population and Development, the 2030 Agenda, the Programme of Activities of the International Decade for AD, the Durban Declaration, with particular focus to fulfill the rights of people of African descents, Garifuna, Creole, Miskito and Indigenous People and the UN Mechanisms to support their rights, including the UN Permanent Forum of People of African Descent and the UN Permanent Forum for Indigenous Peoples.",
    "actividadEspanol": "",
    "codigoIndicador": "3.6",
    "indicador": "# de organizaciones de la sociedad civil y comunitarias con capacidades fortalecidas en liderazgo y empoderamiento para abogar por los derechos sexuales y reproductivos de las mujeres y los jóvenes y la igualdad de género, apoyados por el proyecto.                                # de adolescentes, jóvenes y mujeres con capacidades fortalecidas para abogar por los derechos de las mujeres y los jóvenes en derechos sexuales y reproductivos e igualdad de género, incluida la promoción de masculinidades positivas.",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "1",
        "observaciones": "Actualización y formulación de la política pública de la mujer indígena y afrohondureña en coordinación con la red de mujerees indigenas y afrohondureñas y la SEDESOL."
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 3,
    "output": "Aumentar las capacidades de liderazgo y empoderamiento de mujeres y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas para abogar por el cumplimiento de sus derechos, incluyendo la salud y los derechos sexuales y reproductivos.",
    "fondo": "Irlanda",
    "actividadIngles": "IEA36_3.2 Strengthen skills and competencies of selected NGOs and/or CSOs to change discriminatory social and gender norms, including positive masculinities, prevention of GBV, including social violence, to train adolescents and youth, school teachers, health care providers, parents and other relevant participants",
    "actividadEspanol": "",
    "codigoIndicador": "3.7",
    "indicador": "Número de iniciativas locales de prevención del embarazo adolescente que se implementan con la participación de adolescentes y jóvenes en municipios seleccionados.",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "167",
        "observaciones": "Padres, Madres y Cuidadores(as) distribuidos en los 7 municipios. 144 mujeres, 23 hombres."
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 3,
    "output": "Aumentar las capacidades de liderazgo y empoderamiento de mujeres y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas para abogar por el cumplimiento de sus derechos, incluyendo la salud y los derechos sexuales y reproductivos.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_3.6 Support strategic dialogues and conversations, cultural events, participation of women and youth leaders at global and regional events and celebrations at local levels around the agenda of African Descent and Indigenous Peoples, as well as to commemorate the contribution of the African descent and Indigenous to their contribution to culture, heritage, and development of their countries and communities, particularly on the UN special days for the commemoration of the International Day of People of African Descent and the International Day of the World’s Indigenous People. (This activity will carry out once a year at the local level, and when appropriate at regional or /and global level)",
    "actividadEspanol": "",
    "codigoIndicador": "3.8",
    "indicador": "-# y tipo de diálogos estratégicos y/o eventos culturales, realizados desagregados por país y municipio -# de líderes locales apoyados para participar en eventos globales y regionales por edad, sexo, raza, etnia, ubicación geográfica",
    "anos": {
      "2023": {
        "añoReferencia": 1,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "Realización de 3 actividades conmemorativas de la agenda afro: concurso tejiendo nuestras raíces garífunas dirigido a adolescentes y jóvenes, producción y lanzamiento del cortometraje sobre la trayectoria de Bertha Arzú, Desarrollo de encuentros de juventud afrohondureña con la participación de 80 jóvenes. Participación en la 5ta reunión de la conferencia regional sobre población y desarrollo y el foro permanente de los afrodescendientes (una persona joven para cada evento)",
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 3,
    "output": "Aumentar las capacidades de liderazgo y empoderamiento de mujeres y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas para abogar por el cumplimiento de sus derechos, incluyendo la salud y los derechos sexuales y reproductivos.",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_3.7 Project personnel (Technical and operational)",
    "actividadEspanol": "",
    "codigoIndicador": "3.9",
    "indicador": "# de oficiales de enlace locales contratados oportunamente y de calidad por ubicación\n# de asistente administrativo local contratado oportunamente y de calidad por localidad",
    "anos": {
      "2023": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "1 Coordinadora de proyectos, 1 Asistente administrativo contratados",
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "1 Coordinadora de proyectos, 1 Asistente administrativo contratados",
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 4,
    "output": "Contar con una Línea de base, seguimiento y evaluación",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_4.1 Conduct a baseline study in order to be able to determine the level of impact expected and to enable the monitoring of the project's results and impact. (Please note that the purpose of the baseline data is to provide a benchmark from which to measure progress of the project through an in-depth situation analysis and needs assessment of project's outputs in the target municipalities per each country. The baseline data will also cover interventions by municipalities, service providers, Afro-descendant adolescent, Garifuna, Creole and Miskito's youth and women groups, traditional leaders, etc. in order to understand the people needs. Thus, this survey will attempt to provide the current status of the indicators in the results framework and facilitate monitoring of progress towards meeting project outputs. (Please note that to do this, the project will requiere to hire a team of experts, among other tasks requiered undar this activity. This activity will be coordinated by the Regional Office).",
    "actividadEspanol": "",
    "codigoIndicador": "4.1",
    "indicador": "Estudio de referencia realizado en 6 países",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 4,
    "output": "Contar con una Línea de base, seguimiento y evaluación",
    "fondo": "Irlanda",
    "actividadIngles": "IEA36_4.1 Development of an Accelerator methodology for the identification of causes that prevent faster progress in reducing adolescent pregnancy in the Afro-descendant population of the project countries.",
    "actividadEspanol": "",
    "codigoIndicador": "4.2",
    "indicador": "Documento de sistematización del modelo acelerador y sus recomendaciones.",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 1,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 4,
    "output": "Contar con una Línea de base, seguimiento y evaluación",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_4.2 Mid-Term Evaluation of the project. It will be carried out, with the purpose of providing an overview of the progress made to date, identifying both the difficulties encountered and the facilitating elements, extracting lessons learned and making recommendations that will allow UNFPA as the implementing agency, in coordination with the Government of Luxembourg to define the course of action and the most relevant strategies to achieve the outputs set forth in the project. (Please note that the Mid Term Evaluation will be conductud en the first Q of the third year of the implementation of the project. A team of experts will be hire to conduct this evaluation, which will be coordinated by the UNFPA Regional Office and wit the support of the Gov. of Luxembourg).",
    "actividadEspanol": "",
    "codigoIndicador": "4.3",
    "indicador": "Evaluación intermedia realizada # de recomendaciones y acciones implementadas para la mejora de los resultados del proyecto",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 4,
    "output": "Contar con una Línea de base, seguimiento y evaluación",
    "fondo": "Irlanda",
    "actividadIngles": "IEA36_4.2 Systematization and evaluation of the implementation, dissemination of learning and evaluation of project results in its 3 phases",
    "actividadEspanol": "",
    "codigoIndicador": "4.4",
    "indicador": "Evaluación de los resultados del proyecto en sus diferentes fases",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 1,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 4,
    "output": "Contar con una Línea de base, seguimiento y evaluación",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_4.3 Conduct a final evaluation of the project. This activity will take place in the last year of the project implementation.",
    "actividadEspanol": "",
    "codigoIndicador": "4.5",
    "indicador": "Evaluación final realizada # de reuniones realizadas para difundir los hallazgos, lecciones aprendidas y recomendaciones desagregadas por país y municipios",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 4,
    "output": "Contar con una Línea de base, seguimiento y evaluación",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_4.4 Carry out Annual Planning Meetings to prepare the annual works plans per country. This meetings will be organized by the Regional Office in coordination with the Gov. of Luxembourg. ( Please note this meeting will be carry out at the begining of the year, every year)",
    "actividadEspanol": "",
    "codigoIndicador": "4.6",
    "indicador": "Reunión Anual de Planificación realizada # de Planes de Trabajo Anuales aprobados e implementados desagregados por país",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 4,
    "output": "Contar con una Línea de base, seguimiento y evaluación",
    "fondo": "Irlanda",
    "actividadIngles": "IEA36_4.3 Carry out Annual Planning Meetings to prepare the annual works plans per country.",
    "actividadEspanol": "",
    "codigoIndicador": "4.7",
    "indicador": "Documento de sistematización del proceso de planificación anual y sus respectivos planes de trabajo.",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "1",
        "observaciones": null
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 4,
    "output": "Contar con una Línea de base, seguimiento y evaluación",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_4.5 Carry out Annual Jointly Monitoring field visits, in selected countries and muncipalities. (Please note that the UNFPA Regional Team and the Gov. of Luxembourg will organize a field visit each year in selected countries)",
    "actividadEspanol": "",
    "codigoIndicador": "4.8",
    "indicador": "# de Visiones Anuales Conjuntas de Campo realizadas desagregadas por país y municipios % de acciones acordadas implementadas desagregadas por país y municipio",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 4,
    "output": "Contar con una Línea de base, seguimiento y evaluación",
    "fondo": "Irlanda",
    "actividadIngles": "IEA36_4.4 Carry out Annual Jointly Monitoring field visits, in selected countries and municipalities.",
    "actividadEspanol": "",
    "codigoIndicador": "4.9",
    "indicador": "Visitas anuales conjuntas de supervisión realizadas",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 1,
        "priorizado": "Si",
        "estado": "Completado",
        "resultado": "7",
        "observaciones": "Visitas de seguimiento, monitoreo a los diferentes municipios seleccionados."
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 4,
    "output": "Contar con una Línea de base, seguimiento y evaluación",
    "fondo": "Irlanda",
    "actividadIngles": "IEA36_4.5 Project results socialization with key stakeholders, for the presentation of final results, lessons learned, and recommendations",
    "actividadEspanol": "",
    "codigoIndicador": "4.1",
    "indicador": "Participación de las partes interesadas en la difusión de los resultados del proyecto",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 1,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  },
  {
    "codigoOutput": 4,
    "output": "Contar con una Línea de base, seguimiento y evaluación",
    "fondo": "Luxemburgo",
    "actividadIngles": "LUA57_4.6 Project presonnel costs ( Technical and operational)",
    "actividadEspanol": "",
    "codigoIndicador": "4.11",
    "indicador": "Coordinador regional de proyectos contratado a tiempo y de calidad Asistente administrativo contratado a tiempo y calidad",
    "anos": {
      "2023": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2024": {
        "añoReferencia": 2,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2025": {
        "añoReferencia": 0,
        "priorizado": "No",
        "estado": "No Completado",
        "resultado": "0",
        "observaciones": "Reprogramado"
      },
      "2026": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      },
      "2027": {
        "añoReferencia": null,
        "priorizado": "No",
        "estado": "No Aplica",
        "resultado": null,
        "observaciones": null
      }
    }
  }
]

// ─── Helpers ────────────────────────────────────────────────────────────────

/** Devuelve todos los registros de un output dado */
export const getRegistrosPorOutput = (codigoOutput) =>
  outputsLNOB.filter(r => r.codigoOutput === codigoOutput)

/** Devuelve todos los registros de un fondo dado ("Irlanda" | "Luxemburgo") */
export const getRegistrosPorFondo = (fondo) =>
  outputsLNOB.filter(r => r.fondo === fondo)

/** Devuelve los datos de un año específico de un registro */
export const getDatosAnio = (registro, anio) =>
  registro.anos[String(anio)] ?? null

/** Lista de outputs únicos */
export const outputsUnicos = [...new Set(outputsLNOB.map(r => r.codigoOutput))].sort()

/** Lista de fondos únicos */
export const fondosUnicos = [...new Set(outputsLNOB.map(r => r.fondo))]

/** Años disponibles */
export const anosDisponibles = ['2023', '2024', '2025', '2026', '2027']
