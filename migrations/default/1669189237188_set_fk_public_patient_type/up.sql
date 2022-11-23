alter table "public"."patient"
  add constraint "patient_type_fkey"
  foreign key ("type")
  references "public"."user_type"
  ("name") on update restrict on delete restrict;
