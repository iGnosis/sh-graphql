BEGIN TRANSACTION;
ALTER TABLE "public"."game_benchmarks" DROP CONSTRAINT "game_benchmarks_pkey";

ALTER TABLE "public"."game_benchmarks"
    ADD CONSTRAINT "game_benchmarks_pkey" PRIMARY KEY ("id");
COMMIT TRANSACTION;
