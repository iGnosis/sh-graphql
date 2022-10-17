alter table "public"."game_benchmarks" drop constraint "game_benchmarks_pkey";
alter table "public"."game_benchmarks"
    add constraint "game_benchmarks_pkey"
    primary key ("gameId");
