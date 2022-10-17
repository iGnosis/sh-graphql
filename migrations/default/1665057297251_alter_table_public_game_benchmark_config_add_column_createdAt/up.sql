alter table "public"."game_benchmark_config" add column "createdAt" timestamptz
 null default now();
