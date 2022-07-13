alter table "public"."checkin"
  add constraint "checkin_mood_fkey"
  foreign key ("mood")
  references "public"."mood"
  ("name") on update restrict on delete restrict;
