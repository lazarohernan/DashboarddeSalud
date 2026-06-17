BEGIN;
TRUNCATE TABLE
    indicadores_kpi_resultados,
    indicadores_kpi,
    indicador_avance_anual,
    indicadores_actividad,
    provision_consumo,
    estandares_calidad,
    establecimientos,
    comunidades,
    municipios,
    metodos_anticonceptivos,
    ejes_calidad,
    outputs
  RESTART IDENTITY CASCADE;
INSERT INTO municipios (nombre, departamento_id)
      SELECT 'La Ceiba', d.id FROM departamentos d WHERE d.nombre = 'Atlántida'
      ON CONFLICT (nombre, departamento_id) DO NOTHING;
INSERT INTO municipios (nombre, departamento_id)
      SELECT 'Iriona', d.id FROM departamentos d WHERE d.nombre = 'Colón'
      ON CONFLICT (nombre, departamento_id) DO NOTHING;
INSERT INTO municipios (nombre, departamento_id)
      SELECT 'Santa Fe', d.id FROM departamentos d WHERE d.nombre = 'Gracias a Dios'
      ON CONFLICT (nombre, departamento_id) DO NOTHING;
INSERT INTO municipios (nombre, departamento_id)
      SELECT 'Limón', d.id FROM departamentos d WHERE d.nombre = 'Islas de la Bahía'
      ON CONFLICT (nombre, departamento_id) DO NOTHING;
INSERT INTO municipios (nombre, departamento_id)
      SELECT 'Santa Rosa de Aguán', d.id FROM departamentos d WHERE d.nombre = 'Colón'
      ON CONFLICT (nombre, departamento_id) DO NOTHING;
INSERT INTO municipios (nombre, departamento_id)
      SELECT 'Wampusirpi', d.id FROM departamentos d WHERE d.nombre = 'Gracias a Dios'
      ON CONFLICT (nombre, departamento_id) DO NOTHING;
INSERT INTO municipios (nombre, departamento_id)
      SELECT 'José Santos Guardiola', d.id FROM departamentos d WHERE d.nombre = 'Islas de la Bahía'
      ON CONFLICT (nombre, departamento_id) DO NOTHING;
INSERT INTO municipios (nombre, departamento_id)
      SELECT 'Jose Santos Guardiola', d.id FROM departamentos d WHERE d.nombre = 'Islas de la Bahía'
      ON CONFLICT (nombre, departamento_id) DO NOTHING;
INSERT INTO municipios (nombre, departamento_id)
      SELECT 'Santa Rosa de Aguan', d.id FROM departamentos d WHERE d.nombre = 'Colón'
      ON CONFLICT (nombre, departamento_id) DO NOTHING;
INSERT INTO municipios (nombre, departamento_id)
      SELECT 'Bonito Occidental', d.id FROM departamentos d WHERE d.nombre = 'Colón'
      ON CONFLICT (nombre, departamento_id) DO NOTHING;
INSERT INTO comunidades (nombre, municipio_id)
      SELECT 'Cusuna', m.id
      FROM municipios m
      JOIN departamentos d ON d.id = m.departamento_id
      WHERE m.nombre = 'Iriona'
        AND d.id = 2
      ON CONFLICT (nombre, municipio_id) DO NOTHING;
INSERT INTO comunidades (nombre, municipio_id)
      SELECT 'Sangrelaya', m.id
      FROM municipios m
      JOIN departamentos d ON d.id = m.departamento_id
      WHERE m.nombre = 'Iriona'
        AND d.id = 2
      ON CONFLICT (nombre, municipio_id) DO NOTHING;
INSERT INTO ejes_calidad (codigo, nombre) VALUES ('1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los servicios de salud.')
      ON CONFLICT (codigo) DO UPDATE SET nombre = EXCLUDED.nombre;
INSERT INTO ejes_calidad (codigo, nombre) VALUES ('2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.')
      ON CONFLICT (codigo) DO UPDATE SET nombre = EXCLUDED.nombre;
INSERT INTO ejes_calidad (codigo, nombre) VALUES ('3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.')
      ON CONFLICT (codigo) DO UPDATE SET nombre = EXCLUDED.nombre;
INSERT INTO ejes_calidad (codigo, nombre) VALUES ('4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.')
      ON CONFLICT (codigo) DO UPDATE SET nombre = EXCLUDED.nombre;
INSERT INTO ejes_calidad (codigo, nombre) VALUES ('5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.')
      ON CONFLICT (codigo) DO UPDATE SET nombre = EXCLUDED.nombre;
INSERT INTO ejes_calidad (codigo, nombre) VALUES ('6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.')
      ON CONFLICT (codigo) DO UPDATE SET nombre = EXCLUDED.nombre;
INSERT INTO ejes_calidad (codigo, nombre) VALUES ('7', 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.')
      ON CONFLICT (codigo) DO UPDATE SET nombre = EXCLUDED.nombre;
INSERT INTO ejes_calidad (codigo, nombre) VALUES ('8', 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.')
      ON CONFLICT (codigo) DO UPDATE SET nombre = EXCLUDED.nombre;
INSERT INTO metodos_anticonceptivos (codigo, nombre) VALUES (12, 'Agujas descartables N22')
      ON CONFLICT (nombre) DO UPDATE SET codigo = EXCLUDED.codigo;
INSERT INTO metodos_anticonceptivos (codigo, nombre) VALUES (9, 'Condones')
      ON CONFLICT (nombre) DO UPDATE SET codigo = EXCLUDED.codigo;
INSERT INTO metodos_anticonceptivos (codigo, nombre) VALUES (9, 'Condones Masculinos')
      ON CONFLICT (nombre) DO UPDATE SET codigo = EXCLUDED.codigo;
INSERT INTO metodos_anticonceptivos (codigo, nombre) VALUES (2, 'DIU (Liberador de Levonorgestrel)')
      ON CONFLICT (nombre) DO UPDATE SET codigo = EXCLUDED.codigo;
INSERT INTO metodos_anticonceptivos (codigo, nombre) VALUES (1, 'DIU (T de cobre 380 A)')
      ON CONFLICT (nombre) DO UPDATE SET codigo = EXCLUDED.codigo;
INSERT INTO metodos_anticonceptivos (codigo, nombre) VALUES (10, 'Depoprovera')
      ON CONFLICT (nombre) DO UPDATE SET codigo = EXCLUDED.codigo;
INSERT INTO metodos_anticonceptivos (codigo, nombre) VALUES (3, 'Implante')
      ON CONFLICT (nombre) DO UPDATE SET codigo = EXCLUDED.codigo;
INSERT INTO metodos_anticonceptivos (codigo, nombre) VALUES (3, 'Implantes Sub dérmnicos (Etonogestrel 68 mg)')
      ON CONFLICT (nombre) DO UPDATE SET codigo = EXCLUDED.codigo;
INSERT INTO metodos_anticonceptivos (codigo, nombre) VALUES (6, 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)')
      ON CONFLICT (nombre) DO UPDATE SET codigo = EXCLUDED.codigo;
INSERT INTO metodos_anticonceptivos (codigo, nombre) VALUES (5, 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)')
      ON CONFLICT (nombre) DO UPDATE SET codigo = EXCLUDED.codigo;
INSERT INTO metodos_anticonceptivos (codigo, nombre) VALUES (11, 'Jadelle')
      ON CONFLICT (nombre) DO UPDATE SET codigo = EXCLUDED.codigo;
INSERT INTO metodos_anticonceptivos (codigo, nombre) VALUES (8, 'Levonorgestrel 1.6 mg (Tab)')
      ON CONFLICT (nombre) DO UPDATE SET codigo = EXCLUDED.codigo;
INSERT INTO metodos_anticonceptivos (codigo, nombre) VALUES (11, 'Levonorgestrel 2x75 mg (Jadelle)')
      ON CONFLICT (nombre) DO UPDATE SET codigo = EXCLUDED.codigo;
INSERT INTO metodos_anticonceptivos (codigo, nombre) VALUES (7, 'Orales')
      ON CONFLICT (nombre) DO UPDATE SET codigo = EXCLUDED.codigo;
INSERT INTO metodos_anticonceptivos (codigo, nombre) VALUES (7, 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)')
      ON CONFLICT (nombre) DO UPDATE SET codigo = EXCLUDED.codigo;
INSERT INTO metodos_anticonceptivos (codigo, nombre) VALUES (8, 'PAE (Levonorgestrel 1.5 mg) (4)')
      ON CONFLICT (nombre) DO UPDATE SET codigo = EXCLUDED.codigo;
INSERT INTO metodos_anticonceptivos (codigo, nombre) VALUES (4, 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)')
      ON CONFLICT (nombre) DO UPDATE SET codigo = EXCLUDED.codigo;
INSERT INTO establecimientos (nombre, tipo_establecimiento_id, municipio_id, departamento_id, comunidad_id)
      SELECT 'Centro de Salud Cusuna', t.id, m.id, d.id, c.id
      FROM tipos_establecimiento t
      JOIN municipios m ON m.nombre = 'Iriona'
      JOIN departamentos d ON d.id = m.departamento_id AND d.nombre = 'Colón'
      LEFT JOIN comunidades c ON c.nombre = 'Cusuna' AND c.municipio_id = m.id
      WHERE t.nombre = 'UAPS';
INSERT INTO establecimientos (nombre, tipo_establecimiento_id, municipio_id, departamento_id, comunidad_id)
      SELECT 'Centro de Salud Sangrelaya', t.id, m.id, d.id, c.id
      FROM tipos_establecimiento t
      JOIN municipios m ON m.nombre = 'Iriona'
      JOIN departamentos d ON d.id = m.departamento_id AND d.nombre = 'Colón'
      LEFT JOIN comunidades c ON c.nombre = 'Sangrelaya' AND c.municipio_id = m.id
      WHERE t.nombre = 'CIS';
INSERT INTO outputs (codigo, nombre) VALUES (1, 'Fortalecimiento de la educación sexual integral dentro y fuera de la escuela para adolescentes, niñas y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.')
      ON CONFLICT (codigo) DO UPDATE SET nombre = EXCLUDED.nombre;
INSERT INTO outputs (codigo, nombre) VALUES (2, 'Mejorar de la cobertura y acceso a servicios de salud sexual y reproductiva de alta calidad para adolescentes y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas en municipios seleccionados de la Costa Caribe centroamericana.')
      ON CONFLICT (codigo) DO UPDATE SET nombre = EXCLUDED.nombre;
INSERT INTO outputs (codigo, nombre) VALUES (3, 'Aumentar las capacidades de liderazgo y empoderamiento de mujeres y jóvenes de comunidades afrodescendientes, criollas, garífunas y miskitas para abogar por el cumplimiento de sus derechos, incluyendo la salud y los derechos sexuales y reproductivos.')
      ON CONFLICT (codigo) DO UPDATE SET nombre = EXCLUDED.nombre;
INSERT INTO outputs (codigo, nombre) VALUES (4, 'Contar con una Línea de base, seguimiento y evaluación')
      ON CONFLICT (codigo) DO UPDATE SET nombre = EXCLUDED.nombre;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '1.1', 'LUA57_1.1 Review, adapt and validate the national CSE programmes-in and out of school- ensuring the inclusion of culturally sensitive approaches, and the alignment with the international standards, and available in their own languages in Panama, Costa Rica, Honduras, Guatemala, and Belize.', NULL,
      '1.1', '# de programas de EIS en la escuela revisados, adaptados y/o validados, incluyendo enfoques culturalmente sensibles y disponibles en sus idiomas en los 6 países.'
    FROM outputs o, fondos f
    WHERE o.codigo = 1 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '1.2', 'IEA36_1.1 Development of a tool to calculate the impact of In and Out of School CSE on reducing adolescent pregnancy linked to improved adherence to contraceptive methods or else delay in initiation of sexual intercourse', NULL,
      '1.2', 'Número de estrategias implementadas para calcular el impacto de la EIS dentro y fuera de la escuela en la reducción del embarazo adolescente.'
    FROM outputs o, fondos f
    WHERE o.codigo = 1 AND f.nombre = 'Irlanda'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '1.3', 'LUA57_1.2 Designing, printing and publication of educational and promotional materials on CSE in-and out of school in Panama, Costa Rica, etc. please complete (Please note that activity includes expenses for design, printing and publishing services including expenses for printing of promotional materials, such as brochures, booklets, banners, etc.)', NULL,
      '1.3', '- # de materiales educativos y/o promocionales diseñados, impresos y publicados.'
    FROM outputs o, fondos f
    WHERE o.codigo = 1 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '1.4', 'LUA57_1.3 Carry out workshops to train facilitators on CSE out of school from selected CSOs located at community level in Panama, Costa Rica,  Honduras, Guatemala y Belize (Please note under this activity at least 2 workshops per each country per 2 days, with 15-20 participants; and the activity will start in the Year 2 of the project)', NULL,
      '1.4', '- # de talleres realizados desglosados por país y municipio - # de facilitadores capacitados por edad, sexo, raza y etnia, ubicación geográfica - % de facilitadores que dominan los conocimientos relevantes (Nota: uso de pruebas previas y posteriores)'
    FROM outputs o, fondos f
    WHERE o.codigo = 1 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '1.5', 'LUA57_1.4 Carry out workshops to train facilitators (teachers) on CSE in school from selected institutes/schools of the MoE located at community level in Panama, Costa Rica, Honduras, Guatemala y Belize (at least 1 workshop per each country per 2 days, with 15-20 participants).', NULL,
      '1.5', '# de talleres realizados desglosados por país y municipio # de docentes formados desglosados por edad, sexo, etnia - raza, ubicación geográfica'
    FROM outputs o, fondos f
    WHERE o.codigo = 1 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '1.6', 'IEA36_1.2 Enhanced capacity of teachers to implement out-of-school comprehensive sexuality education (CSE) strategies, aligned with the International Technical and Programmatic Guidelines on Comprehensive Sexuality Education Out of School, in prioritized municipalities of Costa Rica, Honduras, Guatemala, and Belize', NULL,
      '1.6', 'Número de docentes capacitados para la implementación adecuada de los programas/iniciativas de Educación Integral en Sexualidad (EIS) siguiendo estándares internacionales, incluidos enfoques culturalmente sensibles.'
    FROM outputs o, fondos f
    WHERE o.codigo = 1 AND f.nombre = 'Irlanda'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '1.7', 'LUA57_1.5 Implement workshops with the aim to train adolescents and young people who are out of schoool in CSE from selected municipalities in Panama, Costa Rica, Honduras, Guatemala, Belize (at least 1 workshops in selected comunities per country each year)', NULL,
      '1.7', '# de talleres realizados desagregados por país y municipio # de adolescentes capacitados desagregados por edad, sexo, etnia - raza, ubicación geográfica - % de adolescentes que dominan los conocimientos relevantes (Nota: uso de pruebas previas y posteriores)'
    FROM outputs o, fondos f
    WHERE o.codigo = 1 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '1.8', 'LUA57_1.6 Implement workshops to train adolescents and young people who are at schoool on CSE from selected institutes/ schools at community level in Panama, Costa Rica, Honduras, Guatemala, Belize (at least 1 workshops in selected comunities per country each year)', NULL,
      '1.8', '# de talleres realizados desagregados por país y municipio # de adolescentes capacitados desagregados por edad, sexo, etnia - raza, ubicación geográfica - % de adolescentes que dominan los conocimientos relevantes (Nota: utilizando pruebas previas y posteriores)'
    FROM outputs o, fondos f
    WHERE o.codigo = 1 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '1.9', 'LUA57_1.7 Design and implement a communication and advocay strategies at the community level to combat racism, xenophobia, and all forms of discrimination and promote CSE. (Please note that during the first year of the project, the strategy will be designed, including comunicational and advocacy products, and in the upcoming years the activities and events will be implemented)', NULL,
      '1.9', '# y tipo de actividades de comunicación y promoción realizadas por país y municipio # y tipo de productos de comunicación y promoción producidos desagregados por país'
    FROM outputs o, fondos f
    WHERE o.codigo = 1 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '1.1', 'IEA36_1.3 Communication and advocacy strategy at the community level to combat racism, xenophobia and all forms of discrimination and promote CSE', NULL,
      '1.1', 'Número de estrategias de comunicación implementadas que contribuyen a la promoción de la EIS y la erradicación del racismo y la discriminación racial'
    FROM outputs o, fondos f
    WHERE o.codigo = 1 AND f.nombre = 'Irlanda'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '1.11', 'LUA57_1.8 Project personnel costs (technical and operational)', NULL,
      '1.11', '# de asistente administrativo local contratado oportunamente y de calidad por localidad / # de oficiales de enlace locales contratados oportunamente y de calidad por ubicación'
    FROM outputs o, fondos f
    WHERE o.codigo = 1 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '2.1', 'LUA57_2.1 Review and adapt national SRH and GBV norms, protocols, guidelines, and counseling, in coordination with the MoH to ensure the inclusion of evidence-based standards, ensuring culturally sensitive approaches and the adoption of life- course. (Please note that activity will include sub-activities such as to hire consultants, designing, printing, and publishing normative documents, brochures, posters, flipcharts, etc. as well as translation, if it is requiered. This activity will be started in the last quarter of the first year of the project and will be completed in the second quarter of the second year of the project).', NULL,
      '2.1', '# de normas, y/o protocolos y directrices revisadas, adaptadas y/o validadas desglosadas por área: SDSR, violencia de género y país'
    FROM outputs o, fondos f
    WHERE o.codigo = 2 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '2.2', 'IEA36_2.1 Identified barriers to access to health services for Afro-descendant adolescents and young people in Costa Rica, Guatemala, Honduras, and Belize; as well as action strategies to eliminate these barriers', NULL,
      '2.2', '# de iniciativas emprendidas para abordar las barreras al acceso a la salud para adolescentes y jóvenes en comunidades selectas de la costa caribeña de Costa Rica, Guatemala, Honduras y Belice # de iniciativas desarrolladas para fortalecer el acceso de adolescentes y jóvenes afrodescendientes a los servicios de salud.'
    FROM outputs o, fondos f
    WHERE o.codigo = 2 AND f.nombre = 'Irlanda'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '2.3', 'IEA36_2.2 Strengthen health service responses to the Afro-descendant adolescent population by measuring the quality standards of sexual and reproductive health services for adolescents in the municipalities prioritized by the project', NULL,
      '2.3', 'Fortalecimiento de los servicios de salud para adolescentes en comunidades de la Costa Caribe de Costa Rica, Honduras, Guatemala y Belice y donde viven poblaciones afrodescendientes'
    FROM outputs o, fondos f
    WHERE o.codigo = 2 AND f.nombre = 'Irlanda'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '2.4', 'LUA57_2.2 Designing, printing and publication of information and promotional materials on SRHR, including family planning- LARCs- and GBV including (Please note that this activity includes expenses for design, printing, publishing services, and distribution costs, as well as translation when it will be needed. The information and promotional material will include for example, brochures, booklets, banners, etc. These materials will be distributed at the health care units at municipality levels, as well among the adolescents and young people and women that use these services)', NULL,
      '2.4', '# de Materiales informativos y/o promocionales diseñados, impresos y/o distribuidos por país y municipio'
    FROM outputs o, fondos f
    WHERE o.codigo = 2 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '2.5', 'LUA57_2.3 Sub-regional workshop on LARCs (Long-Acting Reversible Contraception- IUDs and implants) to train health care providers, in full four days training ( please note that this activity will gather at least 30 participants from the selected health care units at municipality level. For this activity, through the project will be possible to hire a SRHR NGO with training experience in this area)', NULL,
      '2.5', '- Taller realizado oportunamente y de calidad - # de proveedores de atención médica capacitados por edad, sexo, raza, etnia, ubicación geográfica - % de proveedores de atención médica que dominan los conocimientos relevantes (Nota: uso de pruebas previas y posteriores)'
    FROM outputs o, fondos f
    WHERE o.codigo = 2 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '2.6', 'LUA57_2.4 Implement workshops to train health care providers from selected health services at local level in Sexual and Reproductive Health and Rights (SRHR) and GBV norms, protocols, guidelines, and counseling with particular focus on the elimination of cultural barriers as well as to the international standards for quality health services for adolescents established by WHO and UNFPA. (Please note that this activity will be implemented in the years 2, 3, and 4. At least 2 workshops per year in selected municipalities with 20-30 participants in each country).', NULL,
      '2.6', '# de talleres realizados desglosados por país y municipio # de proveedores de atención médica capacitados por edad, sexo, raza, etnia, ubicación geográfica - % de proveedores de salud que dominan los conocimientos relevantes (Nota: uso de pruebas previas y posteriores)'
    FROM outputs o, fondos f
    WHERE o.codigo = 2 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '2.7', 'IEA36_2.3 Strengthen the capacities and tools of locally selected healthcare providers in the areas of standards, protocols, guidelines, and counseling on sexual and reproductive health and rights (SRHR) and gender-based violence, with a special focus on eliminating cultural barriers, racial stereotypes, and approaching services from an intercultural and ethno-racial perspective', NULL,
      '2.7', 'Número de proveedores de atención de la salud capacitados para prestar servicios de alta calidad en SSR a mujeres, adolescentes y jóvenes, centrándose en la eliminación de barreras, incluidos el racismo y la discriminación, y en enfoques que tengan en cuenta las diferencias culturales'
    FROM outputs o, fondos f
    WHERE o.codigo = 2 AND f.nombre = 'Irlanda'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '2.8', 'LUA57_2.5 Carry out workshops at local level on LARCs (Long-Acting Reversible Contraception- IUDs and implants) to train health care providers, in full three-days training, including theory and practice. (Please note that this activity will be implemented in the year 2, 3, and 4. At least 1 workshop per year in selected municipalities with 20 participants in each country, and a refreshed training will be conducted in the year 3 of the project. For this activity, through the project will be possible to hire a SRHR NGO with training experience in this area) Maybe sub-regional training', NULL,
      '2.8', '-# de talleres realizados desglosados por país y municipio -# de proveedores de atención médica capacitados por edad, sexo, raza, etnia, ubicación geográfica - % de proveedores de atención médica que dominan los conocimientos relevantes (Nota: uso de pruebas previas y posteriores)'
    FROM outputs o, fondos f
    WHERE o.codigo = 2 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '2.9', 'LUA57_2.6 Sub-regional workshop on SRHR, GBV and Culturally Sensitive Approaches with the aim to discuss the impact of discrimination, racism, and exclusion on women''s, and girls'' health (Maternal health, Adolescent Pregnancy, Unmet needs for Familiy Planning)', NULL,
      '2.9', '- Taller subregional realizado de manera oportuna y de calidad -# de proveedores de atención médica capacitados por edad, sexo, raza, etnia, ubicación geográfica - % de proveedores de atención médica que dominan el conocimiento relevante (Nota: uso de pruebas previas y posteriores)'
    FROM outputs o, fondos f
    WHERE o.codigo = 2 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '2.1', 'LUA57_2.7 Provide medical equipment and/or commodities for SRH care for adolescents and women in selected health units, including funds for project staff travel', NULL,
      '2.1', '# de unidades de atención médica equipadas con equipos médicos para la atención de SHR desagregadas por país y municipio'
    FROM outputs o, fondos f
    WHERE o.codigo = 2 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '2.11', 'IEA36_2.4 Provide medical equipment and/or commodities for SRH care for adolescents and women in selected health units (Ensure access to a full range of contraceptive methods, including long-acting reversible contraceptives (LARCs)', NULL,
      '2.11', 'Número de unidades de atención de salud equipadas con equipo médico para la atención de SHR, desglosado por país'
    FROM outputs o, fondos f
    WHERE o.codigo = 2 AND f.nombre = 'Irlanda'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '2.12', 'LUA57_2.8 Develop and implement a communication and advocacy strategy using innovative approaches to increase informed demand for high quality SRH services, including modern contraception, prevention of GBV and sexual violence and the prevention of adolescent pregnancy with focus on women, adolescents, and young people in the selected municipalities. (Please note that to do this the project could established alliance and partnerships with NGOs, hire consultants, etc. It is estimated at least Euros 10,000 per each municipality involved in the project, to develop the strategy and other Euros 10,000 for the implementation. In addition to that, the beneficiaries of the strategy must be involved in the design and implementation of the strategy.)', NULL,
      '2.12', '- Estrategia de comunicación y promoción desarrollada e implementada - # y tipo de actividades realizadas desagregadas por país y municipio (ferias de salud, desfiles, reuniones, APPs, foros de cine, etc.) - Número y tipo de alianzas y asociaciones desarrolladas para la implementación de la estrategia (gobiernos locales, OSC, ONG, sector privado, etc.)'
    FROM outputs o, fondos f
    WHERE o.codigo = 2 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '2.13', 'IEA36_2.5 Communication and advocacy strategy using innovative approaches to increase informed demand for high quality SRH services, including modern contraception, prevention of GBV and sexual violence and the prevention of adolescent pregnancy with focus on women, adolescents, and young people of African descent', NULL,
      '2.13', 'Número de iniciativas implementadas para mejorar el acceso a los servicios de salud de los adolescentes desatendidos en las comunidades afrodescendientes de Centroamérica a través de actividades de sensibilización, movilización comunitaria y comunicación'
    FROM outputs o, fondos f
    WHERE o.codigo = 2 AND f.nombre = 'Irlanda'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '2.14', 'LUA57_2.9 Project personnel (Technical and operational)', NULL,
      '2.14', '# de oficiales de enlace locales contratados oportunamente y de calidad por ubicación
# de asistente administrativo local contratado oportunamente y de calidad por localidad'
    FROM outputs o, fondos f
    WHERE o.codigo = 2 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '3.1', 'LUA57_3.1 Review, adapted and validate the UNFPA courses on Youth Participation and Empowerment, using culturally sensitive approaches with the aim to strengthen the skills of Afro-descendant and Garifuna Adolescents and Youth on issues related to human rights, sexual and reproductive rights and gender equailty, as well as their right to participate in political, strategic and decision-making spaces on issues that affect their lives, inlcuding bodily autonomy, positive masculinities, prevention of GBV, including sexual violence, leadership, and participation. (Please note that these materials will be available in their own languages, and will include the human rights-based approaches, and must include the vision, needs and views of the young people).', NULL,
      '3.1', '# de cursos del UNFPA sobre participación y liderazgo de los jóvenes revisados, adaptados y/o validados, desglosados por país'
    FROM outputs o, fondos f
    WHERE o.codigo = 3 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '3.2', 'LUA57_3.2 Carry out workshops to train facilitators on the course of AD Youth Participation and Empowerment from selected NGOS/CSOs and stakeholders located at community level in Panama, Costa Rica, Honduras, Guatemala y Belize (at least 1 workshop per each country per 2 days, with 15-20 participants).', NULL,
      '3.2', '- # de talleres realizados desagregados por país y municipio - # de facilitadores capacitados por edad, sexo, raza, etnia, ubicación geográfica y ONG - % de facilitadores que han dominado sus conocimientos (utilizando pruebas previas y posteriores)'
    FROM outputs o, fondos f
    WHERE o.codigo = 3 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '3.3', 'LUA57_3.3 Engage selected NGOs/CSOs from national and/or local levels to carry out the implementation and follow up of the training course on Youth Participation and Empowerment three times a year in selected municipalities of the project and support the establisment of AD Youth Neworks (PLease note that this activity will train at least 50 young people per course in each municipality, per year, and a follow up meeting with the trainees per year. This activity will be implemented using an Implementing Partner Agreement modality and/or a modality that will allow the project to support other stakeholders).', NULL,
      '3.3', '- # de ONG/OSC comprometidas para implementar el curso de capacitación desglosado por país y municipio - # de adolescentes y jóvenes capacitados desglosados por sexo, raza, etnia, ubicación geográfica - # de redes y/o plataformas establecidas y/o apoyadas - % de adolescentes y jóvenes que han dominado sus conocimientos (utilizando pruebas previas y posteriores), -#Menstrual materiales educativos para la salud y artículos de higiene menstrual reutilizables entregados.'
    FROM outputs o, fondos f
    WHERE o.codigo = 3 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '3.4', 'LUA57_3.4 Involved selected NGOs and/or CSOs to develop and carry out workshops to strengthen skills and competencies to change discriminatory social and gender norms, inlcuding positive masculinities, prevention of GBV, including social violence, to train adolescents and youth, school teachers, health care providers, parents and other relevant participants. (Please note that this activity will be implemented using an Implementing Partner Agreement modality and/or a modality that will allow the project to support other stakeholders, and it is expected to carry out 2 workshops with 25 participants per each municipality per year).', NULL,
      '3.4', '-# de talleres realizados desagregados por país, municipio y ONG implementadora - # de personas capacitadas por grupo desagregadas por sexo, edad, etnia, ubicación geográfica * Grupos: Adolescentes y Jóvenes; Mujeres líderes, madres y padres; organizaciones gubernamentales: maestros, proveedores de atención médica, etc.-'
    FROM outputs o, fondos f
    WHERE o.codigo = 3 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '3.5', 'LUA57_3.5 Develop and implement a series of workshops to support the strengthening and articulation of the Afro-descendant''s, Garifuna and Miskito Women and Youth Networks to improve their knowledge around the Montevideo Consensus on Population and Development, the 2030 Agenda, the Programme of Activities of the International Decade for AD, the Durban Declaration, with particular focus to fulfill the rights of people of African-descents, Garifuna, Creole, Miskito and Indigenous People and the UN Mechanisms to support their rights, including the UN Permanet Forum for People of Africandescendant and the UN Permanent Forum for Indigenous Peoples. (Please note that this activity will include at least two workshops – two full days- to train the project ‘s beneficiaries- community leaders-per year, with the participation of 20 leaders from the areas of the project, per country).', NULL,
      '3.5', '- # de talleres realizados desagregados por condado y municipio - # de personas capacitadas por sexo, edad, raza, etnia, ubicación geográfica - # redes apoyadas desagregadas por raza, etnia y ubicación geográfica'
    FROM outputs o, fondos f
    WHERE o.codigo = 3 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '3.6', 'IEA36_3.1 Support the strengthening and articulation of the Afro-descendant''s Women and Youth Networks; Afro-descendantt''s CSO, including social movements; Afro-descendant''s platforms and academic organizations; to discuss relevant issues around the Montevideo Consensus on Population and Development, the 2030 Agenda, the Programme of Activities of the International Decade for AD, the Durban Declaration, with particular focus to fulfill the rights of people of African descents, Garifuna, Creole, Miskito and Indigenous People and the UN Mechanisms to support their rights, including the UN Permanent Forum of People of African Descent and the UN Permanent Forum for Indigenous Peoples.', NULL,
      '3.6', '# de organizaciones de la sociedad civil y comunitarias con capacidades fortalecidas en liderazgo y empoderamiento para abogar por los derechos sexuales y reproductivos de las mujeres y los jóvenes y la igualdad de género, apoyados por el proyecto.                                # de adolescentes, jóvenes y mujeres con capacidades fortalecidas para abogar por los derechos de las mujeres y los jóvenes en derechos sexuales y reproductivos e igualdad de género, incluida la promoción de masculinidades positivas.'
    FROM outputs o, fondos f
    WHERE o.codigo = 3 AND f.nombre = 'Irlanda'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '3.7', 'IEA36_3.2 Strengthen skills and competencies of selected NGOs and/or CSOs to change discriminatory social and gender norms, including positive masculinities, prevention of GBV, including social violence, to train adolescents and youth, school teachers, health care providers, parents and other relevant participants', NULL,
      '3.7', 'Número de iniciativas locales de prevención del embarazo adolescente que se implementan con la participación de adolescentes y jóvenes en municipios seleccionados.'
    FROM outputs o, fondos f
    WHERE o.codigo = 3 AND f.nombre = 'Irlanda'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '3.8', 'LUA57_3.6 Support strategic dialogues and conversations, cultural events, participation of women and youth leaders at global and regional events and celebrations at local levels around the agenda of African Descent and Indigenous Peoples, as well as to commemorate the contribution of the African descent and Indigenous to their contribution to culture, heritage, and development of their countries and communities, particularly on the UN special days for the commemoration of the International Day of People of African Descent and the International Day of the World’s Indigenous People. (This activity will carry out once a year at the local level, and when appropriate at regional or /and global level)', NULL,
      '3.8', '-# y tipo de diálogos estratégicos y/o eventos culturales, realizados desagregados por país y municipio -# de líderes locales apoyados para participar en eventos globales y regionales por edad, sexo, raza, etnia, ubicación geográfica'
    FROM outputs o, fondos f
    WHERE o.codigo = 3 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '3.9', 'LUA57_3.7 Project personnel (Technical and operational)', NULL,
      '3.9', '# de oficiales de enlace locales contratados oportunamente y de calidad por ubicación
# de asistente administrativo local contratado oportunamente y de calidad por localidad'
    FROM outputs o, fondos f
    WHERE o.codigo = 3 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '4.1', 'LUA57_4.1 Conduct a baseline study in order to be able to determine the level of impact expected and to enable the monitoring of the project''s results and impact. (Please note that the purpose of the baseline data is to provide a benchmark from which to measure progress of the project through an in-depth situation analysis and needs assessment of project''s outputs in the target municipalities per each country. The baseline data will also cover interventions by municipalities, service providers, Afro-descendant adolescent, Garifuna, Creole and Miskito''s youth and women groups, traditional leaders, etc. in order to understand the people needs. Thus, this survey will attempt to provide the current status of the indicators in the results framework and facilitate monitoring of progress towards meeting project outputs. (Please note that to do this, the project will requiere to hire a team of experts, among other tasks requiered undar this activity. This activity will be coordinated by the Regional Office).', NULL,
      '4.1', 'Estudio de referencia realizado en 6 países'
    FROM outputs o, fondos f
    WHERE o.codigo = 4 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '4.2', 'IEA36_4.1 Development of an Accelerator methodology for the identification of causes that prevent faster progress in reducing adolescent pregnancy in the Afro-descendant population of the project countries.', NULL,
      '4.2', 'Documento de sistematización del modelo acelerador y sus recomendaciones.'
    FROM outputs o, fondos f
    WHERE o.codigo = 4 AND f.nombre = 'Irlanda'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '4.3', 'LUA57_4.2 Mid-Term Evaluation of the project. It will be carried out, with the purpose of providing an overview of the progress made to date, identifying both the difficulties encountered and the facilitating elements, extracting lessons learned and making recommendations that will allow UNFPA as the implementing agency, in coordination with the Government of Luxembourg to define the course of action and the most relevant strategies to achieve the outputs set forth in the project. (Please note that the Mid Term Evaluation will be conductud en the first Q of the third year of the implementation of the project. A team of experts will be hire to conduct this evaluation, which will be coordinated by the UNFPA Regional Office and wit the support of the Gov. of Luxembourg).', NULL,
      '4.3', 'Evaluación intermedia realizada # de recomendaciones y acciones implementadas para la mejora de los resultados del proyecto'
    FROM outputs o, fondos f
    WHERE o.codigo = 4 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '4.4', 'IEA36_4.2 Systematization and evaluation of the implementation, dissemination of learning and evaluation of project results in its 3 phases', NULL,
      '4.4', 'Evaluación de los resultados del proyecto en sus diferentes fases'
    FROM outputs o, fondos f
    WHERE o.codigo = 4 AND f.nombre = 'Irlanda'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '4.5', 'LUA57_4.3 Conduct a final evaluation of the project. This activity will take place in the last year of the project implementation.', NULL,
      '4.5', 'Evaluación final realizada # de reuniones realizadas para difundir los hallazgos, lecciones aprendidas y recomendaciones desagregadas por país y municipios'
    FROM outputs o, fondos f
    WHERE o.codigo = 4 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '4.6', 'LUA57_4.4 Carry out Annual Planning Meetings to prepare the annual works plans per country. This meetings will be organized by the Regional Office in coordination with the Gov. of Luxembourg. ( Please note this meeting will be carry out at the begining of the year, every year)', NULL,
      '4.6', 'Reunión Anual de Planificación realizada # de Planes de Trabajo Anuales aprobados e implementados desagregados por país'
    FROM outputs o, fondos f
    WHERE o.codigo = 4 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '4.7', 'IEA36_4.3 Carry out Annual Planning Meetings to prepare the annual works plans per country.', NULL,
      '4.7', 'Documento de sistematización del proceso de planificación anual y sus respectivos planes de trabajo.'
    FROM outputs o, fondos f
    WHERE o.codigo = 4 AND f.nombre = 'Irlanda'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '4.8', 'LUA57_4.5 Carry out Annual Jointly Monitoring field visits, in selected countries and muncipalities. (Please note that the UNFPA Regional Team and the Gov. of Luxembourg will organize a field visit each year in selected countries)', NULL,
      '4.8', '# de Visiones Anuales Conjuntas de Campo realizadas desagregadas por país y municipios % de acciones acordadas implementadas desagregadas por país y municipio'
    FROM outputs o, fondos f
    WHERE o.codigo = 4 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '4.9', 'IEA36_4.4 Carry out Annual Jointly Monitoring field visits, in selected countries and municipalities.', NULL,
      '4.9', 'Visitas anuales conjuntas de supervisión realizadas'
    FROM outputs o, fondos f
    WHERE o.codigo = 4 AND f.nombre = 'Irlanda'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '4.1', 'IEA36_4.5 Project results socialization with key stakeholders, for the presentation of final results, lessons learned, and recommendations', NULL,
      '4.1', 'Participación de las partes interesadas en la difusión de los resultados del proyecto'
    FROM outputs o, fondos f
    WHERE o.codigo = 4 AND f.nombre = 'Irlanda'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicadores_actividad (
      output_id, fondo_id, cod_actividad, actividad_ingles, actividad_espanol,
      codigo_indicador, descripcion_indicador
    )
    SELECT o.id, f.id, '4.11', 'LUA57_4.6 Project presonnel costs ( Technical and operational)', NULL,
      '4.11', 'Coordinador regional de proyectos contratado a tiempo y de calidad Asistente administrativo contratado a tiempo y calidad'
    FROM outputs o, fondos f
    WHERE o.codigo = 4 AND f.nombre = 'Luxemburgo'
    ON CONFLICT (output_id, codigo_indicador, fondo_id) DO UPDATE SET
      cod_actividad = EXCLUDED.cod_actividad,
      actividad_ingles = EXCLUDED.actividad_ingles,
      actividad_espanol = EXCLUDED.actividad_espanol,
      descripcion_indicador = EXCLUDED.descripcion_indicador;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 1, true,
        'Completado'::estado_actividad,
        '1', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 0, false,
        'Completado'::estado_actividad,
        '0', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, 3, true,
        NULL,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, 3, true,
        NULL,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.2'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.2'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 1, true,
        'Completado'::estado_actividad,
        '1', 'Desarrollo de herramienta para calcular el impacto de la EIS, fuera y dentro de la escuela, con el apoyo técnico del FLACSO Argentina y la colaboración de líderes comunitarios y autoridades gubernamentales y oficina UNFPA Honduras.'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.2'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.2'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.2'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 1, true,
        'Completado'::estado_actividad,
        '1 paquete de afiches informativos sobre el proyecto LNOB', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.3'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 0, false,
        'Completado'::estado_actividad,
        '0', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.3'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.3'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.3'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.3'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 1, true,
        'Completado'::estado_actividad,
        '46 facilitadores de OSC', 'Los participantes se conformaron: líderes comunitarios, coordinadores de equipos de futbol, mujeres, periodistas, comunicadores, autoridades locales, etc.'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.4'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, true,
        'Completado'::estado_actividad,
        '121 facilitadores de OSC', 'Los participantes se conformaron: líderes comunitarios, coordinadores de equipos de futbol, mujeres, periodistas, comunicadores, autoridades locales, etc.'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.4'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.4'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.4'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.4'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 1, true,
        'Completado'::estado_actividad,
        '4 docentes', 'Como resultado del diagnóstico inicial comunitario para el proyecto, se tomó la decisión de unificar los talleres de fortalecimiento de capacidades con los líderes comunitarios y docentes, dadas las condiciones complejas sobre la percepción del tema (resistencia inicial y estigmas  ante la EIS)'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, true,
        'Completado'::estado_actividad,
        '21 docentes', 'Como resultado del diagnóstico inicial comunitario para el proyecto, se tomó la decisión de unificar los talleres de fortalecimiento de capacidades con los líderes comunitarios y docentes, dadas las condiciones complejas sobre la percepción del tema (resistencia inicial y estigmas  ante la EIS)'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.6'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.6'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 1, true,
        'Completado'::estado_actividad,
        '170 docentes', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.6'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.6'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.6'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 1, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.7'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, true,
        'Completado'::estado_actividad,
        '50', 'Acordarse de los medios de verificación: listados'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.7'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.7'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.7'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.7'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 1, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, true,
        'Completado'::estado_actividad,
        '230', 'Acordarse de los medios de verificación: listados'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.9'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, true,
        'Completado'::estado_actividad,
        'Diseñados e implementados juegos lúdicos para adolescentes y jóvenes (bingo, mural interactivo)', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.9'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.9'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.9'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.9'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.1'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.1'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 1, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.1'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.1'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.1'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 1, true,
        'Completado'::estado_actividad,
        '1 Coordinadora de proyectos, 1 Asistente administrativo contratados', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.11'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 1, true,
        'Completado'::estado_actividad,
        '1 Coordinadora de proyectos, 1 Asistente administrativo contratados', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.11'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.11'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.11'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 1
        AND ia.codigo_indicador = '1.11'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 1, true,
        'Completado'::estado_actividad,
        '1', 'Revisión y actualización del protocolo de atención a víctimas sobrevivientes de violencia sexual'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, true,
        'Completado'::estado_actividad,
        '1', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.2'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.2'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 1, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.2'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.2'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.2'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.3'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.3'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 1, true,
        'Completado'::estado_actividad,
        '1', 'Diseño de la herramienta para el seguimiento y monitoreo del autodiagnóstico de estándares de calidad de los servicios de salud.'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.3'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.3'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.3'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.4'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.4'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.4'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.4'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.4'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 1, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, true,
        'Completado'::estado_actividad,
        'Participación de 5 proveedores de salud representantes de los 4 departamentos priorizados para el proyecto en el taller subregional llevado a cabo en Panamá', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 1, true,
        'Completado'::estado_actividad,
        '29 proveedores de salud capacitados de los 4 departamentos priorizados del proyecto', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.6'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, true,
        'Completado'::estado_actividad,
        '25 proveedores sanitarios', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.6'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.6'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.6'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.6'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.7'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.7'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 1, true,
        'Completado'::estado_actividad,
        '1', 'Elaboración de una guía práctica de consejería en anticoncepción para adolescentes con enfoque de género, interculturalidad y derechos humanos.'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.7'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.7'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.7'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, true,
        'Completado'::estado_actividad,
        '50 profesionales sanitarios', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.9'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.9'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.9'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.9'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.9'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 1, true,
        'Completado'::estado_actividad,
        'Distribuidos los equipamientos médicos en los establecimientos', 'Recibidos en 2024'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, true,
        'Completado'::estado_actividad,
        'Distribuidos los equipamientos médicos en los establecimientos', 'Recibidos en 2024'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.11'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.11'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 1, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.11'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.11'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.11'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.12'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, true,
        'Completado'::estado_actividad,
        'Implementación de alianza con comunicadores y periodistas afrohondureños', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.12'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.12'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.12'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.12'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.13'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.13'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 1, true,
        'Completado'::estado_actividad,
        '1', 'Diseño e implementación de una estrategia de comunicación para aumentar la demanda informada de los Servicios de Salud en coordinación con la red de comunicadores y periodistas afrohondureños.'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.13'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.13'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.13'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 1, true,
        'Completado'::estado_actividad,
        '1 Coordinadora de proyectos, 1 Asistente administrativo contratados', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.14'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, true,
        'Completado'::estado_actividad,
        '1 Coordinadora de proyectos, 1 Asistente administrativo contratados', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.14'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.14'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.14'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 2
        AND ia.codigo_indicador = '2.14'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 1, true,
        'Completado'::estado_actividad,
        '1', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, true,
        'Completado'::estado_actividad,
        '1', 'Talleres de masculinidades positivas, de VBG.'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 1, true,
        'Completado'::estado_actividad,
        'Desarrollo de grupo focal con líderes comunitarios para la validación de materiales de la implementación del curso de participación y empoderamiento con Ashanti Perú.', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.2'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, true,
        'Completado'::estado_actividad,
        '15 jóvenes facilitadores', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.2'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.2'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.2'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.2'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.3'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, true,
        'Completado'::estado_actividad,
        '297 adolescentes y jóvenes capacitados', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.3'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.3'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.3'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.3'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.4'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, true,
        'Completado'::estado_actividad,
        '7 talleres realizados con la participación de 210 adolescentes  jóvenes, líderes y autoridades locales capacitadas', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.4'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.4'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.4'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.4'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, true,
        'Completado'::estado_actividad,
        '1 taller con la participación de 30 lideresas comunitarias', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.6'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.6'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 1, true,
        'Completado'::estado_actividad,
        '1', 'Actualización y formulación de la política pública de la mujer indígena y afrohondureña en coordinación con la red de mujerees indigenas y afrohondureñas y la SEDESOL.'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.6'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.6'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.6'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.7'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.7'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 1, true,
        'Completado'::estado_actividad,
        '167', 'Padres, Madres y Cuidadores(as) distribuidos en los 7 municipios. 144 mujeres, 23 hombres.'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.7'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.7'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.7'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 1, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, true,
        'Completado'::estado_actividad,
        'Realización de 3 actividades conmemorativas de la agenda afro: concurso tejiendo nuestras raíces garífunas dirigido a adolescentes y jóvenes, producción y lanzamiento del cortometraje sobre la trayectoria de Bertha Arzú, Desarrollo de encuentros de juventud afrohondureña con la participación de 80 jóvenes. Participación en la 5ta reunión de la conferencia regional sobre población y desarrollo y el foro permanente de los afrodescendientes (una persona joven para cada evento)', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 1, true,
        'Completado'::estado_actividad,
        '1 Coordinadora de proyectos, 1 Asistente administrativo contratados', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.9'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, true,
        'Completado'::estado_actividad,
        '1 Coordinadora de proyectos, 1 Asistente administrativo contratados', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.9'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.9'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.9'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 3
        AND ia.codigo_indicador = '3.9'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.1'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.2'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.2'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 1, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.2'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.2'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.2'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.3'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.3'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.3'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.3'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.3'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.4'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.4'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 1, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.4'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.4'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.4'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.5'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.6'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.6'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.6'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.6'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.6'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.7'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.7'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 1, true,
        'Completado'::estado_actividad,
        '1', NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.7'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.7'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.7'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.8'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.9'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.9'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 1, true,
        'Completado'::estado_actividad,
        '7', 'Visitas de seguimiento, monitoreo a los diferentes municipios seleccionados.'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.9'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.9'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.9'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.1'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.1'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 1, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.1'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.1'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.1'
        AND f.nombre = 'Irlanda'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2023, 0, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.11'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2024, 2, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.11'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2025, 0, false,
        'No Completado'::estado_actividad,
        '0', 'Reprogramado'
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.11'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2026, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.11'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO indicador_avance_anual (
        indicador_id, anio, anio_referencia, priorizado, estado, resultado, observaciones
      )
      SELECT ia.id, 2027, NULL, false,
        'No Aplica'::estado_actividad,
        NULL, NULL
      FROM indicadores_actividad ia
      JOIN outputs o ON o.id = ia.output_id
      JOIN fondos f ON f.id = ia.fondo_id
      WHERE o.codigo = 4
        AND ia.codigo_indicador = '4.11'
        AND f.nombre = 'Luxemburgo'
      ON CONFLICT (indicador_id, anio) DO UPDATE SET
        anio_referencia = EXCLUDED.anio_referencia,
        priorizado = EXCLUDED.priorizado,
        estado = EXCLUDED.estado,
        resultado = EXCLUDED.resultado,
        observaciones = EXCLUDED.observaciones;
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Mayo', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Mayo', 2024,
      ma.id, 61
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Depoprovera'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Mayo', 2024,
      ma.id, 75
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Mayo', 2024,
      ma.id, 750
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Mayo', 2024,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implante'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Mayo', 2024,
      ma.id, 6
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Jadelle'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 4
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 62
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Depoprovera'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 84
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 720
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 4
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implante'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Jadelle'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Enero', 2024,
      ma.id, 1880
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Enero', 2024,
      ma.id, 11
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Enero', 2024,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Enero', 2024,
      ma.id, 15
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Enero', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Enero', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Enero', 2024,
      ma.id, 15
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Agujas descartables N22'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Febrero', 2024,
      ma.id, 1368
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Febrero', 2024,
      ma.id, 8
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Febrero', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Febrero', 2024,
      ma.id, 9
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Febrero', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Febrero', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Febrero', 2024,
      ma.id, 9
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Agujas descartables N22'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Marzo', 2024,
      ma.id, 8127
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Marzo', 2024,
      ma.id, 9
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Marzo', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Marzo', 2024,
      ma.id, 6
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Marzo', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Marzo', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Marzo', 2024,
      ma.id, 6
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Agujas descartables N22'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Abril', 2024,
      ma.id, 1480
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Abril', 2024,
      ma.id, 13
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Abril', 2024,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Abril', 2024,
      ma.id, 12
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Abril', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Abril', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Abril', 2024,
      ma.id, 12
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Agujas descartables N22'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Mayo', 2024,
      ma.id, 720
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Mayo', 2024,
      ma.id, 8
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Mayo', 2024,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Mayo', 2024,
      ma.id, 9
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Mayo', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Mayo', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Mayo', 2024,
      ma.id, 9
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Agujas descartables N22'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Junio', 2024,
      ma.id, 240
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Junio', 2024,
      ma.id, 7
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Junio', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Junio', 2024,
      ma.id, 7
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Junio', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Junio', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Junio', 2024,
      ma.id, 7
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Agujas descartables N22'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Julio', 2024,
      ma.id, 400
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Julio', 2024,
      ma.id, 9
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Julio', 2024,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Julio', 2024,
      ma.id, 15
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Julio', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Julio', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Julio', 2024,
      ma.id, 15
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Agujas descartables N22'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Julio', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Levonorgestrel 2x75 mg (Jadelle)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Julio', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Levonorgestrel 1.6 mg (Tab)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Agosto', 2024,
      ma.id, 842
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Agosto', 2024,
      ma.id, 3
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Agosto', 2024,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Agosto', 2024,
      ma.id, 6
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Agosto', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Agosto', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Agosto', 2024,
      ma.id, 6
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Agujas descartables N22'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Agosto', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Levonorgestrel 2x75 mg (Jadelle)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Agosto', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Levonorgestrel 1.6 mg (Tab)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Septiembre', 2024,
      ma.id, 1082
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Septiembre', 2024,
      ma.id, 15
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Septiembre', 2024,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Septiembre', 2024,
      ma.id, 7
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Septiembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Septiembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Septiembre', 2024,
      ma.id, 7
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Agujas descartables N22'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Septiembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Levonorgestrel 2x75 mg (Jadelle)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Septiembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Levonorgestrel 1.6 mg (Tab)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Octubre', 2024,
      ma.id, 2178
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Octubre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Octubre', 2024,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Octubre', 2024,
      ma.id, 8
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Octubre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Octubre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Octubre', 2024,
      ma.id, 8
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Agujas descartables N22'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Octubre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Levonorgestrel 2x75 mg (Jadelle)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Octubre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Levonorgestrel 1.6 mg (Tab)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Noviembre', 2024,
      ma.id, 590
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Noviembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Noviembre', 2024,
      ma.id, 7
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Noviembre', 2024,
      ma.id, 3
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Noviembre', 2024,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Noviembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Noviembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Agujas descartables N22'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Noviembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Levonorgestrel 2x75 mg (Jadelle)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Noviembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Levonorgestrel 1.6 mg (Tab)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 120
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 6
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Agujas descartables N22'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Levonorgestrel 2x75 mg (Jadelle)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Levonorgestrel 1.6 mg (Tab)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Enero', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Enero', 2024,
      ma.id, 18
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Enero', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Enero', 2024,
      ma.id, 1460
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Enero', 2024,
      ma.id, 3
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implante'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Febrero', 2024,
      ma.id, 105
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Febrero', 2024,
      ma.id, 20
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Febrero', 2024,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Febrero', 2024,
      ma.id, 1584
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Febrero', 2024,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implante'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Abril', 2024,
      ma.id, 60
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Abril', 2024,
      ma.id, 20
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Abril', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Abril', 2024,
      ma.id, 3000
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Abril', 2024,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implante'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Mayo', 2024,
      ma.id, 18
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Mayo', 2024,
      ma.id, 12
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Mayo', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Mayo', 2024,
      ma.id, 800
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Mayo', 2024,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implante'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Junio', 2024,
      ma.id, 25
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Junio', 2024,
      ma.id, 20
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Junio', 2024,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Junio', 2024,
      ma.id, 3600
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Junio', 2024,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implante'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Julio', 2024,
      ma.id, 6
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Julio', 2024,
      ma.id, 18
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Julio', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Julio', 2024,
      ma.id, 2760
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Julio', 2024,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implante'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Agosto', 2024,
      ma.id, 41
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Agosto', 2024,
      ma.id, 21
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Agosto', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Agosto', 2024,
      ma.id, 1040
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Agosto', 2024,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implante'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Septiembre', 2024,
      ma.id, 68
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Septiembre', 2024,
      ma.id, 8
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Septiembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Septiembre', 2024,
      ma.id, 1200
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Septiembre', 2024,
      ma.id, 4
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implante'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Octubre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Octubre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Octubre', 2024,
      ma.id, 3
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Octubre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Octubre', 2024,
      ma.id, 17
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Octubre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Octubre', 2024,
      ma.id, 37
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Octubre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Octubre', 2024,
      ma.id, 2600
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Noviembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Noviembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Noviembre', 2024,
      ma.id, 6
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Noviembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Noviembre', 2024,
      ma.id, 16
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Noviembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Noviembre', 2024,
      ma.id, 21
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Noviembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Noviembre', 2024,
      ma.id, 1200
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 13
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 4
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Diciembre', 2024,
      ma.id, 2600
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Enero', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Enero', 2025,
      ma.id, 17
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Enero', 2025,
      ma.id, 990
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Febrero', 2025,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Febrero', 2025,
      ma.id, 19
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Febrero', 2025,
      ma.id, 1020
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Marzo', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Marzo', 2025,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Marzo', 2025,
      ma.id, 25
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Abril', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Abril', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Abril', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Abril', 2025,
      ma.id, 15
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Abril', 2025,
      ma.id, 1010
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Mayo', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Mayo', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Mayo', 2025,
      ma.id, 15
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Mayo', 2025,
      ma.id, 144
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Junio', 2025,
      ma.id, 16
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Junio', 2025,
      ma.id, 868
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Julio', 2025,
      ma.id, 20
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Julio', 2025,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Julio', 2025,
      ma.id, 21
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Julio', 2025,
      ma.id, 990
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Agosto', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Agosto', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Agosto', 2025,
      ma.id, 11
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Septiembre', 2025,
      ma.id, 16
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Septiembre', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Septiembre', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Septiembre', 2025,
      ma.id, 1110
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Octubre', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Octubre', 2025,
      ma.id, 15
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Octubre', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Octubre', 2025,
      ma.id, 27
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Guadalupe', 'ZPP', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 15
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 9
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 726
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 3
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 15
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 15
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 1034
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 8
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 31
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 874
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 4
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 12
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 792
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 3
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 12
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 45
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 864
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 18
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 11
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 729
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 3
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 28
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 780
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 17
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 5
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 816
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 13
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 10
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 756
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 15
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 22
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Cusuna', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 900
    FROM riss r
    JOIN municipios m ON m.nombre = 'Iriona'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'B.Oriental';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 15
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 14
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 167
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 4
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 23
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 218
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 19
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 204
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 4
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 20
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 208
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 3
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 18
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 4
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 28
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 90
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 9
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 204
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 29
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 6
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 298
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 16
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 3
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Dos Bocas', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 288
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Rosa de Aguan'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 26
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 33
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 1008
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 12
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 6
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 60
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 12
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 64
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 2955
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 4
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 14
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 14
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 4
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 7
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 6
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 288
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 12
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 23
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 3
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 12
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 12
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 20
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 904
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 11
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 12
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 5
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 6
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 6
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 18
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 64
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 1483
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Diciembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Diciembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Diciembre', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Diciembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Diciembre', 2025,
      ma.id, 11
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Diciembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Diciembre', 2025,
      ma.id, 30
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Diciembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Limón', 'CIS', r.id, m.id, 'Diciembre', 2025,
      ma.id, 576
    FROM riss r
    JOIN municipios m ON m.nombre = 'Bonito Occidental'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Limón';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 3
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 23
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 490
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 3
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 28
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 910
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 10
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 1188
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 4
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 7
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 50
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 2250
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 84
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 15
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 1596
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 4
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 8
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 19
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 69
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 4
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 2574
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 3
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 3
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 54
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 45
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 10
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 3312
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 3
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 42
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 60
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 1890
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 3
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 33
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 87
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 10
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Politilly B', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 3210
    FROM riss r
    JOIN municipios m ON m.nombre = 'Jose Santos Guardiola'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Roatán';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Enero', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Enero', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Enero', 2025,
      ma.id, 12
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Enero', 2025,
      ma.id, 4
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Enero', 2025,
      ma.id, 1152
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Febrero', 2025,
      ma.id, 7
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Febrero', 2025,
      ma.id, 7
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Febrero', 2025,
      ma.id, 1488
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Marzo', 2025,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Marzo', 2025,
      ma.id, 8
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Marzo', 2025,
      ma.id, 7
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Marzo', 2025,
      ma.id, 1318
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Abril', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Abril', 2025,
      ma.id, 12
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Abril', 2025,
      ma.id, 4
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Abril', 2025,
      ma.id, 4886
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Mayo', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Mayo', 2025,
      ma.id, 14
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Mayo', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Mayo', 2025,
      ma.id, 650
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Junio', 2025,
      ma.id, 19
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Junio', 2025,
      ma.id, 1040
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Julio', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Julio', 2025,
      ma.id, 14
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Julio', 2025,
      ma.id, 9
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Julio', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Julio', 2025,
      ma.id, 1388
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Agosto', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Agosto', 2025,
      ma.id, 3
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Agosto', 2025,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Agosto', 2025,
      ma.id, 1542
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 3
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 4
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 12
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 7880
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Octubre', 2025,
      ma.id, 2
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Octubre', 2025,
      ma.id, 11
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Octubre', 2025,
      ma.id, 9
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Octubre', 2025,
      ma.id, 3
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Sambo Creek', 'UAPS', r.id, m.id, 'Octubre', 2025,
      ma.id, 1050
    FROM riss r
    JOIN municipios m ON m.nombre = 'La Ceiba'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Atlantida';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 16
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 12
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Enero', 2025,
      ma.id, 1290
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 4
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 12
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Febrero', 2025,
      ma.id, 1300
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 10
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 23
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Marzo', 2025,
      ma.id, 1290
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 6
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 20
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Abril', 2025,
      ma.id, 1300
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 22
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Mayo', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 13
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Junio', 2025,
      ma.id, 900
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 18
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Julio', 2025,
      ma.id, 2010
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 4
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 21
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 1
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 24
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Agosto', 2025,
      ma.id, 1300
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 6
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 23
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 24
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Septiembre', 2025,
      ma.id, 1290
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (T de cobre 380 A)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'DIU (Liberador de Levonorgestrel)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Implantes Sub dérmnicos (Etonogestrel 68 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'implantes Sub dérmnicos (Levonorgestrel 75x2  mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 17
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Medroxiprogeserona 150 mg/ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Inyectable trimestral de progestina sola (Acetato de Medroxiprogeserona 104 mg/0.65 ml)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 33
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Orales combinados (Etinil Estradiol 0.3 mg + Levonorgestrel 0.15 mg)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 0
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'PAE (Levonorgestrel 1.5 mg) (4)'
    WHERE r.nombre = 'Trujillo';
INSERT INTO provision_consumo (
      nombre_establecimiento, tipo_establecimiento, riss_id, municipio_id, mes, anio, metodo_id, consumo
    )
    SELECT 'Santa Fe', 'CIS', r.id, m.id, 'Octubre', 2025,
      ma.id, 1290
    FROM riss r
    JOIN municipios m ON m.nombre = 'Santa Fe'
    JOIN metodos_anticonceptivos ma ON ma.nombre = 'Condones Masculinos'
    WHERE r.nombre = 'Trujillo';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.1', '1.1 ¿El establecimiento de salud divulga información sobre la importancia de la
prevención del embarazo en adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.2', '1.2 ¿Las y los adolescentes tienen acceso a informaciones sobre prevención del
embarazo en adolescentes?(en los establecimientos de salud, en los centros
educativos y en la comunidad)',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.3', '1.3 ¿Existen materiales de divulgación en los centros educativos sobre la atención de
salud de adolescentes? (horarios, tipos de atención, etc.)',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.4', '1.4 ¿Existe señalización interna y externa de la atención de adolescentes en el
establecimiento de salud?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.5', '1.5 ¿El establecimiento de salud tiene informaciones en afiches o posters sobre los
cuidados de salud integral de adolescentes mujeres y hombres?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.6', '1.6 ¿Existen murales o carteles sobre salud sexual y reproductiva para adolescentes
mujeres y hombres en el establecimiento de salud?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.7', '1.7 ¿En el establecimiento de salud, hay carteles o afiches sobre los derechos
sexuales y reproductivos de adolescentes?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.8', '1.8 ¿El establecimiento de salud tiene carteles o afiches sobre el derecho a consultar sin
la mamá, el papá o tutor?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.9', '1.9 ¿El establecimiento de salud tiene mural informativo o afiches sobre métodos
anticonceptivos?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.10', '1.10 ¿En el establecimiento de salud hay algún cartel informando a los adolescentes que
tienen derecho de recibir condones sin necesidad de consulta?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.11', '1.11 ¿El establecimiento de salud tiene mural informativo o afiches sobre ITS/VIH-Sida?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.12', '1.12 ¿El establecimiento de salud tiene señalización y afiches sobre la atención pre-
natal de adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.13', '1.13 ¿El establecimiento de salud tiene mural informativo o afiches sobre violencia
basada en género?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.14', '1.14 ¿El establecimiento de salud tiene mural informativo o afiche sobre violencia
sexual?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.1', '2.1 ¿El personal de salud informa padres, madres, tutores y organizaciones comunitarias
sobre la importancia de ofrecer servicios de salud sexual y reproductiva para
adolescentes?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.2', '2.2 ¿El establecimiento de salud cuenta con materiales de apoyo para informar a padres, madres o tutores y organizaciones comunitarias sobre la importancia de ofrecer servicios de salud sexual y reproductiva para adolescentes?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.3', '2.3 ¿La unidad cuenta con materiales de apoyo e informa a docentes sobre la
importancia de ofrecer servicios de salud sexual y reproductiva para adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.4', '2.4 ¿Padres, madres, tutores y otros miembros de la comunidad apoyan la educación
integral en sexualidad para adolescentes en los centros educativos?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.5', '2.5 ¿Padres, madres, tutores y otros miembros de la comunidad apoyan que los servicios de salud atiendan adolescentes en salud sexual y reproductiva?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.6', '2.6 ¿Padres, madres, tutores y otros miembros de la comunidad apoyan la utilización de métodos anticonceptivos por adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.7', '2.7 ¿Hay apoyo por parte de las iglesias para la prestación de servicios de salud sexual y reproductiva para adolescentes?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.8', '2.8 El establecimiento de salud tiene alianzas o acuerdos de colaboración para realizar actividades sobre derechos sexuales y reproductivos y salud sexual y reproductiva de adolescentes con ¿Centros educativos?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.9', '2.9  El establecimiento de salud tiene alianzas o acuerdos de colaboración para realizar actividades sobre derechos sexuales y reproductivos y salud sexual y reproductiva de adolescentes con ¿ONG?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.10', '2.10  El establecimiento de salud tiene alianzas o acuerdos de colaboración para realizar actividades sobre derechos sexuales y reproductivos y salud sexual y reproductiva de adolescentes con ¿Organizaciones comunitarias?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.11', '2.11 El establecimiento de salud tiene alianzas o acuerdos de colaboración para realizar actividades sobre derechos sexuales y reproductivos y salud sexual y reproductiva de adolescentes con ¿Organizaciones juveniles?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.12', '2.12  El establecimiento de salud tiene alianzas o acuerdos de colaboración para realizar actividades sobre derechos sexuales y reproductivos y salud sexual y reproductiva de adolescentes con ¿Organizaciones comunitarias? ¿Otras que actúan con adolescentes y jóvenes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.1', '3.1 ¿Los/as proveedores/as realizan acciones educativas sobre temas de salud sexual y reproductiva dentro y fuera de la unidad de salud?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.2', '3.2 ¿En el establecimiento de salud hay sala para acciones educativas?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.3', '3.3 ¿En el establecimiento de salud hay equipos como TV, data show, etc.?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.4', '3.4 ¿En el establecimiento de salud hay carteles educativos en SSR actualizados y
aprobados por la Secretaría de la Salud?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.5', '3.5 ¿Se realiza consejería en anticoncepción para adolescentes considerando la libertad de elección y las normas y guías de la Secretaria de Salud?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.6', '3.6 ¿Se ofrece consulta para el uso de anticoncepción para adolescentes, ofreciendo
toda la gama de métodos y siguiendo los criterios médicos de elegibilidad?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.7', '3.7 ¿Se realiza atención pre-natal de adolescentes con participación de la pareja?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.8', '3.8 ¿Se ofrece atención para adolescentes mujeres y hombres en ITS/VIH/Sida?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.9', '3.9 ¿Se ofrece atención para adolescentes víctimas de violencia basada en género?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.10', '3.10 ¿Se ofrece atención para adolescentes mujeres víctimas de violencia sexual?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.11', '3.11 ¿Se ofrece atención para adolescentes hombres víctimas de violencia sexual?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.12', '3.12 ¿Se realiza la consulta de salud integral de adolescentes mujeres y hombres con
enfoque de derechos y salud sexual y reproductiva?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.13', '3.13 ¿El establecimiento de salud cuenta con una red de apoyo para las víctimas de
violencia de género y/o sexual?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.14', '3.14 ¿En el establecimiento de salud hay normas para referencia de adolescentes
mujeres y hombres para servicios de mayor complejidad?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.1', '4.1 Número total de proveedores/as en su unidad de salud',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.2', '4.2 Número de proveedores/as capacitados/as en salud sexual y reproductiva
de adolescentes por Reprolatina',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.3', '4.3 Número de proveedores/as que necesita capacitación en adolescencia y
salud sexual y reproductiva',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.4', '4.4 ¿Los/as proveedores/as respetan los derechos sexuales y reproductivos de
adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.5', '4.5 ¿Los/as proveedores/as atienden adolescentes mujeres y hombres en salud sexual
y reproductiva sin exigir la presencia de los padres y/o tutores?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.6', '4.6 ¿Los/as proveedores/as atienden adolescentes con confidencialidad, con
privacidad y sin ningún tipo de discriminación?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.7', '4.7 ¿Los/as proveedores/as están capacitados/as para atender adolescentes con
orientación sexual homosexual?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.8', '4.8 ¿Los/as proveedores/as están capacitados/as para atender adolescentes
transexuales?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.9', '4.9 ¿Hay guías y normas de atención a la SSR de adolescentes fácilmente disponibles
para consulta en el establecimiento de salud?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.1', '4.10 ¿Los/as proveedores/as utilizan las guías y normas para la atención de
adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.11', '4.11 ¿El establecimiento de salud tiene una ficha específica para la atención de
adolescentes mujeres y hombres?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.1', '5.1 ¿El establecimiento de salud ofrece horarios específicos para la atención de
adolescentes mujeres y hombres?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.2', '5.2 ¿Las y los adolescentes son atendidos con y sin cita en el establecimiento de salud?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.3', '5.3 ¿El establecimiento de salud ofrece la consulta de atención integral de salud para
adolescentes mujeres y hombres con foco en la salud sexual y reproductiva?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.4', '5.4 ¿El establecimiento de salud entrega métodos anticonceptivos a las adolescentes
sin la autorización de los padres?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.5', '5.5 ¿El establecimiento de salud ofrece condones a libre demanda para adolescentes
sin necesidad de marcar consulta?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.6', '5.6 ¿Los horarios de atención de adolescentes en el establecimiento de salud son
compatibles con los horarios de los/as adolescentes que no están en el centro
educativo?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.7', '5.7 ¿El establecimiento de salud garantiza la confidencialidad de la atención de
adolescentes mujeres y hombres?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.8', '5.8 ¿Los consultorios tienen planchas de Tanner para ambos sexos?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.9', '5.9 ¿Los consultorios tienen gráficos de IMC e altura OMS para ambos sexos?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.10', '5.10 ¿El establecimiento de salud cuenta siempre con toda la gama de métodos
anticonceptivos para adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.11', '5.11 ¿El establecimiento de salud tiene, por lo menos, 3 kits completos (Espéculo,
histerómetro, tenáculo o pinza Pozzi, pinza Cheron, tijera) para colocar DIU?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.12', '5.12 ¿El establecimiento de salud tiene equipos para extracción de implantes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.13', '5.13 ¿El ambiente del establecimiento de salud es acogedor para adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.14', '5.14 ¿Hay higiene y limpieza en el establecimiento de salud?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.15', '5.15 ¿El lavamanos del consultorio tiene agua corriente?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.16', '5.16 ¿El lavamanos del consultorio tiene jabón?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.17', '5.17 ¿El/a proveedor/a se lava las manos después de atender a cada persona?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.18', '5.18 ¿El establecimiento de salud tiene agua potable, electricidad y saneamiento
básico?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.19', '5.19 ¿El establecimiento de salud tiene y sigue las normas de prevención de infecciones y de bioseguridad?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.20', '5.20 ¿El establecimiento de salud tiene acceso para personas con discapacidad',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.1', '6.1 ¿Existe acuerdo para la referencia de adolescentes mujeres y hombres desde el
centro educativo para el establecimiento de salud?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.2', '6.2 ¿Hay acceso al servicio sin discriminación de edad, sexo, escolarización, estado
civil, etnia, clase social, capacidad de pago, orientación sexual, identidad de
género, discapacidades u otras características?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.3', '6.3 ¿Los/as proveedores/as de salud tienen conocimiento del principio de equidad
para la atención de adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.4', '6.4 ¿El establecimiento de salud divulga la información de los horarios específicos para
adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.5', '6.5 ¿El establecimiento de salud tiene algún/a profesional designado/a como
coordinador/a de adolescentes en el servicio?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.6', '6.6 ¿En el establecimiento de salud hay folletos y afiches escritos con lenguaje
accesible para todos/as los/las adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.7', '6.7 ¿Folletos y carteles consideran la perspectiva de género y los derechos sexuales y
reproductivos?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.8', '6.8 ¿En el establecimiento de salud se realizan acciones educativas periódicas para
adolescentes sobre prevención del embarazo?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.9', '6.9 ¿El personal de salud realiza acciones educativas periódicas para adolescentes en
los centros educativos próximos del servicio sobre prevención del embarazo?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.10', '6.10 ¿El personal de salud realiza acciones educativas periódicas para adolescentes en la comunidad sobre prevención del embarazo?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.11', '6.11 ¿El personal de salud conoce cuáles son los grupos vulnerables de adolescentes enla comunidad?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.12', '6.12 ¿El personal promueve la participación de los grupos vulnerables de adolescentes
en las actividades del servicio de salud?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.13', '6.13 ¿El trato y actitud del personal de salud es amable, libre de prejuicios, y
respetuosa hacia toda la población adolescente, independientemente de edad,
sexo, escolarización, estado civil, etnia, clase social, capacidad de pago, orientación
sexual, identidad de género, discapacidades u otras características?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '7', 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.', '7.1', '7.1 ¿El establecimiento de salud tiene un sistema de registro con informaciones para
adolescentes mujeres de 10 a 14 años, en salud sexual y reproductiva?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '7';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '7', 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.', '7.2', '7.2 ¿El establecimiento de salud tiene un sistema de registro con informaciones para
adolescentes mujeres de 15 a 19 años en salud sexual y reproductiva?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '7';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '7', 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.', '7.3', '7.3 ¿El establecimiento de salud tiene un sistema de registro de informaciones para
adolescentes hombres de 10 a 14 en salud sexual y reproductiva?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '7';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '7', 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.', '7.4', '7.4 ¿El establecimiento de salud tiene un sistema de registro de informaciones para
adolescentes hombres de 15 a 19 en salud sexual y reproductiva?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '7';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '7', 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.', '7.5', '7.5 ¿Los/as proveedores/as reciben informes periódicos de los datos de atención de
adolescentes en salud sexual y reproductiva de la unidad?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '7';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '7', 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.', '7.6', '7.6 ¿El establecimiento de salud realiza reuniones periódicas para analizar las
informaciones de adolescentes en salud sexual y reproductiva?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '7';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '7', 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.', '7.7', '7.7 ¿Los/as proveedores/as del establecimiento de salud participan de la elaboración de un plan de acciones a partir del análisis de estas informaciones?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '7';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '7', 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.', '7.8', '7.8 ¿El establecimiento de salud tiene definidos estándares de calidad de atención?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '7';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '7', 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.', '7.9', '7.9 ¿El establecimiento de salud recibe visitas técnicas de la Región, por lo menos una
vez cada 6 meses, para monitorear la calidad de atención de adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '7';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '8', 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.', '8.1', '8.1 ¿Existe una política explícita del país para que participen los y las adolescentes en la planificación, seguimiento y evaluación de las acciones para adolescentes en los
servicios?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '8';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '8', 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.', '8.2', '8.2 ¿El establecimiento de salud ha implementado esa política?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '8';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '8', 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.', '8.3', '8.3 ¿Los/as adolescentes participan de las decisiones sobre las actividades del
establecimiento de salud dirigidas a la población adolescente?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '8';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '8', 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.', '8.4', '8.4 ¿El establecimiento de salud cuenta con estructura física para reuniones de grupos
de adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '8';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '8', 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.', '8.5', '8.5 ¿El establecimiento de salud tiene colaboración con organizaciones juveniles para
promover la participación de adolescentes en la unidad?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '8';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '8', 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.', '8.6', '8.6 ¿El establecimiento de salud tiene adolescentes capacitados/as para actuar como
educadores de pares?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '8';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '8', 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.', '8.7', '8.7 ¿El establecimiento de salud realiza capacitación de adolescentes para multiplicar informaciones y acciones de prevención en salud sexual y reproductiva a sus pares?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '8';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '8', 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.', '8.8', '8.8 ¿El establecimiento de salud tiene evaluación periódica de la calidad de la atención, realizada con base en la evaluación de adolescentes atendidos en la unidad?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '8';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Cusuna',
      'Centro de Salud Cusuna', 'UAPS',
      e.id, '8', 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.', '8.9', '8.9 ¿Los/as proveedores/as con los y las adolescentes capacitados/as se reúnen
periódicamente para analizar los datos de la evaluación de adolescentes sobre la
calidad de los servicios?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '8';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.1', '1.1 ¿El establecimiento de salud divulga información sobre la importancia de la
prevención del embarazo en adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.2', '1.2 ¿Las y los adolescentes tienen acceso a informaciones sobre prevención del
embarazo en adolescentes?(en los establecimientos de salud, en los centros
educativos y en la comunidad)',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.3', '1.3 ¿Existen materiales de divulgación en los centros educativos sobre la atención de
salud de adolescentes? (horarios, tipos de atención, etc.)',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.4', '1.4 ¿Existe señalización interna y externa de la atención de adolescentes en el
establecimiento de salud?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.5', '1.5 ¿El establecimiento de salud tiene informaciones en afiches o posters sobre los
cuidados de salud integral de adolescentes mujeres y hombres?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.6', '1.6 ¿Existen murales o carteles sobre salud sexual y reproductiva para adolescentes
mujeres y hombres en el establecimiento de salud?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.7', '1.7 ¿En el establecimiento de salud, hay carteles o afiches sobre los derechos
sexuales y reproductivos de adolescentes?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.8', '1.8 ¿El establecimiento de salud tiene carteles o afiches sobre el derecho a consultar sin
la mamá, el papá o tutor?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.9', '1.9 ¿El establecimiento de salud tiene mural informativo o afiches sobre métodos
anticonceptivos?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.10', '1.10 ¿En el establecimiento de salud hay algún cartel informando a los adolescentes que
tienen derecho de recibir condones sin necesidad de consulta?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.11', '1.11 ¿El establecimiento de salud tiene mural informativo o afiches sobre ITS/VIH-Sida?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.12', '1.12 ¿El establecimiento de salud tiene señalización y afiches sobre la atención pre-
natal de adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.13', '1.13 ¿El establecimiento de salud tiene mural informativo o afiches sobre violencia
basada en género?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '1', 'Los adolescentes están bien informados sobre su propia salud y saben dónde y cuándo obtener los
servicios de salud.', '1.14', '1.14 ¿El establecimiento de salud tiene mural informativo o afiche sobre violencia
sexual?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '1';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.1', '2.1 ¿El personal de salud informa padres, madres, tutores y organizaciones comunitarias
sobre la importancia de ofrecer servicios de salud sexual y reproductiva para
adolescentes?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.2', '2.2 ¿El establecimiento de salud cuenta con materiales de apoyo para informar a padres, madres o tutores y organizaciones comunitarias sobre la importancia de ofrecer servicios de salud sexual y reproductiva para adolescentes?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.3', '2.3 ¿La unidad cuenta con materiales de apoyo e informa a docentes sobre la
importancia de ofrecer servicios de salud sexual y reproductiva para adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.4', '2.4 ¿Padres, madres, tutores y otros miembros de la comunidad apoyan la educación
integral en sexualidad para adolescentes en los centros educativos?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.5', '2.5 ¿Padres, madres, tutores y otros miembros de la comunidad apoyan que los servicios de salud atiendan adolescentes en salud sexual y reproductiva?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.6', '2.6 ¿Padres, madres, tutores y otros miembros de la comunidad apoyan la utilización de métodos anticonceptivos por adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.7', '2.7 ¿Hay apoyo por parte de las iglesias para la prestación de servicios de salud sexual y reproductiva para adolescentes?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.8', '2.8 El establecimiento de salud tiene alianzas o acuerdos de colaboración para realizar actividades sobre derechos sexuales y reproductivos y salud sexual y reproductiva de adolescentes con ¿Centros educativos?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.9', '2.9  El establecimiento de salud tiene alianzas o acuerdos de colaboración para realizar actividades sobre derechos sexuales y reproductivos y salud sexual y reproductiva de adolescentes con ¿ONG?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.10', '2.10  El establecimiento de salud tiene alianzas o acuerdos de colaboración para realizar actividades sobre derechos sexuales y reproductivos y salud sexual y reproductiva de adolescentes con ¿Organizaciones comunitarias?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.11', '2.11 El establecimiento de salud tiene alianzas o acuerdos de colaboración para realizar actividades sobre derechos sexuales y reproductivos y salud sexual y reproductiva de adolescentes con ¿Organizaciones juveniles?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '2', 'Los padres, tutores y otros miembros de la comunidad y las organizaciones comunitarias reconocen el valor de la prestación de servicios de salud a los adolescentes. Apoyan dicha disposición y la utilización de los servicios por los adolescentes.', '2.12', '2.12  El establecimiento de salud tiene alianzas o acuerdos de colaboración para realizar actividades sobre derechos sexuales y reproductivos y salud sexual y reproductiva de adolescentes con ¿Organizaciones comunitarias? ¿Otras que actúan con adolescentes y jóvenes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '2';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.1', '3.1 ¿Los/as proveedores/as realizan acciones educativas sobre temas de salud sexual y reproductiva dentro y fuera de la unidad de salud?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.2', '3.2 ¿En el establecimiento de salud hay sala para acciones educativas?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.3', '3.3 ¿En el establecimiento de salud hay equipos como TV, data show, etc.?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.4', '3.4 ¿En el establecimiento de salud hay carteles educativos en SSR actualizados y
aprobados por la Secretaría de la Salud?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.5', '3.5 ¿Se realiza consejería en anticoncepción para adolescentes considerando la libertad de elección y las normas y guías de la Secretaria de Salud?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.6', '3.6 ¿Se ofrece consulta para el uso de anticoncepción para adolescentes, ofreciendo
toda la gama de métodos y siguiendo los criterios médicos de elegibilidad?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.7', '3.7 ¿Se realiza atención pre-natal de adolescentes con participación de la pareja?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.8', '3.8 ¿Se ofrece atención para adolescentes mujeres y hombres en ITS/VIH/Sida?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.9', '3.9 ¿Se ofrece atención para adolescentes víctimas de violencia basada en género?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.10', '3.10 ¿Se ofrece atención para adolescentes mujeres víctimas de violencia sexual?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.11', '3.11 ¿Se ofrece atención para adolescentes hombres víctimas de violencia sexual?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.12', '3.12 ¿Se realiza la consulta de salud integral de adolescentes mujeres y hombres con
enfoque de derechos y salud sexual y reproductiva?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.13', '3.13 ¿El establecimiento de salud cuenta con una red de apoyo para las víctimas de
violencia de género y/o sexual?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '3', 'El centro de salud ofrece un paquete de servicios de información, asesoramiento, diagnóstico, tratamiento y atención que satisfagan las necesidades de todos los adolescentes. Los servicios se ofrecen en el centro, a través de vínculos de referencia.', '3.14', '3.14 ¿En el establecimiento de salud hay normas para referencia de adolescentes
mujeres y hombres para servicios de mayor complejidad?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '3';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.1', '4.1 Número total de proveedores/as en su unidad de salud',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.2', '4.2 Número de proveedores/as capacitados/as en salud sexual y reproductiva
de adolescentes por Reprolatina',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.3', '4.3 Número de proveedores/as que necesita capacitación en adolescencia y
salud sexual y reproductiva',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.4', '4.4 ¿Los/as proveedores/as respetan los derechos sexuales y reproductivos de
adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.5', '4.5 ¿Los/as proveedores/as atienden adolescentes mujeres y hombres en salud sexual
y reproductiva sin exigir la presencia de los padres y/o tutores?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.6', '4.6 ¿Los/as proveedores/as atienden adolescentes con confidencialidad, con
privacidad y sin ningún tipo de discriminación?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.7', '4.7 ¿Los/as proveedores/as están capacitados/as para atender adolescentes con
orientación sexual homosexual?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.8', '4.8 ¿Los/as proveedores/as están capacitados/as para atender adolescentes
transexuales?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.9', '4.9 ¿Hay guías y normas de atención a la SSR de adolescentes fácilmente disponibles
para consulta en el establecimiento de salud?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.1', '4.10 ¿Los/as proveedores/as utilizan las guías y normas para la atención de
adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '4', 'Los proveedores de salud demuestran la competencia técnica necesaria para proporcionar servicios de salud eficaces para adolescentes. Tanto los proveedores de salud y personal de apoyo respetan y protegen los derechos de los adolescentes a la información, la privacidad, la confidencialidad, y mantienen una actitud respetuosa y libre de prejuicios.', '4.11', '4.11 ¿El establecimiento de salud tiene una ficha específica para la atención de
adolescentes mujeres y hombres?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '4';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.1', '5.1 ¿El establecimiento de salud ofrece horarios específicos para la atención de
adolescentes mujeres y hombres?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.2', '5.2 ¿Las y los adolescentes son atendidos con y sin cita en el establecimiento de salud?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.3', '5.3 ¿El establecimiento de salud ofrece la consulta de atención integral de salud para
adolescentes mujeres y hombres con foco en la salud sexual y reproductiva?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.4', '5.4 ¿El establecimiento de salud entrega métodos anticonceptivos a las adolescentes
sin la autorización de los padres?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.5', '5.5 ¿El establecimiento de salud ofrece condones a libre demanda para adolescentes
sin necesidad de marcar consulta?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.6', '5.6 ¿Los horarios de atención de adolescentes en el establecimiento de salud son
compatibles con los horarios de los/as adolescentes que no están en el centro
educativo?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.7', '5.7 ¿El establecimiento de salud garantiza la confidencialidad de la atención de
adolescentes mujeres y hombres?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.8', '5.8 ¿Los consultorios tienen planchas de Tanner para ambos sexos?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.9', '5.9 ¿Los consultorios tienen gráficos de IMC e altura OMS para ambos sexos?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.10', '5.10 ¿El establecimiento de salud cuenta siempre con toda la gama de métodos
anticonceptivos para adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.11', '5.11 ¿El establecimiento de salud tiene, por lo menos, 3 kits completos (Espéculo,
histerómetro, tenáculo o pinza Pozzi, pinza Cheron, tijera) para colocar DIU?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.12', '5.12 ¿El establecimiento de salud tiene equipos para extracción de implantes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.13', '5.13 ¿El ambiente del establecimiento de salud es acogedor para adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.14', '5.14 ¿Hay higiene y limpieza en el establecimiento de salud?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.15', '5.15 ¿El lavamanos del consultorio tiene agua corriente?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.16', '5.16 ¿El lavamanos del consultorio tiene jabón?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.17', '5.17 ¿El/a proveedor/a se lava las manos después de atender a cada persona?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.18', '5.18 ¿El establecimiento de salud tiene agua potable, electricidad y saneamiento
básico?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.19', '5.19 ¿El establecimiento de salud tiene y sigue las normas de prevención de infecciones y de bioseguridad?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '5', 'El centro de salud cuenta con un ambiente acogedor y limpio y mantiene la privacidad y la confidencialidad. Tiene los equipos, medicamentos, insumos y la tecnología necesarios para garantizar la prestación eficaz de servicios a los adolescentes.', '5.20', '5.20 ¿El establecimiento de salud tiene acceso para personas con discapacidad',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '5';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.1', '6.1 ¿Existe acuerdo para la referencia de adolescentes mujeres y hombres desde el
centro educativo para el establecimiento de salud?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.2', '6.2 ¿Hay acceso al servicio sin discriminación de edad, sexo, escolarización, estado
civil, etnia, clase social, capacidad de pago, orientación sexual, identidad de
género, discapacidades u otras características?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.3', '6.3 ¿Los/as proveedores/as de salud tienen conocimiento del principio de equidad
para la atención de adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.4', '6.4 ¿El establecimiento de salud divulga la información de los horarios específicos para
adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.5', '6.5 ¿El establecimiento de salud tiene algún/a profesional designado/a como
coordinador/a de adolescentes en el servicio?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.6', '6.6 ¿En el establecimiento de salud hay folletos y afiches escritos con lenguaje
accesible para todos/as los/las adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.7', '6.7 ¿Folletos y carteles consideran la perspectiva de género y los derechos sexuales y
reproductivos?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.8', '6.8 ¿En el establecimiento de salud se realizan acciones educativas periódicas para
adolescentes sobre prevención del embarazo?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.9', '6.9 ¿El personal de salud realiza acciones educativas periódicas para adolescentes en
los centros educativos próximos del servicio sobre prevención del embarazo?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.10', '6.10 ¿El personal de salud realiza acciones educativas periódicas para adolescentes en la comunidad sobre prevención del embarazo?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.11', '6.11 ¿El personal de salud conoce cuáles son los grupos vulnerables de adolescentes enla comunidad?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.12', '6.12 ¿El personal promueve la participación de los grupos vulnerables de adolescentes
en las actividades del servicio de salud?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '6', 'La instalación de salud proporciona servicios de calidad a todos los adolescentes, independientemente de su capacidad de pago, edad, sexo, estado civil, escolaridad, origen étnico, orientación sexual u otras características.', '6.13', '6.13 ¿El trato y actitud del personal de salud es amable, libre de prejuicios, y
respetuosa hacia toda la población adolescente, independientemente de edad,
sexo, escolarización, estado civil, etnia, clase social, capacidad de pago, orientación
sexual, identidad de género, discapacidades u otras características?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '6';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '7', 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.', '7.1', '7.1 ¿El establecimiento de salud tiene un sistema de registro con informaciones para
adolescentes mujeres de 10 a 14 años, en salud sexual y reproductiva?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '7';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '7', 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.', '7.2', '7.2 ¿El establecimiento de salud tiene un sistema de registro con informaciones para
adolescentes mujeres de 15 a 19 años en salud sexual y reproductiva?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '7';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '7', 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.', '7.3', '7.3 ¿El establecimiento de salud tiene un sistema de registro de informaciones para
adolescentes hombres de 10 a 14 en salud sexual y reproductiva?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '7';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '7', 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.', '7.4', '7.4 ¿El establecimiento de salud tiene un sistema de registro de informaciones para
adolescentes hombres de 15 a 19 en salud sexual y reproductiva?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '7';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '7', 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.', '7.5', '7.5 ¿Los/as proveedores/as reciben informes periódicos de los datos de atención de
adolescentes en salud sexual y reproductiva de la unidad?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '7';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '7', 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.', '7.6', '7.6 ¿El establecimiento de salud realiza reuniones periódicas para analizar las
informaciones de adolescentes en salud sexual y reproductiva?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '7';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '7', 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.', '7.7', '7.7 ¿Los/as proveedores/as del establecimiento de salud participan de la elaboración de un plan de acciones a partir del análisis de estas informaciones?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '7';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '7', 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.', '7.8', '7.8 ¿El establecimiento de salud tiene definidos estándares de calidad de atención?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '7';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '7', 'El establecimiento de salud recopila, analiza y utiliza datos sobre la utilización de servicios y la calidad de la atención desglosados por edad y sexo para apoyar y mejorar la calidad. El personal del establecimiento participa en la mejora continua de la calidad.', '7.9', '7.9 ¿El establecimiento de salud recibe visitas técnicas de la Región, por lo menos una
vez cada 6 meses, para monitorear la calidad de atención de adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '7';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '8', 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.', '8.1', '8.1 ¿Existe una política explícita del país para que participen los y las adolescentes en la planificación, seguimiento y evaluación de las acciones para adolescentes en los
servicios?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '8';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '8', 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.', '8.2', '8.2 ¿El establecimiento de salud ha implementado esa política?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '8';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '8', 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.', '8.3', '8.3 ¿Los/as adolescentes participan de las decisiones sobre las actividades del
establecimiento de salud dirigidas a la población adolescente?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '8';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '8', 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.', '8.4', '8.4 ¿El establecimiento de salud cuenta con estructura física para reuniones de grupos
de adolescentes?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '8';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '8', 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.', '8.5', '8.5 ¿El establecimiento de salud tiene colaboración con organizaciones juveniles para
promover la participación de adolescentes en la unidad?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '8';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '8', 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.', '8.6', '8.6 ¿El establecimiento de salud tiene adolescentes capacitados/as para actuar como
educadores de pares?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '8';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '8', 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.', '8.7', '8.7 ¿El establecimiento de salud realiza capacitación de adolescentes para multiplicar informaciones y acciones de prevención en salud sexual y reproductiva a sus pares?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '8';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '8', 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.', '8.8', '8.8 ¿El establecimiento de salud tiene evaluación periódica de la calidad de la atención, realizada con base en la evaluación de adolescentes atendidos en la unidad?',
      1, true, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '8';
INSERT INTO estandares_calidad (
      nivel, departamento, municipio, comunidad, establecimiento_nombre, tipo_establecimiento,
      eje_id, cod_eje, eje_nombre, cod_indicador, descripcion_indicador,
      calificacion, cumple, fecha_evaluacion
    )
    SELECT 'Comunitario', 'Colón', 'Iriona', 'Sangrelaya',
      'Centro de Salud Sangrelaya', 'CIS',
      e.id, '8', 'Los adolescentes están involucrados en la planificación, el seguimiento y la evaluación de los servicios de salud, en las decisiones sobre su propio cuidado, así como en ciertos aspectos apropiados de prestación de servicios.', '8.9', '8.9 ¿Los/as proveedores/as con los y las adolescentes capacitados/as se reúnen
periódicamente para analizar los datos de la evaluación de adolescentes sobre la
calidad de los servicios?',
      0, false, '2025-09-27'
    FROM ejes_calidad e
    WHERE e.codigo = '8';
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '1.1', '# de programas de EIS en la escuela revisados, adaptados y/o validados, incluyendo enfoques culturalmente sensibles y disponibles en sus idiomas en los 6 países - # de programas de EIS fuera de la escuela revisados, adaptados y/o validados, incluyendo enfoques culturalmente sensibles y disponibles en sus idiomas en los 6 países'
        FROM outputs o WHERE o.codigo = 1
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '1.2', 'Número de estrategias implementadas para calcular el impacto de la EIS dentro y fuera de la escuela en la reducción del embarazo adolescente.'
        FROM outputs o WHERE o.codigo = 1
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '1.3', '- # de materiales educativos y/o promocionales diseñados, impresos y publicados.'
        FROM outputs o WHERE o.codigo = 1
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '1.4', '- # de talleres realizados desglosados por país y municipio - # de facilitadores capacitados por edad, sexo, raza y etnia, ubicación geográfica - % de facilitadores que dominan los conocimientos relevantes (Nota: uso de pruebas previas y posteriores)'
        FROM outputs o WHERE o.codigo = 1
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 2
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 2
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 2
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '1.5', '# de talleres realizados desglosados por país y municipio # de docentes formados desglosados por edad, sexo, etnia - raza, ubicación geográfica'
        FROM outputs o WHERE o.codigo = 1
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 2
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 2
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 60
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '1.6', 'Número de docentes capacitados para la implementación adecuada de los programas/iniciativas de Educación Integral en Sexualidad (EIS) siguiendo estándares internacionales, incluidos enfoques culturalmente sensibles.'
        FROM outputs o WHERE o.codigo = 1
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '1.7', '# de talleres realizados desagregados por país y municipio # de adolescentes capacitados desagregados por edad, sexo, etnia - raza, ubicación geográfica - % de adolescentes que dominan los conocimientos relevantes (Nota: uso de pruebas previas y posteriores)'
        FROM outputs o WHERE o.codigo = 1
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 2
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 2
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 60
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '1.8', '# de talleres realizados desagregados por país y municipio # de adolescentes capacitados desagregados por edad, sexo, etnia - raza, ubicación geográfica - % de adolescentes que dominan los conocimientos relevantes (Nota: utilizando pruebas previas y posteriores)'
        FROM outputs o WHERE o.codigo = 1
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 2
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 2
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 60
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '1.9', '# y tipo de actividades de comunicación y promoción realizadas por país y municipio # y tipo de productos de comunicación y promoción producidos desagregados por país'
        FROM outputs o WHERE o.codigo = 1
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '1.10', 'Número de estrategias de comunicación implementadas que contribuyen a la promoción de la EIS y la erradicación del racismo y la discriminación racial'
        FROM outputs o WHERE o.codigo = 1
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.10'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.10'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.10'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.10'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.10'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '1.11', '# de oficiales de enlace locales contratados oportunamente y de calidad por ubicación
# de asistente administrativo local contratado oportunamente y de calidad por localidad'
        FROM outputs o WHERE o.codigo = 1
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.11'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.11'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.11'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.11'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 1 AND ik.codigo = '1.11'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '2.1', '# de normas, y/o protocolos y directrices revisadas...'
        FROM outputs o WHERE o.codigo = 2
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '2.2', '# de iniciativas emprendidas para abordar las barreras...'
        FROM outputs o WHERE o.codigo = 2
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '2.3', 'Fortalecimiento de los servicios de salud...'
        FROM outputs o WHERE o.codigo = 2
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '2.4', '# de Materiales informativos y/o promocionales...'
        FROM outputs o WHERE o.codigo = 2
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '2.5', 'Taller realizado...'
        FROM outputs o WHERE o.codigo = 2
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 50
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 50
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 50
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '2.6', '# de talleres realizados...'
        FROM outputs o WHERE o.codigo = 2
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '2.7', 'Número de proveedores de atención de la salud capacitados...'
        FROM outputs o WHERE o.codigo = 2
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '2.8', '# de talleres realizados...'
        FROM outputs o WHERE o.codigo = 2
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 50
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 50
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 50
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '2.9', 'Taller subregional realizado...'
        FROM outputs o WHERE o.codigo = 2
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 60
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 60
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 60
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '2.10', '# de unidades de atención médica equipadas...'
        FROM outputs o WHERE o.codigo = 2
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 7
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.10'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 7
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.10'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 7
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.10'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.10'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.10'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '2.11', 'Número de unidades de atención de salud equipadas...'
        FROM outputs o WHERE o.codigo = 2
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 7
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.11'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 7
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.11'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 7
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.11'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.11'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.11'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '2.12', 'Estrategia de comunicación y promoción...'
        FROM outputs o WHERE o.codigo = 2
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.12'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.12'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.12'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.12'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.12'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '2.13', 'Número de iniciativas implementadas...'
        FROM outputs o WHERE o.codigo = 2
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 10
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.13'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 10
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.13'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 10
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.13'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.13'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.13'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '2.14', '# de oficiales de enlace locales contratados...'
        FROM outputs o WHERE o.codigo = 2
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.14'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.14'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.14'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.14'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 2 AND ik.codigo = '2.14'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '3.1', '# de cursos del UNFPA sobre participación y liderazgo...'
        FROM outputs o WHERE o.codigo = 3
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 50
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 50
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 50
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '3.2', '# de talleres realizados...'
        FROM outputs o WHERE o.codigo = 3
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 50
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 50
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 50
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '3.3', '# de ONG/OSC comprometidas...'
        FROM outputs o WHERE o.codigo = 3
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 10
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 10
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 10
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '3.4', '# de talleres realizados...'
        FROM outputs o WHERE o.codigo = 3
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 50
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 50
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 50
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '3.5', '# de talleres realizados...'
        FROM outputs o WHERE o.codigo = 3
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 50
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 50
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 50
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '3.6', '# de organizaciones de la sociedad civil...'
        FROM outputs o WHERE o.codigo = 3
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 10
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 10
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 10
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '3.7', 'Número de iniciativas locales de prevención...'
        FROM outputs o WHERE o.codigo = 3
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 20
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 20
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 20
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '3.8', '# y tipo de diálogos estratégicos...'
        FROM outputs o WHERE o.codigo = 3
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 10
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 10
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 10
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '3.9', '# de oficiales de enlace locales contratados...'
        FROM outputs o WHERE o.codigo = 3
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 3 AND ik.codigo = '3.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '4.1', 'Estudio de referencia realizado en 6 países'
        FROM outputs o WHERE o.codigo = 4
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.1'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '4.2', 'Documento de sistematización del modelo acelerador...'
        FROM outputs o WHERE o.codigo = 4
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.2'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '4.3', 'Evaluación intermedia realizada...'
        FROM outputs o WHERE o.codigo = 4
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.3'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '4.4', 'Evaluación de los resultados del proyecto...'
        FROM outputs o WHERE o.codigo = 4
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.4'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '4.5', 'Evaluación final realizada...'
        FROM outputs o WHERE o.codigo = 4
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.5'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '4.6', 'Reunión Anual de Planificación realizada...'
        FROM outputs o WHERE o.codigo = 4
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.6'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '4.7', 'Documento de sistematización del proceso...'
        FROM outputs o WHERE o.codigo = 4
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.7'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '4.8', '# de Visiones Anuales Conjuntas de Campo...'
        FROM outputs o WHERE o.codigo = 4
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.8'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '4.9', 'Visitas anuales conjuntas de supervisión realizadas'
        FROM outputs o WHERE o.codigo = 4
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.9'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '4.10', 'Participación de las partes interesadas...'
        FROM outputs o WHERE o.codigo = 4
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.10'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.10'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.10'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.10'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.10'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi (output_id, codigo, descripcion)
        SELECT o.id, '4.11', 'Coordinador regional de proyectos contratado...'
        FROM outputs o WHERE o.codigo = 4
        ON CONFLICT (output_id, codigo) DO UPDATE SET descripcion = EXCLUDED.descripcion;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2023, 1
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.11'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2024, 0
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.11'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2025, 0
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.11'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2026, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.11'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
INSERT INTO indicadores_kpi_resultados (indicador_kpi_id, anio, valor)
          SELECT ik.id, 2027, NULL
          FROM indicadores_kpi ik
          JOIN outputs o ON o.id = ik.output_id
          WHERE o.codigo = 4 AND ik.codigo = '4.11'
          ON CONFLICT (indicador_kpi_id, anio) DO UPDATE SET valor = EXCLUDED.valor;
COMMIT;