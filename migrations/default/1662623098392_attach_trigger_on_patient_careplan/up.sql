CREATE TRIGGER trigger_log_careplan_update
AFTER UPDATE OF careplan
ON patient
FOR EACH ROW EXECUTE PROCEDURE triggerLogCareplanUpdate();
