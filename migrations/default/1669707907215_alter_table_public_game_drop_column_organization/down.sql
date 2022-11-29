alter table "public"."game" alter column "organization" drop not null;
alter table "public"."game" add column "organization" text;
