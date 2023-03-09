DROP TRIGGER trigger_log_subscriptions_history_update ON subscriptions;
CREATE TRIGGER trigger_log_subscriptions_history_update
AFTER UPDATE OF "endDate", "status"
ON subscriptions
FOR EACH ROW EXECUTE PROCEDURE triggerLogSubscriptionsHistory();
