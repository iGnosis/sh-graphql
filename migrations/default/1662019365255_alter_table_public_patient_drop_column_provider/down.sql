alter table "public"."patient" add constraint "patient_provider_identifier_key" unique (provider, identifier);
alter table "public"."patient"
  add constraint "patient_provider_fkey"
  foreign key (provider)
  references "public"."provider"
  (id) on update restrict on delete restrict;
alter table "public"."patient" alter column "provider" drop not null;
alter table "public"."patient" add column "provider" uuid;
