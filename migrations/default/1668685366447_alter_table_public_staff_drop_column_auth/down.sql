comment on column "public"."staff"."auth" is E'Patient | Therapist | Admins';
alter table "public"."staff" alter column "auth" drop not null;
alter table "public"."staff" add column "auth" jsonb;
