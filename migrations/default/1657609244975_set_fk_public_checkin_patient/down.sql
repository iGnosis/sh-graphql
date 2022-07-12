alter table "public"."checkin" drop constraint "checkin_patient_fkey",
  add constraint "checkin_id_fkey"
  foreign key ("id")
  references "public"."patient"
  ("id") on update restrict on delete restrict;
