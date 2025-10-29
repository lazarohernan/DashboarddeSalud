# Dashboard de Salud Reproductiva

Dashboard minimalista para monitoreo y seguimiento de programas de salud reproductiva en Honduras.

## Características

- **Filtros jerárquicos**: Departamento → Municipio → Establecimiento
- **Tres secciones principales**:
  - Estándares de Calidad (solo para Establecimientos de Salud)
  - Planes de Acción (con datos de participantes por género y edad)
  - Provisión de Anticonceptivos (sistema Cardex - inventario)

## Tecnologías

- Vue 3 (Composition API)
- Tailwind CSS
- Lucide Icons
- Vite

## Instalación

```bash
# Instalar dependencias
npm install
```

## Desarrollo

```bash
# Iniciar servidor de desarrollo
npm run dev
```

El dashboard estará disponible en `http://localhost:5173`

## Estructura del Proyecto

```
dashboard-salud/
├── src/
│   ├── components/
│   │   ├── Filtros.vue              # Filtros jerárquicos
│   │   ├── EstandaresCalidad.vue    # Sección de estándares
│   │   ├── PlanesAccion.vue         # Sección de planes de acción
│   │   └── ProvisionAnticonceptivos.vue  # Sección de provisión
│   ├── data/
│   │   └── mockData.js              # Datos de prueba
│   ├── App.vue                      # Componente principal
│   ├── main.js
│   └── style.css
├── index.html
├── package.json
├── vite.config.js
└── tailwind.config.js
```

## Datos Mock

El proyecto incluye datos de prueba para:
- 3 Departamentos (Atlántida, Colón, Islas de la Bahía)
- 7 Municipios
- 5 Establecimientos (salud, educativos, asociaciones)
- Estándares de calidad con indicadores Sí/No
- Planes de acción con datos de participantes
- Provisión de anticonceptivos (PAE, Condones, DIUs)

## Próximos Pasos

- [ ] Conectar con base de datos real
- [ ] Agregar gráficos y visualizaciones
- [ ] Implementar exportación de datos
- [ ] Agregar sistema de autenticación
- [ ] Implementar formularios de captura de datos

## Notas de Diseño

- Sin colores (escala de grises)
- Sin sombras
- Diseño minimalista y limpio
- Solo visualización (sin inputs por ahora)
- Enfocado en mostrar la estructura de datos
