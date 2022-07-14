alter table "public"."patient_feedback" add constraint "Feedback Rating" check (patient_feedback.rating >= 0 AND patient_feedback.rating <= 0);
