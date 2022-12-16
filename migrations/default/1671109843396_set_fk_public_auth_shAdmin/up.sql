alter table "public"."auth"
  add constraint "auth_shAdmin_fkey"
  foreign key ("shAdmin")
  references "public"."sh_admin"
  ("id") on update restrict on delete restrict;
