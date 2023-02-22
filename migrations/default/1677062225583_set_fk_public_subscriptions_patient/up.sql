alter table "public"."subscriptions"
  add constraint "subscriptions_patient_fkey"
  foreign key ("patient")
  references "public"."patient"
  ("id") on update restrict on delete restrict;
