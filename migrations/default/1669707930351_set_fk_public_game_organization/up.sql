alter table "public"."game"
  add constraint "game_organization_fkey"
  foreign key ("organization")
  references "public"."organization"
  ("id") on update restrict on delete restrict;
