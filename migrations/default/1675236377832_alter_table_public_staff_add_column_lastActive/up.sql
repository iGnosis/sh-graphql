alter table "public"."staff" add column "lastActive" timestamptz
 null default now();
