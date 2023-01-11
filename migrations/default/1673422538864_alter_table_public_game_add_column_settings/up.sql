alter table "public"."game" add column "settings" jsonb
 null default jsonb_build_object();
