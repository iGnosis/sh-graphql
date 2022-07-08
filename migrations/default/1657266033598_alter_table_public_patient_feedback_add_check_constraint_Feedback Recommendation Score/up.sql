alter table "public"."patient_feedback" add constraint "Feedback Recommendation Score" check (patient_feedback."recommendationScore" >= 0 AND
patient_feedback."recommendationScore" <= 5);
