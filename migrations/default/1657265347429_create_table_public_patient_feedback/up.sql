CREATE TABLE "public"."patient_feedback" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "createdAt" timestamptz NOT NULL DEFAULT now(), "updatedAt" timestamptz NOT NULL DEFAULT now(), "patient" uuid NOT NULL, "description" text, "rating" integer NOT NULL, "recommendationScore" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("patient") REFERENCES "public"."patient"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("id"));COMMENT ON TABLE "public"."patient_feedback" IS E'Stores patients\' feedback.';
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
CREATE TRIGGER "set_public_patient_feedback_updatedAt"
BEFORE UPDATE ON "public"."patient_feedback"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_patient_feedback_updatedAt" ON "public"."patient_feedback" 
IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
