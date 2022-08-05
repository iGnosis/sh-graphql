alter table "public"."patient" alter column "onboardingStatus" set default jsonb_build_object();
