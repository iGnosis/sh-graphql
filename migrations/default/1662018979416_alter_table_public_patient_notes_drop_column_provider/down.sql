alter table "public"."patient_notes"
  add constraint "patient_notes_provider_fkey"
  foreign key (provider)
  references "public"."provider"
  (id) on update restrict on delete restrict;
alter table "public"."patient_notes" alter column "provider" drop not null;
alter table "public"."patient_notes" add column "provider" uuid;
