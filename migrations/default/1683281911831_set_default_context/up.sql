UPDATE patient
SET context = '{}'::jsonb
WHERE context IS NULL;
