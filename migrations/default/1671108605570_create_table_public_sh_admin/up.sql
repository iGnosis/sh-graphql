CREATE TABLE "public"."sh_admin" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "createdAt" timestamptz NOT NULL DEFAULT now(), "updatedAt" timestamptz NOT NULL DEFAULT now(), "firstName" text, "lastName" text, "email" text, "phoneCountryCode" text NOT NULL, "phoneNumber" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("id"), UNIQUE ("email"), UNIQUE ("phoneNumber"));COMMENT ON TABLE "public"."sh_admin" IS E'Stores sh_admin users';
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
CREATE TRIGGER "set_public_sh_admin_updatedAt"
BEFORE UPDATE ON "public"."sh_admin"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_sh_admin_updatedAt" ON "public"."sh_admin" 
IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
