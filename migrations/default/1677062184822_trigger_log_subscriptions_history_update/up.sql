CREATE TRIGGER trigger_log_subscriptions_history_update
AFTER UPDATE OF "endDate"
ON subscriptions
FOR EACH ROW EXECUTE PROCEDURE triggerLogSubscriptionsHistory();
