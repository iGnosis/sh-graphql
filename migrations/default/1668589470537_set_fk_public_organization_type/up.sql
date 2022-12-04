alter table "public"."organization" drop constraint "organization_type_fkey",
  add constraint "organization_type_fkey"
  foreign key ("type")
  references "public"."organization_type"
  ("name") on update restrict on delete restrict;
