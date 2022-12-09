alter table "public"."organization"
  add constraint "organization_subscriptionPlan_fkey"
  foreign key ("subscriptionPlan")
  references "public"."subscription_plans"
  ("id") on update restrict on delete restrict;
