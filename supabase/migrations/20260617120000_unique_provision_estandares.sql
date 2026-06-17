-- ─────────────────────────────────────────────────────────────────────────────
-- Agrega restricciones UNIQUE a provision_consumo y estandares_calidad
-- para prevenir registros duplicados en importaciones masivas.
-- ─────────────────────────────────────────────────────────────────────────────

-- 1. Eliminar duplicados existentes en provision_consumo
--    Conserva el registro con id más bajo por combinación (establecimiento, método, mes, año)
DELETE FROM public.provision_consumo
WHERE id NOT IN (
  SELECT MIN(id)
  FROM public.provision_consumo
  GROUP BY nombre_establecimiento, metodo_id, mes, anio
);

-- 2. Agregar restricción UNIQUE a provision_consumo
ALTER TABLE public.provision_consumo
  ADD CONSTRAINT uq_provision_consumo
  UNIQUE (nombre_establecimiento, metodo_id, mes, anio);

-- 3. Eliminar duplicados existentes en estandares_calidad
--    Conserva el registro con id más bajo por (establecimiento, código de indicador)
DELETE FROM public.estandares_calidad
WHERE id NOT IN (
  SELECT MIN(id)
  FROM public.estandares_calidad
  GROUP BY establecimiento_nombre, cod_indicador
);

-- 4. Agregar restricción UNIQUE a estandares_calidad
ALTER TABLE public.estandares_calidad
  ADD CONSTRAINT uq_estandares_calidad
  UNIQUE (establecimiento_nombre, cod_indicador);
