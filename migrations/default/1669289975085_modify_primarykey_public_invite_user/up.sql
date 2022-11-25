BEGIN TRANSACTION;
ALTER TABLE "public"."invite_user" DROP CONSTRAINT "invite_user_pkey";

ALTER TABLE "public"."invite_user"
    ADD CONSTRAINT "invite_user_pkey" PRIMARY KEY ("id");
COMMIT TRANSACTION;
