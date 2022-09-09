alter table "public"."patient_careplan" alter column "provider" drop not null;
alter table "public"."patient_careplan" add column "provider" uuid;
