CREATE OR REPLACE FUNCTION triggerLogGameSettingsUpdate() RETURNS TRIGGER AS $log_game_settings_update$
  BEGIN
    INSERT INTO patient_change_logs(patient, "tableName", "oldValue", "newValue")
      VALUES (
      old.patient,
      TG_TABLE_NAME::regclass::text,
      jsonb_build_object(old."gameName", old.configuration),
      jsonb_build_object(old."gameName", new.configuration)
    );
    RETURN NEW;
  END;
$log_game_settings_update$ LANGUAGE plpgsql;
