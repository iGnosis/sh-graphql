alter table "public"."session"
  add constraint "session_provider_fkey"
  foreign key (provider)
  references "public"."provider"
  (id) on update restrict on delete restrict;
alter table "public"."session" alter column "provider" drop not null;
alter table "public"."session" add column "provider" uuid;
