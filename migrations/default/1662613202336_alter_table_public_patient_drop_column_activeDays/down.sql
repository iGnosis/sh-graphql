alter table "public"."patient" alter column "activeDays" set default 0;
alter table "public"."patient" alter column "activeDays" drop not null;
alter table "public"."patient" add column "activeDays" int4;
