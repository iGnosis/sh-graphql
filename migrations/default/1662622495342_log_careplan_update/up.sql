-- CREATE OR REPLACE FUNCTION triggerLogCareplanUpdate() RETURNS TRIGGER AS $$
--   BEGIN
--     INSERT INTO employee_change_logs(employee_id, table_name, old_value, new_value)
--       VALUES (new.id, 'employee', old.metadata, new.metadata);
--     RETURN NEW;
--   END;
-- $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION triggerLogCareplanUpdate() RETURNS TRIGGER AS $log_careplan_update$
  BEGIN
    INSERT INTO patient_change_logs(patient, tableName, oldValue, newValue)
      VALUES (new.id, TG_TABLE_NAME::regclass::text, old.careplan, new.careplan);
    RETURN NEW;
  END;
$log_careplan_update$ LANGUAGE plpgsql;
