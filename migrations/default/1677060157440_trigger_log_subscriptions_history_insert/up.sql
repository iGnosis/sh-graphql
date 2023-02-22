CREATE TRIGGER trigger_log_subscriptions_history_insert
AFTER INSERT
ON subscriptions
FOR EACH ROW EXECUTE PROCEDURE triggerLogSubscriptionsHistory();
