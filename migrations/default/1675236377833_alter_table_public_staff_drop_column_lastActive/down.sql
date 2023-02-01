comment on column "public"."staff"."lastActive" is E'Patient | Therapist | Admins';
alter table "public"."staff" alter column "lastActive" set default now();
alter table "public"."staff" alter column "lastActive" drop not null;
alter table "public"."staff" add column "lastActive" timestamptz;
