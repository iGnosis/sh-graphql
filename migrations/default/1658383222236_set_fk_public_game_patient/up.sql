alter table "public"."game"
  add constraint "game_patient_fkey"
  foreign key ("patient")
  references "public"."patient"
  ("id") on update restrict on delete restrict;
