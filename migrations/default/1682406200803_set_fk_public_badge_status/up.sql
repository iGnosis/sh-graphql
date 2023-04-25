alter table "public"."badge"
  add constraint "badge_status_fkey"
  foreign key ("status")
  references "public"."badge_status"
  ("status") on update restrict on delete restrict;
