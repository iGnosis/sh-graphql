CREATE EXTENSION IF NOT EXISTS pgcrypto;
alter table "public"."patient" add column "onboardingCode" uuid
 null default gen_random_uuid();
