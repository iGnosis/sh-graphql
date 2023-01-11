alter table "public"."subscription_plans"
  add constraint "subscription_plans_organizationId_fkey"
  foreign key ("organizationId")
  references "public"."organization"
  ("id") on update restrict on delete restrict;
