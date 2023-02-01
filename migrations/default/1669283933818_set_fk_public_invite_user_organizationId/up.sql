alter table "public"."invite_user"
  add constraint "invite_user_organizationId_fkey"
  foreign key ("organizationId")
  references "public"."organization"
  ("id") on update restrict on delete restrict;
