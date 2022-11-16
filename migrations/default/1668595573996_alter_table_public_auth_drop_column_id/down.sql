alter table "public"."auth" alter column "id" set default gen_random_uuid();
alter table "public"."auth" alter column "id" drop not null;
alter table "public"."auth" add column "id" uuid;
