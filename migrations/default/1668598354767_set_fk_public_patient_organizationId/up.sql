alter table "public"."patient"
  add constraint "patient_organizationId_fkey"
  foreign key ("organizationId")
  references "public"."organization"
  ("id") on update restrict on delete restrict;
