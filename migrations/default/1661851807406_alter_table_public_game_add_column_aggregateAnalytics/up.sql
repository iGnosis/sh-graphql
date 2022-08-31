alter table "public"."game" add column "aggregateAnalytics" jsonb
 null default jsonb_build_object();
