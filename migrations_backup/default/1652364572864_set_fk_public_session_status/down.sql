alter table "public"."session" drop constraint "session_status_fkey",
  add constraint "session_status_fkey"
  foreign key ("status")
  references "public"."session_type"
  ("name") on update restrict on delete restrict;
