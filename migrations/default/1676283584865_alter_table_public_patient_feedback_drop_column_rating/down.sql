comment on column "public"."patient_feedback"."rating" is E'Stores patients\' feedback.';
alter table "public"."patient_feedback" alter column "rating" drop not null;
alter table "public"."patient_feedback" add column "rating" int4;
