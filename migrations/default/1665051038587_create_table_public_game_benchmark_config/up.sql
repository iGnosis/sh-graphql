CREATE TABLE "public"."game_benchmark_config" ("originalGameId" uuid NOT NULL, "manualCalculations" jsonb, "rawVideoUrl" text, "screenRecordingUrl" text, PRIMARY KEY ("originalGameId") , FOREIGN KEY ("originalGameId") REFERENCES "public"."game"("id") ON UPDATE restrict ON DELETE restrict, UNIQUE ("originalGameId"));COMMENT ON TABLE "public"."game_benchmark_config" IS E'Stores game benchmark configurations.';
