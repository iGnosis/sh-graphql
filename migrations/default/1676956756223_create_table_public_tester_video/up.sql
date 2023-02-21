CREATE TABLE "public"."tester_video" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "createdAt" timestamptz NOT NULL DEFAULT now(), "endedAt" timestamptz NOT NULL, "patient" uuid NOT NULL, "videoUrl" text NOT NULL, "configUrl" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("patient") REFERENCES "public"."patient"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("videoUrl"), UNIQUE ("configUrl"));
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_endedAt"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."endedAt" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_tester_video_endedAt"
BEFORE UPDATE ON "public"."tester_video"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_endedAt"();
COMMENT ON TRIGGER "set_public_tester_video_endedAt" ON "public"."tester_video" 
IS 'trigger to set value of column "endedAt" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
