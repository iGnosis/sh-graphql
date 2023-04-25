CREATE TABLE "public"."leaderboard" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "createdAt" timestamptz NOT NULL DEFAULT now(), "updatedAt" timestamptz NOT NULL DEFAULT now(), "patientId" uuid NOT NULL, "game" text NOT NULL, "highScore" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("game") REFERENCES "public"."game_name"("name") ON UPDATE restrict ON DELETE restrict, FOREIGN KEY ("patientId") REFERENCES "public"."patient"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("id"));
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
CREATE TRIGGER "set_public_leaderboard_updatedAt"
BEFORE UPDATE ON "public"."leaderboard"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_leaderboard_updatedAt" ON "public"."leaderboard" 
IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
