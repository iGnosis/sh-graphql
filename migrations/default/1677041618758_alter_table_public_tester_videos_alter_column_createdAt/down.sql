alter table "public"."tester_videos" rename column "startedAt" to "createdAt";
alter table "public"."tester_videos" alter column "createdAt" set default now();
