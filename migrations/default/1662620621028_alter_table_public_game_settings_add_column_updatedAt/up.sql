alter table "public"."game_settings" add column "updatedAt" timestamptz
 null default now();

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
CREATE TRIGGER "set_public_game_settings_updatedAt"
BEFORE UPDATE ON "public"."game_settings"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_game_settings_updatedAt" ON "public"."game_settings" 
IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
