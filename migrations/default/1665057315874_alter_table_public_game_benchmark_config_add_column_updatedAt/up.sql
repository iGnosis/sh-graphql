alter table "public"."game_benchmark_config" add column "updatedAt" timestamptz
 not null default now();
