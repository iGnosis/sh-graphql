alter table "public"."staff" add column IF NOT EXISTS "lastActive" timestamptz
 null default now();
