-- Simplificación: único rol admin en la plataforma LNOB

UPDATE public.perfiles SET rol = 'admin' WHERE rol IS DISTINCT FROM 'admin';

DO $$
DECLARE tabla text;
BEGIN
  FOREACH tabla IN ARRAY ARRAY[
    'departamentos', 'municipios', 'comunidades', 'riss', 'tipos_establecimiento',
    'establecimientos', 'fondos', 'metodos_anticonceptivos', 'ejes_calidad',
    'outputs', 'indicadores_actividad', 'indicador_avance_anual',
    'provision_consumo', 'estandares_calidad', 'indicadores_kpi', 'indicadores_kpi_resultados'
  ]
  LOOP
    EXECUTE format('DROP POLICY IF EXISTS "escritura_editores_%s" ON public.%I', tabla, tabla);
    EXECUTE format('DROP POLICY IF EXISTS "actualizacion_editores_%s" ON public.%I', tabla, tabla);
    EXECUTE format('CREATE POLICY "escritura_admin_%s" ON public.%I FOR INSERT TO authenticated WITH CHECK (public.es_admin())', tabla, tabla);
    EXECUTE format('CREATE POLICY "actualizacion_admin_%s" ON public.%I FOR UPDATE TO authenticated USING (public.es_admin()) WITH CHECK (public.es_admin())', tabla, tabla);
  END LOOP;
END $$;

DROP FUNCTION IF EXISTS public.es_editor_o_superior();

ALTER TABLE public.perfiles ALTER COLUMN rol DROP DEFAULT;
CREATE TYPE public.rol_usuario_nuevo AS ENUM ('admin');
ALTER TABLE public.perfiles
  ALTER COLUMN rol TYPE public.rol_usuario_nuevo
  USING 'admin'::public.rol_usuario_nuevo;
DROP TYPE public.rol_usuario;
ALTER TYPE public.rol_usuario_nuevo RENAME TO rol_usuario;
ALTER TABLE public.perfiles ALTER COLUMN rol SET DEFAULT 'admin';

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

REVOKE ALL ON FUNCTION public.manejar_nuevo_usuario() FROM PUBLIC, anon, authenticated;
