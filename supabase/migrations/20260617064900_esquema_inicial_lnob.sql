-- =============================================================================
-- Dashboard LNOB — Esquema inicial en Postgres (Supabase)
-- Proyecto: No Dejar A Nadie Atrás — Sistema de Monitoreo y Seguimiento
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Tipos enumerados
-- -----------------------------------------------------------------------------
CREATE TYPE public.rol_usuario AS ENUM (
  'admin'
);

CREATE TYPE public.estado_actividad AS ENUM (
  'Completado',
  'En Proceso',
  'No Completado',
  'No Aplica'
);

-- -----------------------------------------------------------------------------
-- Utilidades
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.actualizar_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

-- Auth: solo login de admins (sin registro público).
-- Los usuarios se crean en Supabase Studio; el trigger asigna rol admin al perfil.
CREATE TABLE public.perfiles (
  id uuid PRIMARY KEY REFERENCES auth.users (id) ON DELETE CASCADE,
  nombre_completo text NOT NULL,
  rol public.rol_usuario NOT NULL DEFAULT 'admin',
  activo boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TRIGGER trg_perfiles_updated_at
  BEFORE UPDATE ON public.perfiles
  FOR EACH ROW
  EXECUTE FUNCTION public.actualizar_updated_at();

CREATE OR REPLACE FUNCTION public.es_admin()
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY INVOKER
SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1
    FROM public.perfiles
    WHERE id = (SELECT auth.uid())
      AND activo = true
      AND rol = 'admin'
  );
$$;

CREATE OR REPLACE FUNCTION public.manejar_nuevo_usuario()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  INSERT INTO public.perfiles (id, nombre_completo, rol)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data ->> 'nombre_completo', NEW.email, 'Usuario'),
    'admin'
  );
  RETURN NEW;
END;
$$;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW
  EXECUTE FUNCTION public.manejar_nuevo_usuario();

-- -----------------------------------------------------------------------------
-- Catálogos geográficos y maestros
-- -----------------------------------------------------------------------------
CREATE TABLE public.departamentos (
  id smallserial PRIMARY KEY,
  nombre text NOT NULL UNIQUE,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE public.municipios (
  id smallserial PRIMARY KEY,
  nombre text NOT NULL,
  departamento_id smallint NOT NULL REFERENCES public.departamentos (id) ON DELETE RESTRICT,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (nombre, departamento_id)
);

CREATE TABLE public.comunidades (
  id smallserial PRIMARY KEY,
  nombre text NOT NULL,
  municipio_id smallint NOT NULL REFERENCES public.municipios (id) ON DELETE RESTRICT,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (nombre, municipio_id)
);

CREATE TABLE public.riss (
  id smallserial PRIMARY KEY,
  nombre text NOT NULL UNIQUE,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE public.tipos_establecimiento (
  id smallserial PRIMARY KEY,
  nombre text NOT NULL UNIQUE,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE public.establecimientos (
  id serial PRIMARY KEY,
  nombre text NOT NULL,
  tipo_establecimiento_id smallint REFERENCES public.tipos_establecimiento (id) ON DELETE SET NULL,
  municipio_id smallint REFERENCES public.municipios (id) ON DELETE SET NULL,
  departamento_id smallint REFERENCES public.departamentos (id) ON DELETE SET NULL,
  riss_id smallint REFERENCES public.riss (id) ON DELETE SET NULL,
  comunidad_id smallint REFERENCES public.comunidades (id) ON DELETE SET NULL,
  activo boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_establecimientos_nombre ON public.establecimientos (nombre);

CREATE TRIGGER trg_establecimientos_updated_at
  BEFORE UPDATE ON public.establecimientos
  FOR EACH ROW
  EXECUTE FUNCTION public.actualizar_updated_at();

CREATE TABLE public.fondos (
  id smallserial PRIMARY KEY,
  nombre text NOT NULL UNIQUE,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE public.metodos_anticonceptivos (
  id smallserial PRIMARY KEY,
  codigo smallint,
  nombre text NOT NULL UNIQUE,
  activo boolean NOT NULL DEFAULT true,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE public.ejes_calidad (
  id smallserial PRIMARY KEY,
  codigo text NOT NULL UNIQUE,
  nombre text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

-- -----------------------------------------------------------------------------
-- Outputs y avance de actividades (Sección Outputs)
-- -----------------------------------------------------------------------------
CREATE TABLE public.outputs (
  id smallserial PRIMARY KEY,
  codigo smallint NOT NULL UNIQUE,
  nombre text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TRIGGER trg_outputs_updated_at
  BEFORE UPDATE ON public.outputs
  FOR EACH ROW
  EXECUTE FUNCTION public.actualizar_updated_at();

CREATE TABLE public.indicadores_actividad (
  id serial PRIMARY KEY,
  output_id smallint NOT NULL REFERENCES public.outputs (id) ON DELETE CASCADE,
  fondo_id smallint NOT NULL REFERENCES public.fondos (id) ON DELETE RESTRICT,
  cod_actividad text,
  actividad_ingles text,
  actividad_espanol text,
  codigo_indicador text NOT NULL,
  descripcion_indicador text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (output_id, codigo_indicador, fondo_id)
);

CREATE INDEX idx_indicadores_actividad_output ON public.indicadores_actividad (output_id);
CREATE INDEX idx_indicadores_actividad_fondo ON public.indicadores_actividad (fondo_id);

CREATE TRIGGER trg_indicadores_actividad_updated_at
  BEFORE UPDATE ON public.indicadores_actividad
  FOR EACH ROW
  EXECUTE FUNCTION public.actualizar_updated_at();

CREATE TABLE public.indicador_avance_anual (
  id serial PRIMARY KEY,
  indicador_id integer NOT NULL REFERENCES public.indicadores_actividad (id) ON DELETE CASCADE,
  anio smallint NOT NULL CHECK (anio BETWEEN 2023 AND 2030),
  anio_referencia numeric,
  priorizado boolean NOT NULL DEFAULT false,
  estado public.estado_actividad,
  resultado text,
  observaciones text,
  actualizado_por uuid REFERENCES public.perfiles (id) ON DELETE SET NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (indicador_id, anio)
);

CREATE INDEX idx_indicador_avance_anual_anio ON public.indicador_avance_anual (anio);

CREATE TRIGGER trg_indicador_avance_anual_updated_at
  BEFORE UPDATE ON public.indicador_avance_anual
  FOR EACH ROW
  EXECUTE FUNCTION public.actualizar_updated_at();

-- -----------------------------------------------------------------------------
-- Provisión de anticonceptivos (Sección Provisión)
-- -----------------------------------------------------------------------------
CREATE TABLE public.provision_consumo (
  id serial PRIMARY KEY,
  establecimiento_id integer REFERENCES public.establecimientos (id) ON DELETE SET NULL,
  nombre_establecimiento text NOT NULL,
  tipo_establecimiento text,
  riss_id smallint REFERENCES public.riss (id) ON DELETE SET NULL,
  municipio_id smallint REFERENCES public.municipios (id) ON DELETE SET NULL,
  mes text NOT NULL,
  anio smallint NOT NULL CHECK (anio BETWEEN 2020 AND 2035),
  metodo_id smallint NOT NULL REFERENCES public.metodos_anticonceptivos (id) ON DELETE RESTRICT,
  consumo numeric(12, 2) NOT NULL DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_provision_consumo_anio_mes ON public.provision_consumo (anio, mes);
CREATE INDEX idx_provision_consumo_riss ON public.provision_consumo (riss_id);
CREATE INDEX idx_provision_consumo_metodo ON public.provision_consumo (metodo_id);

CREATE TRIGGER trg_provision_consumo_updated_at
  BEFORE UPDATE ON public.provision_consumo
  FOR EACH ROW
  EXECUTE FUNCTION public.actualizar_updated_at();

-- -----------------------------------------------------------------------------
-- Estándares de calidad (Sección Estándares)
-- -----------------------------------------------------------------------------
CREATE TABLE public.estandares_calidad (
  id serial PRIMARY KEY,
  nivel text,
  departamento text,
  municipio text,
  comunidad text,
  establecimiento_nombre text NOT NULL,
  tipo_establecimiento text,
  eje_id smallint REFERENCES public.ejes_calidad (id) ON DELETE SET NULL,
  cod_eje text,
  eje_nombre text,
  cod_indicador text NOT NULL,
  descripcion_indicador text NOT NULL,
  calificacion smallint CHECK (calificacion IN (0, 1)),
  cumple boolean NOT NULL DEFAULT false,
  fecha_evaluacion date,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_estandares_calidad_eje ON public.estandares_calidad (eje_id);
CREATE INDEX idx_estandares_calidad_establecimiento ON public.estandares_calidad (establecimiento_nombre);

CREATE TRIGGER trg_estandares_calidad_updated_at
  BEFORE UPDATE ON public.estandares_calidad
  FOR EACH ROW
  EXECUTE FUNCTION public.actualizar_updated_at();

-- -----------------------------------------------------------------------------
-- Indicadores KPI — Sección A (IndicadoresView)
-- -----------------------------------------------------------------------------
CREATE TABLE public.indicadores_kpi (
  id serial PRIMARY KEY,
  output_id smallint NOT NULL REFERENCES public.outputs (id) ON DELETE CASCADE,
  codigo text NOT NULL,
  descripcion text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (output_id, codigo)
);

CREATE TABLE public.indicadores_kpi_resultados (
  id serial PRIMARY KEY,
  indicador_kpi_id integer NOT NULL REFERENCES public.indicadores_kpi (id) ON DELETE CASCADE,
  anio smallint NOT NULL CHECK (anio BETWEEN 2023 AND 2030),
  valor numeric,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (indicador_kpi_id, anio)
);

CREATE TRIGGER trg_indicadores_kpi_resultados_updated_at
  BEFORE UPDATE ON public.indicadores_kpi_resultados
  FOR EACH ROW
  EXECUTE FUNCTION public.actualizar_updated_at();

-- -----------------------------------------------------------------------------
-- Vistas de consulta frecuente
-- -----------------------------------------------------------------------------
CREATE OR REPLACE VIEW public.v_indicadores_actividad_completo
WITH (security_invoker = true)
AS
SELECT
  ia.id,
  o.codigo AS codigo_output,
  o.nombre AS output,
  f.nombre AS fondo,
  ia.cod_actividad,
  ia.actividad_ingles,
  ia.actividad_espanol,
  ia.codigo_indicador,
  ia.descripcion_indicador,
  iaa.anio,
  iaa.anio_referencia,
  iaa.priorizado,
  iaa.estado,
  iaa.resultado,
  iaa.observaciones
FROM public.indicadores_actividad ia
JOIN public.outputs o ON o.id = ia.output_id
JOIN public.fondos f ON f.id = ia.fondo_id
LEFT JOIN public.indicador_avance_anual iaa ON iaa.indicador_id = ia.id;

CREATE OR REPLACE VIEW public.v_provision_consumo_resumen
WITH (security_invoker = true)
AS
SELECT
  pc.id,
  pc.nombre_establecimiento,
  pc.tipo_establecimiento,
  r.nombre AS riss,
  m.nombre AS municipio,
  pc.mes,
  pc.anio,
  ma.nombre AS tipo_metodo,
  pc.consumo
FROM public.provision_consumo pc
LEFT JOIN public.riss r ON r.id = pc.riss_id
LEFT JOIN public.municipios m ON m.id = pc.municipio_id
JOIN public.metodos_anticonceptivos ma ON ma.id = pc.metodo_id;

-- -----------------------------------------------------------------------------
-- Row Level Security (RLS)
-- -----------------------------------------------------------------------------
ALTER TABLE public.perfiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.departamentos ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.municipios ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.comunidades ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.riss ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.tipos_establecimiento ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.establecimientos ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.fondos ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.metodos_anticonceptivos ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.ejes_calidad ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.outputs ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.indicadores_actividad ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.indicador_avance_anual ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.provision_consumo ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.estandares_calidad ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.indicadores_kpi ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.indicadores_kpi_resultados ENABLE ROW LEVEL SECURITY;

-- Lectura pública del dashboard; escritura solo para admin autenticado
DO $$
DECLARE
  tabla text;
BEGIN
  FOREACH tabla IN ARRAY ARRAY[
    'departamentos', 'municipios', 'comunidades', 'riss', 'tipos_establecimiento',
    'establecimientos', 'fondos', 'metodos_anticonceptivos', 'ejes_calidad',
    'outputs', 'indicadores_actividad', 'indicador_avance_anual',
    'provision_consumo', 'estandares_calidad', 'indicadores_kpi', 'indicadores_kpi_resultados'
  ]
  LOOP
    EXECUTE format(
      'CREATE POLICY "lectura_publica_%s" ON public.%I FOR SELECT TO anon, authenticated USING (true)',
      tabla, tabla
    );
    EXECUTE format(
      'CREATE POLICY "escritura_admin_%s" ON public.%I FOR INSERT TO authenticated WITH CHECK (public.es_admin())',
      tabla, tabla
    );
    EXECUTE format(
      'CREATE POLICY "actualizacion_admin_%s" ON public.%I FOR UPDATE TO authenticated USING (public.es_admin()) WITH CHECK (public.es_admin())',
      tabla, tabla
    );
    EXECUTE format(
      'CREATE POLICY "eliminacion_admins_%s" ON public.%I FOR DELETE TO authenticated USING (public.es_admin())',
      tabla, tabla
    );
  END LOOP;
END $$;

-- Perfiles: cada usuario ve el suyo; admins ven todos
CREATE POLICY "perfiles_lectura_propia"
  ON public.perfiles FOR SELECT
  TO authenticated
  USING ((SELECT auth.uid()) = id OR public.es_admin());

CREATE POLICY "perfiles_actualizacion_propia"
  ON public.perfiles FOR UPDATE
  TO authenticated
  USING ((SELECT auth.uid()) = id)
  WITH CHECK ((SELECT auth.uid()) = id);

CREATE POLICY "perfiles_admin_actualizacion"
  ON public.perfiles FOR UPDATE
  TO authenticated
  USING (public.es_admin())
  WITH CHECK (public.es_admin());

-- -----------------------------------------------------------------------------
-- Permisos Data API
-- -----------------------------------------------------------------------------
GRANT USAGE ON SCHEMA public TO anon, authenticated;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO anon, authenticated;
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO authenticated;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO authenticated;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
  GRANT SELECT ON TABLES TO anon, authenticated;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
  GRANT INSERT, UPDATE, DELETE ON TABLES TO authenticated;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
  GRANT USAGE, SELECT ON SEQUENCES TO authenticated;

-- Catálogos base
INSERT INTO public.fondos (nombre) VALUES ('Irlanda'), ('Luxemburgo');

INSERT INTO public.tipos_establecimiento (nombre) VALUES ('CIS'), ('UAPS'), ('ZPP');

INSERT INTO public.riss (nombre) VALUES
  ('Roatán'),
  ('Atlantida'),
  ('Trujillo'),
  ('Limón'),
  ('B.Oriental');

INSERT INTO public.departamentos (nombre) VALUES
  ('Atlántida'),
  ('Colón'),
  ('Gracias a Dios'),
  ('Islas de la Bahía');
