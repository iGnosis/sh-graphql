alter table "public"."checkin"
  add constraint "checkin_type_fkey"
  foreign key ("type")
  references "public"."checkin_type"
  ("name") on update restrict on delete restrict;
