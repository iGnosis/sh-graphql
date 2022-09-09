comment on column "public"."subscription"."provider" is E'Patient subscriptions';
alter table "public"."subscription"
  add constraint "subscription_provider_fkey"
  foreign key (provider)
  references "public"."provider"
  (id) on update restrict on delete restrict;
alter table "public"."subscription" alter column "provider" drop not null;
alter table "public"."subscription" add column "provider" uuid;
