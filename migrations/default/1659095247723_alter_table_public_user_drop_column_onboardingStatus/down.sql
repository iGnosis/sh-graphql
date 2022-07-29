comment on column "public"."user"."onboardingStatus" is E'Patient | Therapist | Admins';
alter table "public"."user" alter column "onboardingStatus" drop not null;
alter table "public"."user" add column "onboardingStatus" jsonb;
