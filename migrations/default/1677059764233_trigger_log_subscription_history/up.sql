CREATE OR REPLACE FUNCTION triggerLogSubscriptionsHistory() RETURNS TRIGGER AS $trigger_log_subscriptions_history$
    BEGIN
        INSERT INTO subscriptions_history("subscriptionPlanId", "subscriptionId", "status", "startDate", "endDate", "patient")
            VALUES(new."subscriptionPlanId", new."subscriptionId", new."status", new."startDate", new."endDate", new."patient");
        RETURN NEW;
    END;
$trigger_log_subscriptions_history$ LANGUAGE plpgsql;
