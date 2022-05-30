alter table "public"."session"
  add constraint "session_status_fkey"
  foreign key ("status")
  references "public"."session_type"
  ("name") on update restrict on delete restrict;
