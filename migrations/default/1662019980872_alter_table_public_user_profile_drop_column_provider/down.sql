alter table "public"."user_profile"
  add constraint "user_profile_provider_fkey"
  foreign key (provider)
  references "public"."provider"
  (id) on update restrict on delete restrict;
alter table "public"."user_profile" alter column "provider" drop not null;
alter table "public"."user_profile" add column "provider" uuid;
