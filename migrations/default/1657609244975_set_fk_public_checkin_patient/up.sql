alter table "public"."checkin" drop constraint "checkin_id_fkey",
  add constraint "checkin_patient_fkey"
  foreign key ("patient")
  references "public"."patient"
  ("id") on update restrict on delete restrict;
