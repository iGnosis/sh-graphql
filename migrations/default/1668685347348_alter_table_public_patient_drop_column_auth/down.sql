alter table "public"."patient" alter column "auth" drop not null;
alter table "public"."patient" add column "auth" jsonb;
