alter table "public"."game_benchmark_config" drop constraint "game_benchmark_config_pkey";
alter table "public"."game_benchmark_config"
    add constraint "game_benchmark_config_pkey"
    primary key ("originalGameId", "id");
