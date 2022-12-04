comment on column "public"."staff"."password" is E'Patient | Therapist | Admins';
alter table "public"."staff" alter column "password" drop not null;
alter table "public"."staff" add column "password" text;
