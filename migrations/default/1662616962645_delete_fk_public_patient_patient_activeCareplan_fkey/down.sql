alter table "public"."patient"
  add constraint "patient_activeCareplan_fkey"
  foreign key ("activeCareplan")
  references "public"."careplan"
  ("id") on update restrict on delete set null;
