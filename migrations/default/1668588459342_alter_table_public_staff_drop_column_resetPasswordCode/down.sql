comment on column "public"."staff"."resetPasswordCode" is E'Patient | Therapist | Admins';
alter table "public"."staff" alter column "resetPasswordCode" drop not null;
alter table "public"."staff" add column "resetPasswordCode" text;
