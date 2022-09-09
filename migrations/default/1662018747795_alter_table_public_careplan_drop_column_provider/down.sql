alter table "public"."careplan"
  add constraint "careplan_provider_fkey"
  foreign key (provider)
  references "public"."provider"
  (id) on update restrict on delete restrict;
alter table "public"."careplan" alter column "provider" drop not null;
alter table "public"."careplan" add column "provider" uuid;
