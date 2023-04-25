alter table "public"."patient_badge"
  add constraint "patient_badge_badge_fkey"
  foreign key ("badge")
  references "public"."badge"
  ("id") on update restrict on delete restrict;
