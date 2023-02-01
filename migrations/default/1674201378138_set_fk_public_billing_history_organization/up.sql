alter table "public"."billing_history"
  add constraint "billing_history_organization_fkey"
  foreign key ("organization")
  references "public"."organization"
  ("id") on update restrict on delete restrict;
