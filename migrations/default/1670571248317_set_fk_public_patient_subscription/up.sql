alter table "public"."patient"
  add constraint "patient_subscription_fkey"
  foreign key ("subscription")
  references "public"."subscriptions"
  ("subscriptionId") on update restrict on delete restrict;
