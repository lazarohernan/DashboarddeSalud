# Ajustes Pendientes — Dashboard LNOB

Documento de referencia basado en la reunión de revisión con Josué.  
Fecha: 2026-04-15

---

## Estado general

| Estado | Cantidad |
|--------|----------|
| Listo | 22 |
| Esperando datos de Josué | 2 |
| Pendiente de implementar | 1 |

---

## Sección 1 — Outputs / Resultados (`OutputsView.vue`)

| # | Ajuste | Descripción | Estado |
|---|--------|-------------|--------|
| 1 | Eliminar columnas obsoletas | Quitar: Fecha Inicio, Fecha Fin, Establecimiento, % Avance | **Listo** |
| 2 | Agregar columnas correctas | Fondo, Actividad (EN), Actividad (ES), Cód. Indicador, Indicador | **Listo** |
| 3 | Años reales en vez de relativos | Cambiar "Año 1 / Año 2 / Año 3" por 2023, 2024, 2025, 2026, 2027 | **Listo** |
| 4 | Layout dividido: fijo + dinámico | Columnas fijas de indicador + columnas dinámicas por año seleccionado | **Listo** |
| 5 | Vista acumulada sin filtro de año | Sin año seleccionado la tabla muestra las columnas base; con año seleccionado agrega Año Ref., Priorizado, Estado, Resultado, Observaciones | **Listo** |
| 6 | Campo "Priorizado" visible | Aparece como badge Si/No por fila cuando hay año seleccionado | **Listo** |
| 7 | Campo "Observaciones" | Solo lectura por ahora — formulario de edición queda pendiente para cuando Josué lo solicite formalmente | **Listo** |
| 8 | Filtro por Fondo | Dropdown "Irlanda" / "Luxemburgo". Filtros de ubicación eliminados de outputs | **Listo** |
| 9 | Sin duplicar Output | Título de cada Output fuera de la tabla, una tabla propia por Output | **Listo** |

---

## Sección 1b — Datos de Outputs (`indicadores.js` / `resultados.json`)

| # | Ajuste | Descripción | Estado |
|---|--------|-------------|--------|
| 10 | Generar datos reales desde el Excel | Crear `src/data/outputs_lnob.js` con la estructura correcta a partir de "Avance de actividades LNOB.xlsx" | **Listo** |
| 11 | Fusionar y reemplazar `resultados.json` | Fusionar `outputs_lnob.js` (45 registros completos del Excel) con los campos de actividad en español del JSON anterior. Resultado: 45 registros sin duplicados, con todos los campos que la vista necesita | **Listo** |
| 12 | Agregar campo `fondo` por indicador | Cada registro tiene `fondo: "Irlanda"` o `"Luxemburgo"` extraído del Excel | **Listo** |
| 13 | Agregar `priorizado`, `estado`, `resultado`, `observaciones` por año | Cada bloque de año tiene los cuatro campos, con regla "No Aplica" cuando no fue priorizado | **Listo** |

### Estructura requerida por registro

```js
{
  codigoOutput,       // ej: 1
  output,             // nombre largo del output
  fondo,              // "Irlanda" o "Luxemburgo"
  actividadIngles,    // texto original en inglés
  actividadEspañol,   // traducción al español
  codigoIndicador,    // ej: 1.1, 1.2, 2.3...
  indicador,          // descripción del indicador
  años: {
    2023: { añoReferencia, priorizado, estado, resultado, observaciones },
    2024: { añoReferencia, priorizado, estado, resultado, observaciones },
    2025: { añoReferencia, priorizado, estado, resultado, observaciones },
    2026: { añoReferencia, priorizado, estado, resultado, observaciones },
    2027: { añoReferencia, priorizado, estado, resultado, observaciones }
  }
}
```

> **Regla importante sobre "Priorizado":** Si un indicador no fue priorizado en un año,
> el estado debe ser "No Aplica" — NO "No Completado". Esto evita penalizar la ejecución.

---

## Sección 2 — Provisión de Anticonceptivos (`ProvisionView.vue`)

| # | Ajuste | Descripción | Estado |
|---|--------|-------------|--------|
| 14 | Reemplazar datos mock con datos reales | Conectar con los datos del Excel "Métodos LNOB.xlsx" (796 filas) | **Listo** |
| 15 | Mostrar solo: Tipo de Método + Consumo | El foco visual debe ser cuánto se consumió de cada método, no la transacción completa | **Listo** |
| 16 | Eliminar columna "Transacción" | Quitar la distinción Inicial / Fin de Mes de la vista | **Listo** |
| 17 | Tarjetas por método | Una tarjeta = un tipo de método con total de consumo acumulado + barra relativa | **Listo** |
| 18 | Switch Lista / Tarjetas | Botones para alternar entre vista de tabla y vista de tarjetas | **Listo** |
| 19 | Filtros: RISS, Municipio, Año, Mes | Filtros dentro de ProvisionView, municipio en cascada según RISS | **Listo** |

---

## Sección 2b — Datos de Provisión (`provision_lnob.js`)

| # | Ajuste | Descripción | Estado |
|---|--------|-------------|--------|
| 20 | Generar datos reales desde el Excel | Crear `src/data/provision_lnob.js` con solo los campos necesarios | **Listo** |

### Campos a incluir (solo lo necesario del Excel)

```js
{
  nombreES,    // Nombre del establecimiento de salud
  tipo,        // CIS, UAPS, Policlínico, etc.
  RISS,        // Región sanitaria (ej: "Roatán")
  municipio,
  mes,         // "Mayo", "Diciembre", etc.
  año,         // 2024, 2025...
  codigo,      // código numérico del método
  tipoMetodo,  // "DIU (T de cobre 380 A)", "Orales", "Condones", etc.
  consumo      // campo clave — cuánto se consumió
}
```

> **Lo que NO se muestra:** saldo inicial, saldo final, cantidad recibida, ajustes,
> cantidad máxima, cantidad solicitada. Solo interesa el **consumo** por método.

### Métodos anticonceptivos presentes en el Excel

- DIU (T de cobre 380 A)
- Depoprovera (inyección)
- Orales (píldora)
- Condones
- Implante
- Jadelle

---

## Sección 3 — Ajustes generales

| # | Ajuste | Descripción | Estado |
|---|--------|-------------|--------|
| 21 | Título del dashboard | Cambiar `"Dashboard Salud"` → `"Dashboard LNOB"` en pestaña del navegador (`index.html`) | **Listo** |
| 22 | Logo: solo UNFPA | Logo de SESAL ya fue quitado, solo queda UNFPA | **Listo** |
| 23 | Sección de generalidades / introducción | Ya fue agregada | **Listo** |
| 24 | Datos del mapa | Josué va a pasar los datos de referencia territoriales para alimentar el mapa | Esperando datos |
| 25 | Imágenes del carrusel | Josué va a pasar imágenes adicionales para la portada | Esperando datos |

---

## Orden sugerido de implementación

Los ajustes de datos son el punto de partida — sin ellos, los cambios de vista no tienen contenido real.

```
Paso 1 — Datos (sin tocar la vista)
  [x] #10 — Generar src/data/outputs_lnob.js desde el Excel de actividades
  [x] #11 — Fusionar con resultados.json (45 registros, años reales 2023–2027)
  [x] #12 — Campo fondo por indicador incluido
  [x] #13 — priorizado, estado, resultado, observaciones por año incluidos
  [x] #20 — Generar src/data/provision_lnob.js desde el Excel de métodos

Paso 2 — Vista Outputs (OutputsView.vue)
  [x] #1  — Columnas obsoletas eliminadas (fechaInicio, fechaFin, establecimiento, porcentajeAvance)
  [x] #2  — Columnas correctas agregadas (Fondo, Actividad EN, Actividad ES, Cód. Indicador, Indicador)
  [x] #3  — Años reales 2023–2027 en la tabla
  [x] #4  — Layout: columnas fijas + columnas dinámicas por año seleccionado
  [x] #5  — Sin año: tabla base; con año: columnas adicionales
  [x] #6  — Campo Priorizado visible por fila con badge
  [x] #7  — Observaciones solo lectura (formulario editable queda para solicitud futura)
  [x] #8  — Filtro por Fondo (Filtros.vue + App.vue)
  [x] #9  — Títulos de Output fuera de la tabla, una tabla por Output

Paso 3 — Vista Provisión (ProvisionView.vue)
  [x] #14 — Datos reales conectados (provision_lnob.js, 796 registros)
  [x] #15 — Solo Tipo de Método + Consumo
  [x] #16 — Columna Transacción eliminada
  [x] #17 — Tarjetas por método con consumo acumulado
  [x] #18 — Switch Lista / Tarjetas
  [x] #19 — Filtros RISS, Municipio, Año, Mes dentro de ProvisionView

Paso 4 — Ajustes generales
  [x] #21 — Título cambiado a "Dashboard LNOB" en index.html
  [ ] #24 — Incorporar datos del mapa (cuando Josué los pase)
  [ ] #25 — Incorporar imágenes del carrusel (cuando Josué las pase)
```

---

## Bitácora de desarrollo

Registro cronológico de todo lo implementado, con detalle de archivos tocados y decisiones tomadas.

---

### Sesión 2026-04-15 — Parte 4

#### #1–#9 — Vista Outputs completa

**Qué se hizo:**
- Tabla reestructurada: columnas obsoletas eliminadas (`fechaInicio`, `fechaFin`, `establecimiento`, `porcentajeAvance`). Columnas reales del Excel en su lugar.
- Años reales 2023–2027: sin año seleccionado la tabla muestra columnas base; al seleccionar año aparecen Año Ref., Priorizado, Estado, Resultado, Observaciones.
- Observaciones cambiado a solo lectura (era `<textarea>` editable — se revirtió porque Josué habló de un formulario futuro, no de edición directa en tabla).
- Títulos de Output movidos fuera de la tabla: cada Output tiene su propio `<div>` con badge naranja + nombre, seguido de su propia `<table>`.
- Resumen inferior corregido: ahora calcula desde `anos[año].estado` (datos reales), no desde el campo `estado` raíz que estaba vacío. Usa año seleccionado o 2025 por defecto. Muestra Priorizadas / Completadas / En Proceso / No Completadas con % sobre priorizadas.
- Importaciones faltantes agregadas: `BarChart3`, `Check`, `Clock`, `AlertCircle`.

**Archivos modificados:**
- `src/views/OutputsView.vue`

---

#### #15–#19 — Vista Provisión rediseñada

**Qué se hizo:**
Vista completamente reescrita. Eliminada la gráfica SVG con datos mock. Nueva estructura:
- Filtros propios dentro de la vista: RISS, Municipio (en cascada), Año, Mes (ordenados Ene–Dic) + botones switch Lista/Tarjetas + reset.
- Vista Tarjetas: una tarjeta por método con consumo acumulado total, ordenadas de mayor a menor, con barra de progreso relativa al método con más consumo.
- Vista Lista: tabla simple con Tipo de Método, RISS, Municipio, Mes, Año, Consumo. Sin columna Transacción.
- Resumen superior: Total consumo / Métodos con consumo / Establecimientos únicos / Registros filtrados vs. totales.
- Filtros de provisión eliminados de `App.vue` (computed simplificado a `provisionReal` directo).

**Archivos modificados:**
- `src/views/ProvisionView.vue` — reescrito completo
- `src/App.vue` — bloque Filtros de provisión eliminado, computed simplificado

---

#### #21 — Título en pestaña del navegador

**Qué se hizo:**
`<title>` en `index.html` cambiado de `"Dashboard Salud"` a `"Dashboard LNOB"`. Favicon (`vite.svg`) eliminado.

**Archivos modificados:**
- `index.html`

---

#### Ajuste de menú — chips de navegación

**Qué se hizo:**
Color de los chips del menú de navegación cambiado a `slate-700` (azul grisáceo oscuro), texto blanco en estado normal, texto naranja al seleccionar o hacer hover.

**Archivos modificados:**
- `src/components/Navegacion.vue`

---

### Sesión 2026-04-15 — Parte 3

#### #14 — Reemplazo de datos mock en Provisión de Anticonceptivos

**Qué se hizo:**
Se confirmó en la conversación con Josué que el JSON anterior (`provisionAnticonceptivos.json`, 36 registros de Iriona) eran datos de prueba con nombres genéricos ("Píldora combinada", "Inyección mensual"). El Excel `Métodos LNOB.xlsx` es la fuente oficial actualizada.

`provisionAnticonceptivos.js` reescrito para re-exportar directamente desde `provision_lnob.js`, sin duplicar datos. El JSON viejo queda como respaldo histórico pero ya no se usa.

**Archivos modificados:**
- `src/data/provisionAnticonceptivos.js` — ahora re-exporta desde `provision_lnob.js`

**Verificación:** `npm run build` completó sin errores.

---

### Sesión 2026-04-15 — Parte 2

#### #20 — Generación de `src/data/provision_lnob.js`

**Qué se hizo:**
Se leyó el Excel `Métodos LNOB.xlsx`, hoja `Métodos LNOB` (796 filas de datos reales) con Python/openpyxl y se generó `src/data/provision_lnob.js`.

**Datos encontrados:**
- RISS: Roatán, Atlantida, Trujillo, Limón, B.Oriental
- Municipios: Jose Santos Guardiola, La Ceiba, Iriona, Santa Fe, Santa Rosa de Aguan, Bonito Occidental
- Años: 2024, 2025
- Meses: todos (Enero–Diciembre)
- 17 tipos de métodos anticonceptivos

**Campos incluidos** (solo lo necesario para la vista):
`id`, `nombreES`, `tipo`, `RISS`, `municipio`, `mes`, `ano`, `codigo`, `tipoMetodo`, `consumo`

**Campos excluidos** (transaccionales, no relevantes para la vista):
`saldoInicial`, `cantidadRecibida`, `ajustes`, `saldoFinal`, `cantidadMaxima`, `cantidadSolicitada`, `cantidadProgramada`, `% ejecutado`

**Helpers exportados:**
`rissUnicas`, `municipiosUnicos`, `mesesUnicos`, `anosUnicos`, `metodosUnicos`, `consumoPorMetodo`

**Verificación:** `npm run build` completó sin errores.

---

### Sesión 2026-04-15

#### #10 — Generación de `src/data/outputs_lnob.js`

**Qué se hizo:**
Se leyó el Excel `Avance de actividades LNOB.xlsx` con Python/openpyxl y se generó el archivo `src/data/outputs_lnob.js` con los 45 registros reales del proyecto.

**Estructura generada por registro:**
```js
{
  codigoOutput, output, fondo,
  actividadIngles, actividadEspanol,
  codigoIndicador, indicador,
  anos: {
    '2023': { añoReferencia, priorizado, estado, resultado, observaciones },
    '2024': { ... }, '2025': { ... }, '2026': { ... }, '2027': { ... }
  }
}
```

**Decisiones:**
- `actividadEspanol` queda vacía en varios registros porque el Excel usaba fórmulas `=TRANSLATE()` que Python no puede evaluar. Se dejó pendiente para traducción posterior.
- Se aplicó la regla automática: si `priorizado === "No"` → `estado = "No Aplica"` (no penaliza ejecución).
- Se exportaron helpers: `getRegistrosPorOutput`, `getRegistrosPorFondo`, `getDatosAnio`, `outputsUnicos`, `fondosUnicos`, `anosDisponibles`.

---

#### #11, #12, #13 — Fusión y reemplazo de `resultados.json`

**Qué se hizo:**
Se compararon campo por campo `resultados.json` (trabajo previo, 56 registros con duplicados) y `outputs_lnob.js` (45 registros del Excel, completos). Se confirmó que los datos de `anos` eran idénticos donde coincidían. Se fusionaron:

- Base: `outputs_lnob.js` (45 registros únicos, todos los indicadores)
- Aporte del JSON anterior: campo `actividad` en español (23 registros tenían traducción)
- Resultado: `resultados.json` reemplazado con 45 registros fusionados

**Campos conservados para compatibilidad con `App.vue` y `OutputsView.vue`:**
`id`, `codOutput`, `output`, `fondo`, `codActividad`, `actividadIngles`, `actividad`, `codigoIndicador`, `indicador`, `anos`, `departamento` (vacío), `municipio` (vacío), `comunidad` (vacío), `tipoEstablecimiento` (vacío), `estado`, `porcentajeAvance`, `fechaInicio`, `fechaFin`

**Por qué se dejaron vacíos los campos de establecimiento:**
Los outputs son indicadores nacionales, no están ligados a un establecimiento físico. El JSON anterior tenía esos campos vacíos en el 90% de los registros de todas formas. Los campos se mantienen en la estructura para no romper el código existente.

---

#### #8 — Filtro por Fondo en Outputs

**Qué se hizo:**
- `App.vue`: se simplificó el bloque de filtros para la sección `outputs`. Se eliminaron los dropdowns de departamento, municipio, comunidad y tipoEstablecimiento (irrelevantes para datos nacionales). Se dejó solo el filtro de **Fondo**.
- `Filtros.vue`: se agregó el prop `ocultarEstablecimiento` (Boolean, default `false`). Cuando es `true`, oculta los tres dropdowns de ubicación y el de tipo de establecimiento sin afectar las otras secciones (estandares, provision).

**Archivos modificados:**
- `src/App.vue` — bloque `v-if="opcionActiva === 'outputs'"` del componente Filtros
- `src/components/Filtros.vue` — nuevo prop + `v-if` en los tres divs de ubicación y tipo establecimiento

**Verificación:** `npm run build` completó sin errores.

---

## Transcripción de la reunión — 2026-04-15

Respaldo íntegro de la conversación en la que se definieron estos ajustes.

---

**— Buen día Josué. ¿Qué ha ido? No sé si tenés el micrófono, creo en Mute, creo.**

Hola, Sí, hoy sí. Aquí estamos. Disculpame el retraso.

**— Tranqui. A ver si podemos revisar lo de los cambios en la plataforma.**

Claro. No sé si tenés el enlace.

**— No, no sé si... Yo te lo había pasado para ver si me vas a enseñar mostrando a dónde...**

Ah, ok, espérame. Voy, dale. Ahí ya lo ve, ¿verdad?

**— Sí, ahí sí. Ya se mira. Aquí te debo datos, ¿verdad? para poderte pasar.**

Exacto, sí, en el mapa no hay datos de referencia, ¿verdad? de la información que hay que colocar.

**— Ok, bueno, aquí ya está, objetivo final, estaba esperado. Otro diagnóstico, bien?**

Sí, hice la una generalidades o información de introducción que me habías dicho.

**— Sí, no genial. Sacamos el logo de la Secretaría de...**

Sí, sí, sí. Si solo está el de LMPA, abajo se quitó.

**— Ok. Y aquí había que agregar el tema de... Sí, eso te iba a preguntar, me dijiste una cuestión de si puedes bajar un poco. Ajá, comentarios y observaciones. No sé si era un campo, así como, o sea, ahorita está deshabilitado. Pero no sé si es un campo, así como se ve ese ahí para agregar el tema de comentarios, observaciones o si era de otra manera.**

Sí, bueno, más bien te voy a presentar los resultados ya de los datos, ¿verdad? Para ver cómo lo adecuamos. Déjame buscarlo.

**— Ahí lo ves. Seguí.**

Ok, entonces aquí tenemos por todas las actividades, ¿verdad? Por outputs. El fondo, la actividad en inglés y en español, el indicador, el código de indicador y aquí vienen los resultados, ¿verdad? Me decís si se entiende para si no poder hacer los cambios, ¿verdad?

Entonces, ya están unos campos de eso, o sería agregar otro, ¿verdad? Como el de inglés no estaba.

**— Sí, si te fijas, aquí lo tengo por fondo, ¿verdad? Por fondo, ajá. Pero hay dos fondos. Irlanda, me imagino que ahí es porque aparece dos veces aquí en el filtro porque no lo dejé bien, voy a ver si lo puedo...**

Bueno, a ver si. Esas cosas de Excel, ¿verdad? que...

**— Se supone que aquí ya está, mira, Irlanda y Luxemburgo. Entonces aquí cada uno tiene sus... No todos aplican el mismo indicador y tienen los resultados.**

Entonces, por ejemplo, Fondo Luxemburgo del Output 1, la actividad está en inglés y en español, indicador 1.1 que dice número de programas de AS, que es educación integral de la sexualidad en la escuela, revisados, adoptados y/o validados, incluyendo enfoques culturalmente... Bueno, ahí está el indicador.

**— Aparece arriba de 2023 y ahí más bien quisiera tu opinión porque entonces dice que para el 2023, el año de referencia es uno, es decir, el primer año sí se priorizó y el Estado: Completado. Resultados: uno y aquí aparecen las observaciones.**

Sigamos con eso. Año de referencia en 2024 quiere decir que no se priorizó. De acuerdo?

**— Ok. Entonces ahí no hay, digamos, es como tal vez como hacer un pequeño filtrado. O sea, vos lo tenés ahí en una sola tabla horizontal, pero un filtrado de años para que te des esa información.**

Sí.

**— No desde arriba, sino que en la parte de la tabla.**

Sí, y aquí priorizado 2025 tampoco, 2026, el año de referencia es tres. Pero ¿por qué? Porque es el tercer año, ¿verdad? del programa, supuestamente de ese indicador. Sí se priorizó. Referencia a 2027, creo que este no es el último. Pero esa es la idea que vaya más o menos así.

**— Yo lo que creo ahí, Josué, que no se interpreta bien, ¿solo o estará o estoy equivocado? Dice año uno, año dos, no sería mejor el año relativo.**

Sí. Mejor, ¿verdad? Sí, pero hay algo que quiero y tal vez me ayudas. Por ejemplo, en 2023, estos no se priorizaron, ¿entendés? Entonces las actividades van a salir, no es que no se completaron, es que no se priorizaron, ¿verdad? Para no castigar la ejecución. El campo priorizado tiene mucho que ver. Entonces, 2023, sí, cambiémosle ahí por año, ¿verdad?

**— Totalmente. Sí. 2023, 2024, hasta el 2027. Esta información por Output está bien y los indicadores que aparecen ahí en esas tarjetas me aparecen bien. Aquí sacaría lo de Output, pondría actividad, código de actividad, o sea, a partir de acá. Y el indicador con el resultado y los comentarios, esos comentarios van aquí en la columna.**

Exactamente, sí. Por año, por año y ver si se puede agregar, o sea, si limpio aquí quiere decir que voy a ver todos los años, entonces sería el acumulativo de esos años.

**— El acumulativo, ajá, sí. Eso en cuanto a esto, ¿verdad? Parte de resultados. Para Outputs. No sé si ponerle outputs o resultados.**

Outputs está bien, ¿verdad? Sí, o los resultados no suenan mal, depende de las personas que lo mire también. ¿Verdad? Si entienden el lenguaje técnico.

**— Sí, y aplicar bien los filtros para esto está genial. Pero ponerlo un resumen también por el fondo, ¿verdad? Son dos fondos, Irlanda y Luxemburgo. Y eso. ¿Aquí en indicadores esto todavía necesita algunas mejoras, pero yo te lo voy indicando.**

Y en provisión de anticonceptivos hay una tabla. Espérame, es que tengo mil cosas.

**— Ya me imagino ahí. Medio cargado que te estaban haciendo una aplicación también, un aplicativo.**

Sí. El tema de la planificación familiar, pero esa es otra cosa. Híjole, bastante en varios proyectos.

**— Espérame. Solo me lo mando porque seguro. ¿Y qué MacBook tenés?**

Una MacBook Pro 2019, si no me equivoco.

**— Todavía es Intel. Ah, ok. Pero yo tuve una Intel del 2016, en el estudio ahí con Edgardo, le rumbé renderizando videos y todo eso y me duró hasta el 2022 que me tiró el pencazo porque solo la abrí la pantalla y el flex o algo se apagó, ya no. Pero sí son potentes.**

No es mala, pero por ejemplo, a veces entra en un como en una descarga total. O sea, se muere, pues.

**— Tema de batería?**

Sí, estaba dando un curso y no me fijé que este indicador estaba como intermitente, entonces estaba entre cargando y no cargando. Y no aguantó porque lo tenía conectado a monitor, varias cosas. Y de repente en medio del curso, pum, se apagó. Eso fue como a las 6:00 de la tarde. La dejé cargando y no encendió hasta el día siguiente como a las cuatro o 5 de la tarde. Y dije, hasta aquí, esa es la segunda vez que me pasa.

**— Ok, ah sí. ¿Y no te tiró alguna alerta?**

Sí, pero como no me fijé. Aquí, mira, decía, bueno, ahorita dice, recomienda dar mantenimiento.

**— Ah, sí, eso me salió en la anterior a mí. Ya eso sí es de batería. Entonces estoy entre con la excusa perfecta para comprarme un nuevo...**

Sí. Lo que pasa es que son tan caras.

**— Sí. La M4, M5 salió ahorita, son unos monstruos. Yo tengo una M2, creo que Edgardo tiene una M1. Y son mucho mejores.**

Mi hermano tiene una M2, tiene 96 de memoria RAM y me la vende como en 60000 pesos.

**— No estás nada mal. Pero no lo sé. Voy a esperar mejor.**

Sí, ahorita también, por menos precio creo que conseguís la M4 o M5 que salió ahorita. La de gama súper alta es de 4000, 5 mil dólares y hay otras de 2000, mil y algo.

**— Sí, yo creo que en una de 2 mil y pico, 2300. Nueva y te vas con una ya más arriba M4. Y lo que añoro también es el puerto HDMI. Ahí para no andar ese dongle, porque siempre lo tengo que andar.**

Sí, sí, eso sí. La M2 ya tiene de HDMI.

**— Y lo que estaba viendo también, no sé si vos jugabas en consola. En el Play 5. Es que han salido unos buenos handhelds. Hay uno de Asus que se llama ROG. Un ROG de Lenovo, porque antes tenía una Lenovo Legion y andan con 500, 600 dólares y lo podés conectar al monitor, le ponés un PC de mano.**

Sí, y por ahí me iba también.

**— Yo miré que ayer la ROG Ally Light bajó de precio.**

Sí, entonces por ahí me quiero también tirar a ver qué.

**— Ah, no sabía que jugabas.**

De vez en cuando ahorita. Eso lo desestresa.

**— Yo también, yo antes jugaba un montón, ahora para desestresarme un poco y me alivia. Juego FIFA, juego Battlefield, esas cosas. Y bueno, pero a veces llego a la casa, me pongo a jugar y me aburro rápido, me da sueño.**

Que ahora sí tiene los aparatos, pero ya no el tiempo para jugar.

**— Claro. Entonces, mira, hermano, aquí está. Esto debería de alimentar este. Tenemos establecimiento de salud, tipo, región, municipio, región sanitaria. Mes, año, código del método de planificación. El atributo es saldo inicial, cantidad recibida y ahí todos tienen el mismo atributo, ¿verdad? Saldo final, saldo inicial. Y el valor quiere decir que, por ejemplo, el saldo inicial fueron 40, saldo final 46 y no consumieron ninguno. En mayo de 2024 y así sucesivamente.**

Entonces este creo que ya te lo había pasado, pero con datos viejos.

**— Sí, ¿datos actualizados? Sí. Entonces, no deberíamos demostrar todo esto, más bien solamente el tipo de método y el consumo, ¿verdad? El método. Porque la transacción no importa en realidad, porque no vamos a mostrar nada más que cuánto se consumió. Entonces solamente ver la mejor forma de poderlo mostrar.**

Ok.

**— ¿Qué es lo que me interesa? En la Ceiba, cuánto se consumió de cada uno de los métodos. Eso es todo. Por los filtros, ¿verdad? Por departamentos, municipio, año, mes.**

Así es. Todo lo que se pueda mostrar y está aquí, mira. Entonces eso sería nada más.

**— Si pudiéramos el atributo, pero después filtrarlo por consumo, por este es un registro, todo lo que podamos mostrar de ese registro.**

Ok. Sí, en eso sí información. Bien pudiéramos mostrar tarjetitas por método.

**— Fíjate que sí. Y lo demás son filtros. Y ahí el gráfico está súper bien. Se podría ser, yo a veces agrego dos opciones, un Switch con lista o tarjetas, ¿verdad? Así se puede ver la información, en lista, en filas y tarjetas también.**

Ajá. Está bien.

**— Bueno, vos míralo y te debo dos archivos, este métodos y el otro que vimos que se llama Avance de actividades LNOB. Exactamente. Solo tengamos el cuidado acá, mira, creo que no es el Fabs, Dice Dash por salud, debería de ser Dashboard LNOB.**

A, ok, en la pestaña. Ajá. Provisión de anticonceptivos. Eso sería por mientras y el tema este de los resultados de los outputs, la idea es tener un formulario que yo le pueda meter información sobre los resultados, la fecha y estos comentarios que son observaciones cualitativas. Para cada línea, cada línea de indicador. Acuérdate que lo medimos por indicador.

**— Por indicador, sí, y me queda claro. Ajá. Entonces eso sería de momento, si querés por lo demás, y te debo, perdón también, yo voy a conseguir estos datos, ¿verdad? por el mapa.**

Sí, los del mapa. Ajá. Y por lo menos para empezar y después lo vamos a cambiar.

**— Sí, sí, no está bien. No sé si la imagen esa se la vas a cambiar o vas a poner otras.**

Todos también. Voy a buscar a pedir algunas y te las mando.

**— Ok. ¿Hasta cuántas imágenes se pueden poner ahí?**

Varias, las que quieras.

**— Ah bueno, voy a poner con un efecto, así como están ahorita. O pueden alimentar otra parte también como para darle otro caché a la plataforma, puede ser.**

Muy bien, está bien.

**— OK, te paso ahorita eso.**

Sí, está bien. Espérame antes de que terminemos.

**— Dale. ¿A qué sos fanático de jugar?**

Mira, me gustan los de mundo abierto. Por ejemplo, Red Dead.

**— Ah, que no lo he probado.**

Te lo recomiendo. Sí, ese es muy bueno. Tanto el uno como el 2.

**— Bueno, recientemente yo le había dado fin al uno en el 2011, 2010 por ahí. Hace poco lo volví a jugar, en diciembre, enero. Le terminé otra vez.**

Eso es muy bueno.

**— ¿Vos recomendarías ir del uno primero?**

Es que el dos es la precuela del uno. Lo que pasa es que hay un mundo de diferencia en gráficas, es un monstruo. Es uno de los mejores juegos de estos años. Cinemáticamente se mira increíble. Cuando jugás el 2, cuando pasás al 1, extrañás toda esa parte visual. Pero la esencia es el uno.

**— Sí, tenés el Plus del PlayStation, creo que ahorita está gratis.**

Ah, sí, he visto que se pone en oferta o te lo meten dentro del paquete de Plus.

**— Y también el FC, ¿verdad? El FIFA ahora. Me he vuelto bien duro porque juego en temporadas en línea. A veces juego con algunos amigos, pero hay unas fieras ahí.**

Mira, a veces que en vez de relajarme termino con cólera.

**— Termina uno frustrado. Sí, por un lag así. Esos lags matan.**

Y el otro que te recomiendo es uno que lo empecé a jugar hace poco. Se llama Death Stranding. ¿Has visto Walking Dead?

**— Sí, soy fanático de Walking Dead. Tengo años de no verla, pero sí miré hasta la sexta o séptima temporada, creo.**

Bueno, el creador es Kojima. Y aparece Norman Reedus como personaje.

**— Ah, sí, sí, lo he visto. Te lo recomiendo.**

Solo que dice necesita dejar un buen tiempo, porque son de mundos abiertos en que ir completando misiones.

**— Ahorita en Semana Santa, voy a probar ese de Red Redemption.**

Sí, te lo recomiendo. Está bueno.

**— Entonces, no, listo, dale, ahí estamos hablando. Sí, perfecto, yo te aviso para ir subiendo los ajustes y que los observes ahí, me hacés comentarios o lo que sea.**

Dale, brother, muchas gracias. Bueno, pues no, a vos, Josué, que estés bien, dale.
