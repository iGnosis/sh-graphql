CREATE EXTENSION IF NOT EXISTS pgcrypto;
alter table "public"."game_benchmark_config" add column "id" uuid
 null default gen_random_uuid();
