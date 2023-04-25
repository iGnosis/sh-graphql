alter table "public"."badge"
  add constraint "badge_metric_fkey"
  foreign key ("metric")
  references "public"."badge_metrics"
  ("name") on update restrict on delete restrict;
