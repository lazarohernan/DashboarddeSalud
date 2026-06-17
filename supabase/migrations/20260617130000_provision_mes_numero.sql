-- Columna generada para ordenar la provisión por mes cronológicamente
-- (la columna `mes` es texto: "Enero", "Febrero"... y se ordenaba alfabéticamente).
ALTER TABLE public.provision_consumo
  ADD COLUMN IF NOT EXISTS mes_numero smallint
  GENERATED ALWAYS AS (
    CASE lower(trim(mes))
      WHEN 'enero' THEN 1
      WHEN 'febrero' THEN 2
      WHEN 'marzo' THEN 3
      WHEN 'abril' THEN 4
      WHEN 'mayo' THEN 5
      WHEN 'junio' THEN 6
      WHEN 'julio' THEN 7
      WHEN 'agosto' THEN 8
      WHEN 'septiembre' THEN 9
      WHEN 'setiembre' THEN 9
      WHEN 'octubre' THEN 10
      WHEN 'noviembre' THEN 11
      WHEN 'diciembre' THEN 12
      ELSE 99
    END
  ) STORED;
