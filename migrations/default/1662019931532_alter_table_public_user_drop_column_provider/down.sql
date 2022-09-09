comment on column "public"."user"."provider" is E'Patient | Therapist | Admins';
alter table "public"."user"
  add constraint "user_provider_fkey"
  foreign key (provider)
  references "public"."provider"
  (id) on update restrict on delete restrict;
alter table "public"."user" alter column "provider" drop not null;
alter table "public"."user" add column "provider" uuid;
