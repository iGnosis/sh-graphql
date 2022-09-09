alter table "public"."session" drop constraint "session_careplan_fkey",
  add constraint "session_careplan_fkey"
  foreign key ("careplan")
  references "public"."careplan"
  ("id") on update restrict on delete set null;
