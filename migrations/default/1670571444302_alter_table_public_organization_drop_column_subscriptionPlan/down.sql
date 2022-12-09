alter table "public"."organization" add constraint "organization_subscriptionPlan_key" unique (subscriptionPlan);
alter table "public"."organization" alter column "subscriptionPlan" drop not null;
alter table "public"."organization" add column "subscriptionPlan" text;
