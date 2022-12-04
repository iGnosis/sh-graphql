comment on column "public"."staff"."resetPasswordExpiry" is E'Patient | Therapist | Admins';
alter table "public"."staff" alter column "resetPasswordExpiry" drop not null;
alter table "public"."staff" add column "resetPasswordExpiry" timestamptz;
