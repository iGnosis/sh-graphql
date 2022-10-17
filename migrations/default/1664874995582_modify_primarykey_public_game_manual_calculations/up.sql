BEGIN TRANSACTION;
ALTER TABLE "public"."game_manual_calculations" DROP CONSTRAINT "game_manual_calculations_pkey";

ALTER TABLE "public"."game_manual_calculations"
    ADD CONSTRAINT "game_manual_calculations_pkey" PRIMARY KEY ("id");
COMMIT TRANSACTION;
