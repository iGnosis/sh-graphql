alter table "public"."patient_feedback" drop constraint "Feedback Recommendation Score";
alter table "public"."patient_feedback" add constraint "Feedback Recommendation Score" check (CHECK ("recommendationScore" >= 0 AND "recommendationScore" <= 5));
