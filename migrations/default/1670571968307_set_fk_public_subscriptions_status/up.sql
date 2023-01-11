alter table "public"."subscriptions"
  add constraint "subscriptions_status_fkey"
  foreign key ("status")
  references "public"."subscription_status"
  ("status") on update restrict on delete restrict;
