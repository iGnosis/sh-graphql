comment on column "public"."patient_feedback"."recommendationScore" is E'Stores patients\' feedback.';
alter table "public"."patient_feedback" alter column "recommendationScore" drop not null;
alter table "public"."patient_feedback" add column "recommendationScore" int4;
