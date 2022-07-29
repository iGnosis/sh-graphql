alter table "public"."game" alter column "onboardingStatus" drop not null;
alter table "public"."game" add column "onboardingStatus" jsonb;
