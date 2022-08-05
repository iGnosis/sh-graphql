alter table "public"."patient_feedback" drop constraint "Feedback Rating";
alter table "public"."patient_feedback" add constraint "Feedback Rating" check (rating >= 0 AND rating <= 5);
