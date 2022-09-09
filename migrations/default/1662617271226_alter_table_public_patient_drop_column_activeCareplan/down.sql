alter table "public"."patient" alter column "activeCareplan" drop not null;
alter table "public"."patient" add column "activeCareplan" uuid;
