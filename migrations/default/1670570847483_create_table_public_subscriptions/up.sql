CREATE TABLE "public"."subscriptions" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "createdAt" timestamptz NOT NULL DEFAULT now(), "updatedAt" timestamptz NOT NULL DEFAULT now(), "subscriptionPlanId" uuid NOT NULL, "subscriptionId" text NOT NULL, "status" text NOT NULL, PRIMARY KEY ("id","subscriptionId") , FOREIGN KEY ("subscriptionPlanId") REFERENCES "public"."subscription_plans"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("subscriptionId"));
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updatedAt"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updatedAt" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_subscriptions_updatedAt"
BEFORE UPDATE ON "public"."subscriptions"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_subscriptions_updatedAt" ON "public"."subscriptions" 
IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
