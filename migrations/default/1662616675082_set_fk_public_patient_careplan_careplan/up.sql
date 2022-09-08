alter table "public"."patient_careplan" drop constraint "patient_careplan_careplan_fkey",
  add constraint "patient_careplan_careplan_fkey"
  foreign key ("careplan")
  references "public"."careplan"
  ("id") on update restrict on delete set null;
