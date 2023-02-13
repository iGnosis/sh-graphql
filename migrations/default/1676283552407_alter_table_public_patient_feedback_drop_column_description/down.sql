comment on column "public"."patient_feedback"."description" is E'Stores patients\' feedback.';
alter table "public"."patient_feedback" alter column "description" drop not null;
alter table "public"."patient_feedback" add column "description" text;
