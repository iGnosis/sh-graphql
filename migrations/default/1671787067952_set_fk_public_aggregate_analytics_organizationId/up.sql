alter table "public"."aggregate_analytics"
  add constraint "aggregate_analytics_organizationId_fkey"
  foreign key ("organizationId")
  references "public"."organization"
  ("id") on update restrict on delete restrict;
