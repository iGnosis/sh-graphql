BEGIN TRANSACTION;
ALTER TABLE "public"."game_benchmark_config" DROP CONSTRAINT "game_benchmark_config_pkey";

ALTER TABLE "public"."game_benchmark_config"
    ADD CONSTRAINT "game_benchmark_config_pkey" PRIMARY KEY ("id");
COMMIT TRANSACTION;
