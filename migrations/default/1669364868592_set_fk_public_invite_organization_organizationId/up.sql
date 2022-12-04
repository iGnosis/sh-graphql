alter table "public"."invite_organization"
  add constraint "invite_organization_organizationId_fkey"
  foreign key ("organizationId")
  references "public"."organization"
  ("id") on update restrict on delete restrict;
