alter table "public"."patient" alter column "type" drop not null;
alter table "public"."patient" add column "type" text;
