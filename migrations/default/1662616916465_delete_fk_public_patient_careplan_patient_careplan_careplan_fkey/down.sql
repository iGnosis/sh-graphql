alter table "public"."patient_careplan"
  add constraint "patient_careplan_careplan_fkey"
  foreign key ("careplan")
  references "public"."careplan"
  ("id") on update restrict on delete set null;
