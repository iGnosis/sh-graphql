alter table "public"."badge"
  add constraint "badge_tier_fkey"
  foreign key ("tier")
  references "public"."badge_tier"
  ("tier") on update restrict on delete restrict;
