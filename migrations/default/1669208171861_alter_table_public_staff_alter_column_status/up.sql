ALTER TABLE "public"."staff" ALTER COLUMN "status" drop default;
alter table "public"."staff" alter column "status" drop not null;
