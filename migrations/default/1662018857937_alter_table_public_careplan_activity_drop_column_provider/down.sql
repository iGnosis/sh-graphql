comment on column "public"."careplan_activity"."provider" is E'M2M table for saving relation between activities and careplans';
alter table "public"."careplan_activity"
  add constraint "careplan_activity_provider_fkey"
  foreign key (provider)
  references "public"."provider"
  (id) on update restrict on delete restrict;
alter table "public"."careplan_activity" alter column "provider" drop not null;
alter table "public"."careplan_activity" add column "provider" uuid;
