alter table "public"."badge"
  add constraint "badge_dimension_fkey"
  foreign key ("dimension")
  references "public"."badge_dimension"
  ("name") on update restrict on delete restrict;
