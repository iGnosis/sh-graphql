alter table "public"."subscription_plans" add constraint "subscription_plans_organizationId_key" unique (organizationId);
alter table "public"."subscription_plans" alter column "organizationId" drop not null;
alter table "public"."subscription_plans" add column "organizationId" uuid;
