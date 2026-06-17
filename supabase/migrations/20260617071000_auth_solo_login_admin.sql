-- Auth LNOB: solo login para ingreso de datos (sin registro público)
-- El dashboard es de lectura pública; escribir requiere admin autenticado.
-- Los usuarios admin se crean manualmente en Supabase Studio (Authentication > Users).

COMMENT ON TABLE public.perfiles IS
  'Administradores con acceso de escritura. Sin registro público: crear usuarios solo en Supabase Studio.';

-- Los perfiles solo se crean vía trigger al dar de alta el usuario en Auth (Studio).
DROP POLICY IF EXISTS "perfiles_admin_gestion" ON public.perfiles;

CREATE POLICY "perfiles_admin_actualizacion"
  ON public.perfiles FOR UPDATE
  TO authenticated
  USING (public.es_admin())
  WITH CHECK (public.es_admin());

-- Bloquear registro público vía API (capa extra; deshabilitar también signup en Studio).
CREATE OR REPLACE FUNCTION public.hook_bloquear_registro_publico(event jsonb)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  origen text;
BEGIN
  origen := COALESCE(event -> 'metadata' ->> 'source', event -> 'user' -> 'app_metadata' ->> 'provider', '');

  -- Permitir altas hechas por el panel / service role (invite, admin).
  IF origen IN ('admin', 'invite', 'dashboard') THEN
    RETURN '{}'::jsonb;
  END IF;

  RETURN jsonb_build_object(
    'error', jsonb_build_object(
      'http_code', 403,
      'message', 'El registro público está deshabilitado. Use login con una cuenta admin existente.'
    )
  );
END;
$$;

REVOKE ALL ON FUNCTION public.hook_bloquear_registro_publico(jsonb) FROM PUBLIC, anon, authenticated;

-- Permisos de lectura en vistas para visitantes del dashboard
GRANT SELECT ON public.v_indicadores_actividad_completo TO anon, authenticated;
GRANT SELECT ON public.v_provision_consumo_resumen TO anon, authenticated;
