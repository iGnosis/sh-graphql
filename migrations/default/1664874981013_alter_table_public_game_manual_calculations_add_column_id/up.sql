CREATE EXTENSION IF NOT EXISTS pgcrypto;
alter table "public"."game_manual_calculations" add column "id" uuid
 null default gen_random_uuid();
