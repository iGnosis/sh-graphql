alter table "public"."game_benchmarks" add column "systemSpec" jsonb
 null default jsonb_build_object();
