alter table "public"."patient"
  add constraint "patient_status_fkey"
  foreign key ("status")
  references "public"."staff_status"
  ("name") on update restrict on delete restrict;
