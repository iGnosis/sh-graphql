CREATE TABLE "public"."game_manual_calculations" ("gameId" uuid NOT NULL, "promptId" uuid NOT NULL, "createdAt" timestamptz NOT NULL DEFAULT now(), "updatedAt" timestamptz NOT NULL DEFAULT now(), "metricName" text NOT NULL, "metricValue" numeric NOT NULL, PRIMARY KEY ("gameId","promptId") , FOREIGN KEY ("gameId") REFERENCES "public"."game"("id") ON UPDATE restrict ON DELETE restrict);COMMENT ON TABLE "public"."game_manual_calculations" IS E'Stores manually calculated metrics for a game';
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
CREATE TRIGGER "set_public_game_manual_calculations_updatedAt"
BEFORE UPDATE ON "public"."game_manual_calculations"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updatedAt"();
COMMENT ON TRIGGER "set_public_game_manual_calculations_updatedAt" ON "public"."game_manual_calculations" 
IS 'trigger to set value of column "updatedAt" to current timestamp on row update';
