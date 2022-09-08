alter table "public"."patient_careplan"
  add constraint "patient_careplan_patient_fkey"
  foreign key ("patient")
  references "public"."patient"
  ("id") on update restrict on delete cascade;
