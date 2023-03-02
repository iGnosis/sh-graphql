ALTER TABLE "public"."tester_videos" ALTER COLUMN "createdAt" drop default;
alter table "public"."tester_videos" rename column "createdAt" to "startedAt";
