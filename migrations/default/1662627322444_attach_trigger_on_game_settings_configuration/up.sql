CREATE TRIGGER trigger_log_game_settings_update
AFTER UPDATE OF configuration
ON game_settings
FOR EACH ROW EXECUTE PROCEDURE triggerLogGameSettingsUpdate();
