alter table "public"."badge"
  add constraint "badge_badgeType_fkey"
  foreign key ("badgeType")
  references "public"."badge_type"
  ("type") on update restrict on delete restrict;
