CREATE TABLE "public"."goal" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "patientId" uuid NOT NULL, "name" text, "rewards" jsonb, "createdAt" timestamptz NOT NULL DEFAULT now(), "updatedAt" timestamptz NOT NULL DEFAULT now(), "expiryAt" timestamptz, "status" text NOT NULL DEFAULT 'pending', PRIMARY KEY ("id") , FOREIGN KEY ("patientId") REFERENCES "public"."patient"("id") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("status") REFERENCES "public"."goal_status"("name") ON UPDATE restrict ON DELETE restrict, UNIQUE ("id"));COMMENT ON TABLE "public"."goal" IS E'Stores patients goals.';
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
CREATE TRIGGER "set_public_goal_updatedAt"
BEFORE UPDATE ON "public"."goal"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_goal_updatedAt" ON "public"."goal" 
IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
