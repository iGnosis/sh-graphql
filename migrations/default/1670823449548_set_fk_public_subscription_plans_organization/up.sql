alter table "public"."subscription_plans"
  add constraint "subscription_plans_organization_fkey"
  foreign key ("organization")
  references "public"."organization"
  ("id") on update restrict on delete restrict;
