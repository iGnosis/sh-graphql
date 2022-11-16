alter table "public"."staff"
  add constraint "staff_organizationId_fkey"
  foreign key ("organizationId")
  references "public"."organization"
  ("id") on update restrict on delete restrict;
