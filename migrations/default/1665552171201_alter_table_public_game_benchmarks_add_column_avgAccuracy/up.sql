alter table "public"."game_benchmarks" add column "avgAccuracy" jsonb
 null default jsonb_build_object();
